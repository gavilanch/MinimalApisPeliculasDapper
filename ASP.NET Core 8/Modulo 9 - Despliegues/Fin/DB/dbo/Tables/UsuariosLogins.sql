CREATE TABLE [dbo].[UsuariosLogins] (
    [LoginProvider]       NVARCHAR (450) NOT NULL,
    [ProviderKey]         NVARCHAR (450) NOT NULL,
    [ProviderDisplayName] NVARCHAR (MAX) NULL,
    [UserId]              NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_UsuariosLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC),
    CONSTRAINT [FK_UsuariosLogins_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE
);

