USE [MinimalPeliculasAPI]
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoActores]    Script Date: 02-Jan-24 9:42:53 AM ******/
CREATE TYPE [dbo].[ListadoActores] AS TABLE(
	[ActorId] [int] NULL,
	[Personaje] [nvarchar](150) NULL,
	[Orden] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoEnteros]    Script Date: 02-Jan-24 9:42:53 AM ******/
CREATE TYPE [dbo].[ListadoEnteros] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  Table [dbo].[ActoresPeliculas]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  Table [dbo].[Comentarios]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [nvarchar](max) NOT NULL,
	[PeliculaId] [int] NOT NULL,
	[UsuarioId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[Id] [uniqueidentifier] NOT NULL,
	[MensajeDeError] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Fecha] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Errores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  Table [dbo].[GenerosPeliculas]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesClaims]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RolesClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosClaims]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsuariosClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosLogins]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsuariosLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosRoles]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsuariosRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosTokens]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsuariosTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Errores] ADD  CONSTRAINT [DF_Errores_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_EmailConfirmed]  DEFAULT ('false') FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_PhoneNumberConfirmed]  DEFAULT ('false') FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_TwoFactorEnabled]  DEFAULT ('false') FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_LockoutEnabled]  DEFAULT ('false') FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_AccessFailedCount]  DEFAULT ((0)) FOR [AccessFailedCount]
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
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Comentarios] FOREIGN KEY([Id])
REFERENCES [dbo].[Comentarios] ([Id])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Comentarios]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Peliculas]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Usuarios]
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
ALTER TABLE [dbo].[RolesClaims]  WITH CHECK ADD  CONSTRAINT [FK_RolesClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolesClaims] CHECK CONSTRAINT [FK_RolesClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsuariosClaims]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosClaims_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosClaims] CHECK CONSTRAINT [FK_UsuariosClaims_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosLogins]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosLogins_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosLogins] CHECK CONSTRAINT [FK_UsuariosLogins_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosTokens]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosTokens_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosTokens] CHECK CONSTRAINT [FK_UsuariosTokens_Usuarios_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Actores_Actualizar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_Borrar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_Cantidad]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_ExistePorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorNombre]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerTodos]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerVariosPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Comentarios_Actualizar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Comentarios_Borrar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Comentarios_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
	@PeliculaId int,
	@UsuarioId nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comentarios(Cuerpo, PeliculaId, UsuarioId)
	VALUES (@Cuerpo, @PeliculaId, @UsuarioId);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ExistePorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerTodos]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Errores_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Errores_Crear]
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
GO
/****** Object:  StoredProcedure [dbo].[Generos_Actualizar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_Borrar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_ExistePorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_ExistePorIdYNombre]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ExistePorIdYNombre]
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
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerTodos]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerVariosPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_Actualizar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarActores]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarGeneros]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_Borrar]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_Cantidad]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_ExistePorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_ObtenerPorId]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Peliculas_ObtenerTodos]    Script Date: 02-Jan-24 9:42:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Usuarios_BuscarPorEmail]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_BuscarPorEmail]
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
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Crear]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_Crear]
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
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_ObtenerClaims]    Script Date: 02-Jan-24 9:42:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_ObtenerClaims]
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
GO
