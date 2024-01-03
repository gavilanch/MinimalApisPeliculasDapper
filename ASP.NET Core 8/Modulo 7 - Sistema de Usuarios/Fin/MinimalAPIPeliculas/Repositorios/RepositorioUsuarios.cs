using Dapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Security.Claims;

namespace MinimalAPIPeliculas.Repositorios
{
    public class RepositorioUsuarios : IRepositorioUsuarios
    {
        private readonly string connectionString;

        public RepositorioUsuarios(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        public async Task<IdentityUser?> BuscarUsuarioPorEmail(string normalizedEmail)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                return await conexion.QuerySingleOrDefaultAsync<IdentityUser>
                    ("Usuarios_BuscarPorEmail", new { normalizedEmail },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<string> Crear(IdentityUser usuario)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                usuario.Id = Guid.NewGuid().ToString();

                await conexion.ExecuteAsync("Usuarios_Crear", new
                {
                    usuario.Id,
                    usuario.Email,
                    usuario.NormalizedEmail,
                    usuario.UserName,
                    usuario.NormalizedUserName,
                    usuario.PasswordHash
                }, commandType: CommandType.StoredProcedure);

                return usuario.Id;
            }
        }

        public async Task<List<Claim>> ObtenerClaims(IdentityUser user)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var claims = await conexion.QueryAsync<Claim>("Usuarios_ObtenerClaims",
                    new { user.Id }, commandType: CommandType.StoredProcedure);
                return claims.ToList();
            }
        }

        public async Task AsignarClaims(IdentityUser user, IEnumerable<Claim> claims)
        {
            var sql = @"INSERT INTO UsuariosClaims (UserId, ClaimType, ClaimValue)
                        VALUES (@Id, @Type, @Value)";

            var parametros = claims.Select(x => new { user.Id, x.Type, x.Value });

            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.ExecuteAsync(sql, parametros);
            }
        }

        public async Task RemoverClaims(IdentityUser user, IEnumerable<Claim> claims)
        {
            var sql = @"DELETE UsuariosClaims WHERE UserId = @Id AND ClaimType = @Type";
            var parametros = claims.Select(x => new { user.Id, x.Type });

            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.ExecuteAsync(sql, parametros);
            }
        }
    }
}
