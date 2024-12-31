using Microsoft.IdentityModel.Tokens;

namespace MinimalAPIPeliculas.Utilidades
{
    public static class Llaves
    {
        public const string IssuerPropio = "nuestra-app";
        private const string SeccionLlaves = "Authentication:Schemes:Bearer:SigningKeys";
        private const string SeccionLlaves_Emisor = "Issuer";
        private const string SeccionLlaves_Valor = "Value";

        public static IEnumerable<SecurityKey> ObtenerLlave(IConfiguration configuration) => ObtenerLlave(configuration, IssuerPropio);

        public static IEnumerable<SecurityKey> ObtenerLlave(IConfiguration configuration, string issuer)
        {
            var signingKey = configuration.GetSection(SeccionLlaves)
                .GetChildren()
                .SingleOrDefault(key => key[SeccionLlaves_Emisor] == issuer);

            if (signingKey is not null && signingKey[SeccionLlaves_Valor] is string keyValue)
            {
                yield return new SymmetricSecurityKey(Convert.FromBase64String(keyValue));
            }
        }

        public static IEnumerable<SecurityKey> ObtenerTodasLasLlave(IConfiguration configuration)
        {
            var signingKeys = configuration.GetSection(SeccionLlaves)
                .GetChildren();

            foreach (var signingKey in signingKeys)
            {
                if (signingKey[SeccionLlaves_Valor] is string keyValue)
                {
                    yield return new SymmetricSecurityKey(Convert.FromBase64String(keyValue));
                }
            }
        }
    }

}
