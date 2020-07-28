CREATE TABLE [catalogo].[Cliente] (
    [numero_cliente] INT            IDENTITY (1, 1) NOT NULL,
    [limite_credito] DECIMAL (6, 2) NOT NULL,
    [descuento]      DECIMAL (5, 2) NOT NULL,
    [ciudad]         VARCHAR (60)   NOT NULL,
    [direccion]      VARCHAR (60)   NOT NULL,
    [codigo_garante] INT            NOT NULL,
    CONSTRAINT [Unique_Identifier1] PRIMARY KEY CLUSTERED ([numero_cliente] ASC) ON [PedidoSecundary],
    CONSTRAINT [puede ser] FOREIGN KEY ([codigo_garante]) REFERENCES [catalogo].[Cliente] ([numero_cliente])
) ON [PedidoSecundary];

