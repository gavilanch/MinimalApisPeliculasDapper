CREATE TABLE [dbo].[UsuariosClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_UsuariosClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UsuariosClaims_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE
);

