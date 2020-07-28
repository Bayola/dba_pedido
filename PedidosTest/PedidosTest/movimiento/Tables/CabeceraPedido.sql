CREATE TABLE [movimiento].[CabeceraPedido] (
    [numero_cabecera] INT             IDENTITY (1, 1) NOT NULL,
    [fecha_pedido]    DATE            NOT NULL,
    [numero_cliente]  INT             NOT NULL,
    [tipo_pedido]     VARCHAR (10)    NOT NULL,
    [monto_total]     DECIMAL (10, 2) NULL
) ON [PedidoSecundary];


GO
create trigger [movimiento].tg_saldo_deudor 

on [movimiento].[CabeceraPedido] 

after insert, update 

as 

declare  

@tipo_pedido varchar(10), 

@numero_cliente int, 

@codigo_garante int, 

@monto_total decimal(10,2) 

  

select @tipo_pedido = tipo_pedido, 

@numero_cliente = numero_cliente 

from inserted 

  

select @monto_total = sum(monto_total) from [movimiento].CabeceraPedido 

where numero_cliente = @numero_cliente 

if(@tipo_pedido = 'credito') 

begin 

  

if exists(select top 1 1 from [catalogo].[Deudor] where numero_cliente= @numero_cliente) 

begin 

update catalogo.Deudor set saldo_deudor = @monto_total 

end 

else 

begin 

select @codigo_garante = numero_cliente from [movimiento].CabeceraPedido  

where tipo_pedido = 'credito' 

insert into [catalogo].Deudor (numero_cliente, cod_garante, saldo_deudor) 

values (@numero_cliente, @codigo_garante, @monto_total) 

end 

end 

