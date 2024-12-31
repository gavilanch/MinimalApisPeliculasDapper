-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Generos_ObtenerVariosPorId
	-- Add the parameters for the stored procedure here
	@generosIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Generos
	WHERE Id in (Select Id from @generosIds);
END
