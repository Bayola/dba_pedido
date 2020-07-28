CREATE FUNCTION comprobar_Garante (@codigo_garante integer)
returns bit
as begin
declare
@resultado bit
if not exists (select top 1 1 from catalogo.Deudor where @codigo_garante = null)
set @resultado = 'true'
else
set @resultado = 'false'
return (@resultado)
end
