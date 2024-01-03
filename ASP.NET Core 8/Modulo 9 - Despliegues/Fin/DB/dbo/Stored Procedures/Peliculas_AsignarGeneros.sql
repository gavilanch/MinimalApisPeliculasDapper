-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Peliculas_AsignarGeneros
	-- Add the parameters for the stored procedure here
	@peliculaId int,
	@generosIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE GenerosPeliculas WHERE PeliculaId = @peliculaId;

	INSERT INTO GenerosPeliculas (GeneroId, PeliculaId)
	SELECT Id, @peliculaId FROM @generosIds

END
