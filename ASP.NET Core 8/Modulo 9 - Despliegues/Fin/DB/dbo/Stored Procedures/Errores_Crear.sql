-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Errores_Crear
	-- Add the parameters for the stored procedure here
	@MensajeDeError nvarchar(max),
	@StackTrace nvarchar(max),
	@Fecha datetime2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Errores(MensajeDeError, StackTrace, Fecha)
	VALUES (@MensajeDeError, @StackTrace, @Fecha);
END
