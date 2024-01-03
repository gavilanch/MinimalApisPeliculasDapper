CREATE TABLE [dbo].[UsuariosTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (450) NOT NULL,
    [Name]          NVARCHAR (450) NOT NULL,
    [Value]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_UsuariosTokens] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC),
    CONSTRAINT [FK_UsuariosTokens_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE
);

