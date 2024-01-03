using AutoMapper;
using MinimalAPIPeliculas.DTOs;
using MinimalAPIPeliculas.Entidades;

namespace MinimalAPIPeliculas.Utilidades
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<CrearGeneroDTO, Genero>();
            CreateMap<GeneroDTO, Genero>().ReverseMap();

            CreateMap<ActorDTO, Actor>().ReverseMap();
            CreateMap<CrearActorDTO, Actor>()
                    .ForMember(x => x.Foto, opciones => opciones.Ignore());

            CreateMap<PeliculaDTO, Pelicula>();

            CreateMap<Pelicula, PeliculaDTO>()
                .ForMember(x => x.Generos, entidad =>
                entidad.MapFrom(p =>
                p.GenerosPeliculas.Select(gp =>
                    new GeneroDTO { Id = gp.GeneroId, Nombre = gp.Genero.Nombre })))
                .ForMember(x => x.Actores, entidad =>
                entidad.MapFrom(p =>
                p.ActoresPeliculas.Select(ap => new ActorPeliculaDTO { Id = ap.ActorId,
                    Nombre = ap.Actor.Nombre, Personaje = ap.Personaje })));

            CreateMap<CrearPeliculaDTO, Pelicula>()
                    .ForMember(x => x.Poster, opciones => opciones.Ignore());

            CreateMap<ComentarioDTO, Comentario>().ReverseMap();
            CreateMap<CrearComentarioDTO, Comentario>();

            CreateMap<AsignarActorPeliculaDTO, ActorPelicula>();
        }
    }
}
