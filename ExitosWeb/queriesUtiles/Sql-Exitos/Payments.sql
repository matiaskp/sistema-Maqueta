--Query que da informacion acerca de los pagos a proveedores sin ser detallado y sin datos repetidos 
select id_pago, pagos.id_proveedor,proveedor, ruc, fecha, comprobante
from PAGOS, e_proveedores
where pagos.ID_PROVEEDOR = e_proveedores.ID_PROVEEDOR
//
--Query para ver los detalles de los pagos 
select pagos.id_pago, pagos.id_proveedor,proveedor, ruc, fecha, comprobante,monto,monto, concepto, id_compra 
from PAGOS, e_proveedores, PAGOS_DET
where pagos.ID_PROVEEDOR = e_proveedores.ID_PROVEEDOR and pagos.ID_PAGO = PAGOS_DET.ID_PAGO;
//
--Suma de monto de pagos 
select PAGOS_DET.id_pago, sum(monto) as suma_de_montos, comprobante, pagos.id_proveedor, proveedor, ruc, fecha 
from PAGOS_DET, pagos, e_proveedores
where pagos_det.ID_PAGO = PAGOS.ID_PAGO and pagos.ID_PROVEEDOR = e_proveedores.ID_PROVEEDOR 
group by id_pago, comprobante,pagos.id_proveedor, proveedor, ruc, fecha 
order by id_pago, fecha,id_proveedor, proveedor, ruc, comprobante, suma_de_montos
//
