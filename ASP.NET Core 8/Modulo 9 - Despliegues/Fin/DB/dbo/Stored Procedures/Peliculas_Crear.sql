-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Peliculas_Crear
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Peliculas(Titulo, EnCines, FechaLanzamiento, Poster)
	VALUES (@Titulo, @EnCines, @FechaLanzamiento, @Poster);

	SELECT SCOPE_IDENTITY();
END
