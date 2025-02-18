--Obteniendo todos los datos y detalles de compras contado desde enero del 2021 
select * 
from e_compras, e_proveedores  
where e_compras.ID_PROVEEDOR = e_proveedores.ID_PROVEEDOR and 
fecha >= '01.01.2021' and condicion = 'C'
//
--Query de compras por proveedor 
select A.ID_COMPRA, b.proveedor,a.TIPO_COMPRA,A.TOTAL,A.COMPROBANTE,A.CTOTAL,fecha 
from e_compras a inner join (select id_proveedor,proveedor from e_proveedores) b on a.ID_PROVEEDOR = b.ID_PROVEEDOR 
order by fecha desc 
//
--Compras por proveedor 
select a.id_compra,a.FECHA,a.CONDICION,a.CTOTAL,COMPROBANTE,b.proveedor, b.ruc 
from e_compras a inner join (select id_proveedor, proveedor, ruc
from e_proveedores) b on a.id_proveedor = b.id_proveedor
//
--Compras por productos 
select E_compras.FECHA, productos.PRODUCTO, e_compras.COMPROBANTE, e_proveedores.PROVEEDOR, productos.CODIGO, e_compras_det.CANTIDAD, e_compras_det.PRECIO, e_compras.TOTAL, e_compras.CONDICION, e_compras.ID_COMPRA
from e_compras, e_compras_det, productos, e_proveedores 
where e_compras.ID_COMPRA = e_compras_det.ID_COMPRA and e_compras_det.ID_PRODUCTO = productos.ID_PRODUCTO and e_compras.ID_PROVEEDOR = e_proveedores.ID_PROVEEDOR
Order by fecha asc; 
//
--Suma de compras por codigos 
select distinct Codigo, producto, sum (precio) as suma_de_total
from e_compras_det, productos 
where e_compras_det.ID_PRODUCTO = productos.ID_PRODUCTO
Group by 1,2 
Order by suma_de_total desc 
//
--Promedio de compras = 442626.40
select Avg (Ctotal)
from e_compras 
//
