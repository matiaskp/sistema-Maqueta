--Ventas al contado
select fecha, comprobante, total 
from e_ventas
where condicion = 'C'
order by fecha asc;
--Recibos de dinero 
select fecha, cliente,comprobante, monto 
from recibos a inner join recibos_det b on a.ID_RECIBO = b.ID_RECIBO inner join e_clientes c on a.ID_CLIENTE = c.ID_CLIENTE
order by fecha asc; 
--Compras al contado 
select fecha, proveedor, comprobante, ctotal 
from e_compras a inner join e_compras_det b on a.ID_COMPRA = b.ID_COMPRA inner join e_proveedores c on a.ID_PROVEEDOR = c.ID_PROVEEDOR
where condicion = 'C'
order by fecha asc; 
--Pagos de compras crédito
select fecha, proveedor, comprobante, monto
from pagos a inner join pagos_det b on a.ID_PAGO = b.ID_PAGO inner join e_proveedores c on a.ID_PROVEEDOR = c.ID_PROVEEDOR
order by fecha asc
--Egresos de caja 
select fecha, proveedor, comprobante, descripcion, monto 
from egresos_caja 
order by fecha asc;
--fecha
where fecha >='01.07.2021'

