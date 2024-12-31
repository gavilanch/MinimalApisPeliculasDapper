-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Usuarios_Crear
	-- Add the parameters for the stored procedure here
	@Id nvarchar(450),
	@Email nvarchar(256),
	@NormalizedEmail nvarchar(256),
	@UserName nvarchar(256),
	@NormalizedUserName nvarchar(256),
	@PasswordHash nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Usuarios(Id, Email, NormalizedEmail, UserName, NormalizedUserName, PasswordHash)
	VALUES (@Id, @Email, @NormalizedEmail, @UserName, @NormalizedUserName, @PasswordHash);
END
