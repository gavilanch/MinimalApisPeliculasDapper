-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Filtrar]
	-- Add the parameters for the stored procedure here
	@pagina int,
	@recordsPorPagina int,
	@titulo nvarchar(150),
	@generoId int,
	@proximosEstrenos bit,
	@enCines bit,
	@campoOrdenar nvarchar(150),
	@ordenAscendente bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	WHERE (Titulo like '%' + @titulo +'%' OR @titulo = '')
	AND (FechaLanzamiento > GETDATE() OR @proximosEstrenos = 'False')
	AND (EnCines = 'True' OR @enCines = 'False')
	AND (Id in (SELECT PeliculaId FROM GenerosPeliculas WHERE GeneroId = @generoId) OR @generoId = 0)
	ORDER BY 
		CASE
			WHEN @campoOrdenar = 'Titulo' AND @ordenAscendente = 'True' THEN Titulo END ASC,
		CASE
			WHEN @campoOrdenar = 'Titulo' AND @ordenAscendente = 'False' THEN Titulo END DESC,
		CASE 
			WHEN @campoOrdenar = 'FechaLanzamiento' AND @ordenAscendente = 'True' THEN FechaLanzamiento end ASC,
		CASE 
		    WHEN @campoOrdenar = 'FechaLanzamiento' AND @ordenAscendente = 'False' THEN FechaLanzamiento end DESC
	OFFSET ((@pagina-1)*@recordsPorPagina) ROWS FETCH NEXT @recordsPorPagina ROWS ONLY
END
