CREATE TABLE [dbo].[Actores] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]          NVARCHAR (150) NOT NULL,
    [FechaNacimiento] DATETIME2 (7)  NOT NULL,
    [Foto]            NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED ([Id] ASC)
);

