CREATE TABLE [catalogo].[Producto] (
    [numero_producto] INT             IDENTITY (1, 1) NOT NULL,
    [nombre_producto] VARCHAR (30)    NOT NULL,
    [stock_producto]  INT             NOT NULL,
    [precio_unitario] DECIMAL (20, 2) NOT NULL,
    CONSTRAINT [Unique_Identifier2] PRIMARY KEY CLUSTERED ([numero_producto] ASC) ON [PedidoSecundary]
) ON [PedidoSecundary];

