using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OutputCaching;
using MinimalAPIPeliculas.DTOs;
using MinimalAPIPeliculas.Entidades;
using MinimalAPIPeliculas.Filtros;
using MinimalAPIPeliculas.Repositorios;

namespace MinimalAPIPeliculas.Endpoints
{
    public static class GenerosEndpoints
    {
        public static RouteGroupBuilder MapGeneros(this RouteGroupBuilder group)
        {
            group.MapGet("/", ObtenerGeneros)
                .CacheOutput(c => c.Expire(TimeSpan.FromSeconds(60)).Tag("generos-get"))
                .RequireAuthorization();
            group.MapGet("/{id:int}", ObtenerGeneroPorId);
            group.MapPost("/", CrearGenero)
                .RequireAuthorization("esadmin")
                .AddEndpointFilter<FiltroValidaciones<CrearGeneroDTO>>();
            group.MapPut("/{id:int}", ActualizarGenero)
                .RequireAuthorization("esadmin")
                .AddEndpointFilter<FiltroValidaciones<CrearGeneroDTO>>();
            group.MapDelete("/{id:int}", BorrarGenero).RequireAuthorization("esadmin");
            return group;
        }

        static async Task<Ok<List<GeneroDTO>>> ObtenerGeneros(
            IRepositorioGeneros repositorio, IMapper mapper)
        {
            var generos = await repositorio.ObtenerTodos();
            var generosDTO = mapper.Map<List<GeneroDTO>>(generos);
            return TypedResults.Ok(generosDTO);
        }

        static async Task<Results<Ok<GeneroDTO>, NotFound>> ObtenerGeneroPorId(int id,
            IRepositorioGeneros repositorio, IMapper mapper)
        {
            var genero = await repositorio.ObtenerPorId(id);

            if (genero is null)
            {
                return TypedResults.NotFound();
            }

            var generoDTO = mapper.Map<GeneroDTO>(genero);

            return TypedResults.Ok(generoDTO);
        }

        static async Task<Results<Created<GeneroDTO>, ValidationProblem>> CrearGenero(CrearGeneroDTO crearGeneroDTO,
            IRepositorioGeneros repositorio, IOutputCacheStore outputCacheStore,
            IMapper mapper, IValidator<CrearGeneroDTO> validador)
        {
            var resultadoValidacion = await validador.ValidateAsync(crearGeneroDTO);

            if (!resultadoValidacion.IsValid)
            {
                return TypedResults.ValidationProblem(resultadoValidacion.ToDictionary());
            }

            var genero = mapper.Map<Genero>(crearGeneroDTO);
            var id = await repositorio.CrearGenero(genero);
            await outputCacheStore.EvictByTagAsync("generos-get", default);
            var generoDTO = mapper.Map<GeneroDTO>(genero);
            return TypedResults.Created($"/generos/{genero.Id}", generoDTO);
        }

        static async Task<Results<NotFound, NoContent, ValidationProblem>> 
            ActualizarGenero(int id,
            CrearGeneroDTO crearGeneroDTO,
           IRepositorioGeneros repositorio, IOutputCacheStore outputCacheStore,
           IMapper mapper, IValidator<CrearGeneroDTO> validador)
        {
            var resultadoValidacion = await validador.ValidateAsync(crearGeneroDTO);

            if (!resultadoValidacion.IsValid)
            {
                return TypedResults.ValidationProblem(resultadoValidacion.ToDictionary());
            }


            var existe = await repositorio.Existe(id);

            if (!existe)
            {
                return TypedResults.NotFound();
            }

            var genero = mapper.Map<Genero>(crearGeneroDTO);
            genero.Id = id;

            await repositorio.Actualizar(genero);
            await outputCacheStore.EvictByTagAsync("generos-get", default);
            return TypedResults.NoContent();
        }

        static async Task<Results<NotFound, NoContent>> BorrarGenero(int id,
            IRepositorioGeneros repositorio, IOutputCacheStore outputCacheStore)
        {
            var existe = await repositorio.Existe(id);

            if (!existe)
            {
                return TypedResults.NotFound();
            }

            await repositorio.Borrar(id);
            await outputCacheStore.EvictByTagAsync("generos-get", default);
            return TypedResults.NoContent();
        }
    }
}
