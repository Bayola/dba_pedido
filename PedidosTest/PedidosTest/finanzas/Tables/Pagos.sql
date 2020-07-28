CREATE TABLE [finanzas].[Pagos] (
    [codCli]     INT            NULL,
    [fecha_pago] DATE           NULL,
    [valor_pago] DECIMAL (6, 2) NULL
);


GO
 create trigger [finanzas].CK_Realizar_Pago
 on finanzas.Pagos for insert
 as declare
 @codCli int,
 @fecha_pago date,
 @valor_pago decimal(6,2)
 select
 @codCli = finanzas.Pagos.codCli,
 @fecha_pago = finanzas.Pagos.fecha_pago,
 @valor_pago = finanzas.Pagos.valor_pago
 from finanzas.Pagos
 update catalogo.Deudor set saldo_deudor =saldo_deudor - @valor_pago
 where numero_cliente =@codCli
