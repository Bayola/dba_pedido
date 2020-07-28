CREATE TABLE [movimiento].[Detalle_Pedido] (
    [precio_unitario] DECIMAL (10, 2) NOT NULL,
    [cantidad]        INT             NOT NULL,
    [linea_detalle]   INT             IDENTITY (1, 1) NOT NULL,
    [numero_cabecera] INT             NOT NULL,
    [numero_producto] INT             NOT NULL,
    CONSTRAINT [Unique_Identifier5] PRIMARY KEY CLUSTERED ([linea_detalle] ASC, [numero_cabecera] ASC, [numero_producto] ASC) ON [PedidoSecundary]
) ON [PedidoSecundary];


GO
CREATE TRIGGER [movimiento].actualizarDetalleP 

ON movimiento.Detalle_Pedido 

AFTER UPDATE 

AS 

BEGIN 

DECLARE  

@new_linea_detalle int, 

@new_numero_cabecera int, 

@new_numero_producto int, 

@new_monto_total int 

SELECT 

@new_linea_detalle= linea_detalle, 

@new_numero_cabecera = numero_cabecera, 

@new_numero_producto = numero_producto 

FROM inserted 

UPDATE movimiento.CabeceraPedido SET 

monto_total = @new_monto_total 

where numero_cabecera = (select del.numero_cabecera from deleted del) 

END 

