CREATE TABLE [catalogo].[Proveedor] (
    [numero_proveedor] INT          IDENTITY (1, 1) NOT NULL,
    [nombre_proveedor] VARCHAR (30) NOT NULL,
    [telefono_casa]    VARCHAR (10) NOT NULL,
    [telefono_celular] VARCHAR (10) NOT NULL,
    CONSTRAINT [Unique_Identifier3] PRIMARY KEY CLUSTERED ([numero_proveedor] ASC) ON [PedidoSecundary],
    CONSTRAINT [telefono1] UNIQUE NONCLUSTERED ([telefono_casa] ASC) ON [PedidoSecundary],
    CONSTRAINT [telefono2] UNIQUE NONCLUSTERED ([telefono_celular] ASC) ON [PedidoSecundary]
) ON [PedidoSecundary];

