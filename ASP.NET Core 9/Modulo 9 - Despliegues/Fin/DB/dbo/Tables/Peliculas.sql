CREATE TABLE [dbo].[Peliculas] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [Titulo]           NVARCHAR (150) NOT NULL,
    [EnCines]          BIT            NOT NULL,
    [FechaLanzamiento] DATETIME2 (7)  NOT NULL,
    [Poster]           NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

