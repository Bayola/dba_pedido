CREATE TABLE [movimiento].[Proveedor_producto] (
    [cantidad]           INT  NOT NULL,
    [fecha_distribucion] DATE NOT NULL,
    [numero_producto]    INT  NOT NULL,
    [numero_fabrica]     INT  NOT NULL,
    [linea_distribucion] INT  IDENTITY (1, 1) NOT NULL
) ON [PedidoSecundary];

