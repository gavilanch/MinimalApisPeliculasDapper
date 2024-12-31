using Microsoft.OpenApi.Any;

namespace MinimalAPIPeliculas.Utilidades
{
    public static class SwaggerExtensions
    {
        public static TBuilder AgregarParametrosPaginacionAOpenAPI<TBuilder>(
            this TBuilder builder) where TBuilder : IEndpointConventionBuilder
        {
            return builder.WithOpenApi(opciones =>
            {
                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "pagina",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(1)
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "recordsPorPagina",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(10)
                    }
                });
                return opciones;
            });

        }

        public static TBuilder AgregarParametrosPeliculasFiltroAOpenAPI<TBuilder>(this TBuilder builder) where TBuilder : IEndpointConventionBuilder
        {
            return builder.WithOpenApi(opciones =>
            {
                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "pagina",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(1)
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "recordsPorPagina",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(10)
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "titulo",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "string"
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "enCines",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "boolean"
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "proximosEstrenos",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "boolean"
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "generoId",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "integer"
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "campoOrdenar",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "string",
                        Enum = new List<IOpenApiAny>()
                        {
                            new OpenApiString("Titulo"),
                            new OpenApiString("FechaLanzamiento")
                        }
                    }
                });

                opciones.Parameters.Add(new Microsoft.OpenApi.Models.OpenApiParameter
                {
                    Name = "ordenAscendente",
                    In = Microsoft.OpenApi.Models.ParameterLocation.Query,
                    Schema = new Microsoft.OpenApi.Models.OpenApiSchema
                    {
                        Type = "boolean"
                    }
                });


                return opciones;
            });

        }

    }

}
