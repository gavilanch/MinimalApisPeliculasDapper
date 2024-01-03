USE [MinimalPeliculasAPI]
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoActores]    Script Date: 29-Dec-23 3:22:14 PM ******/
CREATE TYPE [dbo].[ListadoActores] AS TABLE(
	[ActorId] [int] NULL,
	[Personaje] [nvarchar](150) NULL,
	[Orden] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoEnteros]    Script Date: 29-Dec-23 3:22:14 PM ******/
CREATE TYPE [dbo].[ListadoEnteros] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActoresPeliculas]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActoresPeliculas](
	[ActorId] [int] NOT NULL,
	[PeliculaId] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Personaje] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ActoresPeliculas] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[PeliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [nvarchar](max) NOT NULL,
	[PeliculaId] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenerosPeliculas]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenerosPeliculas](
	[PeliculaId] [int] NOT NULL,
	[GeneroId] [int] NOT NULL,
 CONSTRAINT [PK_GenerosPeliculas] PRIMARY KEY CLUSTERED 
(
	[PeliculaId] ASC,
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[EnCines] [bit] NOT NULL,
	[FechaLanzamiento] [datetime2](7) NOT NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActoresPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_ActoresPeliculas_Actores] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actores] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActoresPeliculas] CHECK CONSTRAINT [FK_ActoresPeliculas_Actores]
GO
ALTER TABLE [dbo].[ActoresPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_ActoresPeliculas_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActoresPeliculas] CHECK CONSTRAINT [FK_ActoresPeliculas_Peliculas]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Peliculas]
GO
ALTER TABLE [dbo].[GenerosPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_GenerosPeliculas_Generos] FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Generos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenerosPeliculas] CHECK CONSTRAINT [FK_GenerosPeliculas_Generos]
GO
ALTER TABLE [dbo].[GenerosPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_GenerosPeliculas_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenerosPeliculas] CHECK CONSTRAINT [FK_GenerosPeliculas_Peliculas]
GO
/****** Object:  StoredProcedure [dbo].[Actores_Actualizar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Actualizar]
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
GO
/****** Object:  StoredProcedure [dbo].[Actores_Borrar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Actores
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_Cantidad]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Cantidad]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Actores
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_Crear]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[Actores_ExistePorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ExistePorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select 1 FROM Actores WHERE Id = @Id)
		SELECT 1
	ELSE
		SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerPorId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Actores
	WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorNombre]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerPorNombre]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Actores
	WHERE Nombre LIKE '%' + @Nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerTodos]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerTodos]
@pagina int,
@recordsPorPagina int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre, FechaNacimiento, Foto
	FROM Actores
	ORDER BY Nombre
	OFFSET ((@pagina - 1) * @recordsPorPagina) ROWS FETCH NEXT @recordsPorPagina ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerVariosPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerVariosPorId]
	-- Add the parameters for the stored procedure here
	@actoresIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Actores
	WHERE Id in (Select Id from @actoresIds);
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Actualizar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Actualizar]
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
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Borrar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Comentarios WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Crear]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Crear]
	-- Add the parameters for the stored procedure here
	@Cuerpo nvarchar(max),
	@PeliculaId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comentarios(Cuerpo, PeliculaId)
	VALUES (@Cuerpo, @PeliculaId);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ExistePorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ExistePorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select 1 FROM Comentarios WHERE Id = @Id)
		SELECT 1;
	ELSE 
		SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ObtenerPorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Comentarios
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerTodos]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ObtenerTodos]
	-- Add the parameters for the stored procedure here
	@PeliculaId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Comentarios
	WHERE PeliculaId = @PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_Actualizar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Actualizar]
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
GO
/****** Object:  StoredProcedure [dbo].[Generos_Borrar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Generos 
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_Crear]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Crear]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Generos (Nombre)
	VALUES (@Nombre);

	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ExistePorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ExistePorId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Generos WHERE Id = @Id)
	    SELECT 1
	ELSE
		SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerPorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre
    FROM Generos
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerTodos]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerTodos] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre
	FROM Generos
	ORDER BY Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerVariosPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerVariosPorId]
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
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Actualizar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Actualizar]
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Peliculas
	SET Titulo = @Titulo, FechaLanzamiento = @FechaLanzamiento, Poster = @Poster,
	EnCines = @EnCines
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarActores]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_AsignarActores]
	-- Add the parameters for the stored procedure here
	@PeliculaId int,
	@actores ListadoActores READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE ActoresPeliculas WHERE PeliculaId = @PeliculaId;

	INSERT INTO ActoresPeliculas (ActorId, PeliculaId, Orden, Personaje)
	SELECT ActorId, @PeliculaId, Orden, Personaje FROM @actores;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarGeneros]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_AsignarGeneros]
	-- Add the parameters for the stored procedure here
	@peliculaId int,
	@generosIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE GenerosPeliculas WHERE PeliculaId = @peliculaId;

	INSERT INTO GenerosPeliculas (GeneroId, PeliculaId)
	SELECT Id, @peliculaId FROM @generosIds

END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Borrar]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Peliculas WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Cantidad]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Cantidad]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Peliculas;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Crear]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Crear]
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Peliculas(Titulo, EnCines, FechaLanzamiento, Poster)
	VALUES (@Titulo, @EnCines, @FechaLanzamiento, @Poster);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_ExistePorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_ExistePorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Peliculas WHERE Id = @Id)
		SELECT 1;
	ELSE
		SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_ObtenerPorId]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_ObtenerPorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	WHERE Id = @Id;

	SELECT *
	FROM Comentarios
	WHERE PeliculaId = @Id;

	SELECT Id, Nombre
	FROM Generos
	INNER JOIN GenerosPeliculas
	ON GenerosPeliculas.GeneroId = Id
	WHERE PeliculaId = @Id;

	SELECT Id, Nombre, Personaje
	FROM Actores
	INNER JOIN ActoresPeliculas
	ON ActoresPeliculas.ActorId = Id
	WHERE PeliculaId = @Id
	ORDER BY Orden

END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_ObtenerTodos]    Script Date: 29-Dec-23 3:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_ObtenerTodos]
	-- Add the parameters for the stored procedure here
	@Pagina int,
	@RecordsPorPagina int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	ORDER BY Titulo
	OFFSET ((@Pagina - 1)* @RecordsPorPagina) ROWS FETCH NEXT @RecordsPorPagina ROWS ONLY
END
GO
