using FluentValidation;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.OutputCaching;
using MinimalAPIPeliculas.Endpoints;
using MinimalAPIPeliculas.Entidades;
using MinimalAPIPeliculas.Repositorios;
using MinimalAPIPeliculas.Servicios;

var builder = WebApplication.CreateBuilder(args);
var origenesPermitidos = builder.Configuration.GetValue<string>("origenespermitidos")!;
// Inicio de �rea de los servicios

builder.Services.AddCors(opciones =>
{
    opciones.AddDefaultPolicy(configuracion =>
    {
        configuracion.WithOrigins(origenesPermitidos).AllowAnyHeader().AllowAnyMethod();
    });

    opciones.AddPolicy("libre", configuracion =>
    {
        configuracion.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});

builder.Services.AddOutputCache();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<IRepositorioGeneros, RepositorioGeneros>();
builder.Services.AddScoped<IRepositorioActores, RepositorioActores>();
builder.Services.AddScoped<IRepositorioPeliculas, RepositorioPeliculas>();
builder.Services.AddScoped<IRepositorioComentarios, RepositorioComentarios>();
builder.Services.AddScoped<IRepositorioErrores, RepositorioErrores>();

builder.Services.AddTransient<IAlmacenadorArchivos, AlmacenadorArchivosLocal>();
builder.Services.AddHttpContextAccessor();

builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddValidatorsFromAssemblyContaining<Program>();
builder.Services.AddProblemDetails();

// Fin de �rea de los servicios

var app = builder.Build();
// Inicio de �rea de los middleware

//if (builder.Environment.IsDevelopment())
//{
   
//}

app.UseSwagger();
app.UseSwaggerUI();

app.UseExceptionHandler(exceptionHandlerApp
    => exceptionHandlerApp.Run(async context
        =>
    {

        var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerFeature>();

        var excepcion = exceptionHandlerFeature?.Error!;

        var error = new Error();
        error.Fecha = DateTime.UtcNow;
        error.MensajeDeError = excepcion.Message;
        error.StackTrace = excepcion.StackTrace;

        var repositorio = context.RequestServices.GetRequiredService<IRepositorioErrores>();
        await repositorio.Crear(error);

        await Results.BadRequest(new { tipo = "error", mensaje = "Ha ocurrido un mensaje de error inesperado", estatus = 500 }).ExecuteAsync(context);
    }));


app.UseStatusCodePages();


app.UseStaticFiles();

app.UseCors();

app.UseOutputCache();

app.MapGet("/", [EnableCors(policyName: "libre")] () => "�Hola, mundo!");

app.MapGet("/error", ()
    =>
{
    throw new InvalidOperationException("error de ejemplo");
});


app.MapGroup("/generos").MapGeneros();
app.MapGroup("/actores").MapActores();
app.MapGroup("/peliculas").MapPeliculas();
app.MapGroup("/pelicula/{peliculaId:int}/comentarios").MapComentarios();

// Fin de �rea de los middleware
app.Run();
