using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace MinimalAPIPeliculas.Repositorios
{
    public interface IRepositorioUsuarios
    {
        Task AsignarClaims(IdentityUser user, IEnumerable<Claim> claims);
        Task<IdentityUser?> BuscarUsuarioPorEmail(string normalizedEmail);
        Task<string> Crear(IdentityUser usuario);
        Task<List<Claim>> ObtenerClaims(IdentityUser user);
        Task RemoverClaims(IdentityUser user, IEnumerable<Claim> claims);
    }
}