-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Comentarios_Actualizar
	-- Add the parameters for the stored procedure here
	@Cuerpo nvarchar(max),
	@PeliculaId int,
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Comentarios
	SET Cuerpo = @Cuerpo, PeliculaId = @PeliculaId
	WHERE Id = @Id;
END
