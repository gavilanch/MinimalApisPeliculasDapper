-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerTodos]
@pagina int,
@recordsPorPagina int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre, FechaNacimiento, Foto
	FROM Actores
	ORDER BY Nombre
	OFFSET ((@pagina - 1) * @recordsPorPagina) ROWS FETCH NEXT @recordsPorPagina ROWS ONLY
END
