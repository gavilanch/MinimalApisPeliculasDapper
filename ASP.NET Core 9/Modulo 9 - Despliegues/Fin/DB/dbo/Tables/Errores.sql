CREATE TABLE [dbo].[Errores] (
    [Id]             UNIQUEIDENTIFIER CONSTRAINT [DF_Errores_Id] DEFAULT (newsequentialid()) NOT NULL,
    [MensajeDeError] NVARCHAR (MAX)   NOT NULL,
    [StackTrace]     NVARCHAR (MAX)   NULL,
    [Fecha]          DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_Errores] PRIMARY KEY CLUSTERED ([Id] ASC)
);

