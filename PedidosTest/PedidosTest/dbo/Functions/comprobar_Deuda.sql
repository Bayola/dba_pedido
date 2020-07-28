
CREATE FUNCTION comprobar_Deuda (@numero_cliente integer)
returns bit
as begin
declare
@resultado bit,
@monto_total_deuda decimal(10,2),
@credito_cliente decimal (6,2)
select @monto_total_deuda = sum(monto_total) from movimiento.CabeceraPedido
select @credito_cliente = limite_credito from catalogo.Cliente where limite_credito > 0
if(@monto_total_deuda > @credito_cliente)
set @resultado = 'true'
else 
set @resultado = 'false'

return (@resultado)

end 
