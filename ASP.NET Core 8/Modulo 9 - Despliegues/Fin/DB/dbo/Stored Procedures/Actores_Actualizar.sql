-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Actores_Actualizar
	@Nombre nvarchar(150),
	@FechaNacimiento datetime2,
	@Foto nvarchar(max),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Actores
	SET Nombre = @Nombre, FechaNacimiento = @FechaNacimiento, Foto = @Foto
	WHERE Id = @Id
END
