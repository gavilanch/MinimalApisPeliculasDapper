using AutoMapper;
using Microsoft.AspNetCore.OutputCaching;
using MinimalAPIPeliculas.Repositorios;

namespace MinimalAPIPeliculas.DTOs
{
    public struct CrearGeneroPeticionDTO
    {
        public IRepositorioGeneros RepositorioGeneros { get; set; }
        public IOutputCacheStore OutputCacheStore { get; set; }
        public IMapper Mapper { get; set; }
    }
}
