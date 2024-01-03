CREATE TABLE [dbo].[Generos] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [Nombre] NVARCHAR (50) NOT NULL,
    [Prueba] NCHAR (10)    NULL,
    CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED ([Id] ASC)
);



