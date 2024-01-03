-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Usuarios_ObtenerClaims
	-- Add the parameters for the stored procedure here
	@Id nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ClaimType as [Type], ClaimValue as [Value]
	FROM UsuariosClaims
	WHERE UserId = @Id;
END
