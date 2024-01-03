-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Crear]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150),
	@FechaNacimiento datetime2,
	@Foto nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Actores(Nombre, FechaNacimiento, Foto)
	VALUES (@Nombre, @FechaNacimiento, @Foto)
	
	SELECT SCOPE_IDENTITY();
END
