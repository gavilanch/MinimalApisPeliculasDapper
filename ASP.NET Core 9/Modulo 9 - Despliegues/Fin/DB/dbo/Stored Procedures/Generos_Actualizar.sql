-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Generos_Actualizar
	-- Add the parameters for the stored procedure here
	@Id int,
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Generos
    SET Nombre = @Nombre
    WHERE Id = @Id
END
