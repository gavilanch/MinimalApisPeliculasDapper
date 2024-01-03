-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Peliculas_AsignarActores
	-- Add the parameters for the stored procedure here
	@PeliculaId int,
	@actores ListadoActores READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE ActoresPeliculas WHERE PeliculaId = @PeliculaId;

	INSERT INTO ActoresPeliculas (ActorId, PeliculaId, Orden, Personaje)
	SELECT ActorId, @PeliculaId, Orden, Personaje FROM @actores;
END
