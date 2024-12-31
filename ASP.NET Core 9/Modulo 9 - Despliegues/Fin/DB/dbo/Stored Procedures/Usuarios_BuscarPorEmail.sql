-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Usuarios_BuscarPorEmail
	-- Add the parameters for the stored procedure here
	@normalizedEmail nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Usuarios
	WHERE NormalizedEmail = @normalizedEmail;
END
