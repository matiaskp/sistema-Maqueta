-- Seleccionar todas las ventas de la tabla de ventas cuando el nombre del cliente sea RIEDER
select * 
from e_ventas 
where id_cliente in (select id_cliente from e_clientes where upper(cliente) like 'RIE%')

select a.*, b.propietario
from e_ventas a inner join (
select id_cliente, propietario from e_clientes where upper(cliente) like 'RIE%'
) b on a.id_cliente = b.id_cliente
//
SELECT DISTINCT(ID_CLIENTE), CLIENTE, COMPROBANTE,FECHA FROM E_VENTAS WHERE CLIENTE LIKE 'RIE%' AND ID_CLIENTE <>100
ORDER BY FECHA DESC 
//
