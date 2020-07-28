CREATE TABLE [catalogo].[Deudor] (
    [cod_garante]    INT            NOT NULL,
    [limite_credito] DECIMAL (6, 2) NOT NULL,
    [saldo_deudor]   DECIMAL (6, 2) NOT NULL,
    [numero_cliente] INT            NOT NULL,
    CONSTRAINT [ck_comprador_deuda] CHECK ([dbo].[comprobar_deuda]([numero_cliente])='true'),
    CONSTRAINT [CK_limiteCredito] CHECK ([saldo_deudor]<=[limite_credito]),
    FOREIGN KEY ([numero_cliente]) REFERENCES [catalogo].[Cliente] ([numero_cliente])
) ON [PedidoSecundary];


GO
create trigger [catalogo].CK_Actualizar_Deudor
 on catalogo.deudor for Update
 as declare
 @saldo_deudor decimal(6,2),
 @numero_cliente int
 select @saldo_deudor = saldo_deudor,
 @numero_cliente = numero_cliente
 from inserted
 if(@saldo_deudor=0)
 begin 
 delete from catalogo.deudor where @numero_cliente = @numero_cliente
 end