using AutoMapper;
using MinimalAPIPeliculas.Repositorios;

namespace MinimalAPIPeliculas.DTOs
{
public struct ObtenerGeneroPorIdPeticionDTO
{
    public int Id { get; set; }
    public IRepositorioGeneros Repositorio { get; set; }
    public IMapper Mapper { get; set; }
}
}
