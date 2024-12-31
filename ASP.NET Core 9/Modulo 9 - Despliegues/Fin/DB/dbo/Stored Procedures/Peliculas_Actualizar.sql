-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Peliculas_Actualizar
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Peliculas
	SET Titulo = @Titulo, FechaLanzamiento = @FechaLanzamiento, Poster = @Poster,
	EnCines = @EnCines
	WHERE Id = @Id;
END
