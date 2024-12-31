CREATE TABLE [dbo].[GenerosPeliculas] (
    [PeliculaId] INT NOT NULL,
    [GeneroId]   INT NOT NULL,
    CONSTRAINT [PK_GenerosPeliculas] PRIMARY KEY CLUSTERED ([PeliculaId] ASC, [GeneroId] ASC),
    CONSTRAINT [FK_GenerosPeliculas_Generos] FOREIGN KEY ([GeneroId]) REFERENCES [dbo].[Generos] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenerosPeliculas_Peliculas] FOREIGN KEY ([PeliculaId]) REFERENCES [dbo].[Peliculas] ([Id]) ON DELETE CASCADE
);

