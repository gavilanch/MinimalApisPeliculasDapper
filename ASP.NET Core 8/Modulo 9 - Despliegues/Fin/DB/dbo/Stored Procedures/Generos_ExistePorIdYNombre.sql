-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Generos_ExistePorIdYNombre
	-- Add the parameters for the stored procedure here
	@Id int,
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Generos WHERE Id <> @Id AND Nombre = @Nombre)
		SELECT 1;
	ELSE
		SELECT 0;
END
