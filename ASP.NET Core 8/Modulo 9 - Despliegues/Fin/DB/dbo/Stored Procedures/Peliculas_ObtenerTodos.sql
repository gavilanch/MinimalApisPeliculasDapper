-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Peliculas_ObtenerTodos
	-- Add the parameters for the stored procedure here
	@Pagina int,
	@RecordsPorPagina int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	ORDER BY Titulo
	OFFSET ((@Pagina - 1)* @RecordsPorPagina) ROWS FETCH NEXT @RecordsPorPagina ROWS ONLY
END
