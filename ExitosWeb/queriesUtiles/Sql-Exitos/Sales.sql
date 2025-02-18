--Seleccionando el promedio de ventas que es 3604223.411
SELECT AVG(TOTAL) as promedio_de_ventas 
FROM E_VENTAS
//
--Obteniendo como resultado los clientes que hayan realizado compras mayores al promedio de ventas
SELECT FECHA,CLIENTE,TOTAL                   
FROM E_ventas 
WHERE CLIENTE <> 'MOSTRADOR' and total > 3604223.41
ORDER BY TOTAL DESC; 
//
--Obteniendo una venta desproporcionada del cliente NELSON AGUERO 
SELECT ID_VENTA, FECHA, CLIENTE, TOTAL 
FROM E_VENTAS 
WHERE CLIENTE LIKE '%NELSON AGUERO%';
//
--Buscando el comprobante de la venta de id 9568 para corregirlo en el sistema 
select COMPROBANTE
from E_VENTAS 
WHERE ID_VENTA = 9568;
//
--Avg sales by seller 
select E_VENTAS.ID_VENDEDOR,VENDEDOR,AVG(TOTAL) 
from E_VENTAS, VENDEDORES 
WHERE E_VENTAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR
GROUP BY ID_VENDEDOR, VENDEDOR 
//
--AVG SALE FOR ID_VENDEDOR = 2 IS 334233.48 AND AVG SALE FOR ID_VENDEDOR = 3 IS 10014266.31
select E_VENTAS.ID_VENDEDOR,VENDEDOR,AVG(TOTAL) 
from E_VENTAS, VENDEDORES 
WHERE E_VENTAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR and E_VENTAS.ID_VENDEDOR = 2
GROUP BY ID_VENDEDOR, VENDEDOR 
//
--Loking for inconsistencies 
select ID_VENTA, FECHA, E_VENTAS.ID_VENDEDOR,VENDEDOR, CLIENTE, COMPROBANTE,TOTAL
from E_VENTAS,VENDEDORES
WHERE E_VENTAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR and E_VENTAS.ID_VENDEDOR = 3 AND TOTAL >334233.48
order by E_VENTAS.ID_VENTA asc; 
//
--Loking for inconsistencies in individual product sales
select E_VENTAS.ID_VENTA, FECHA, E_VENTAS.ID_VENDEDOR,VENDEDOR, CLIENTE, COMPROBANTE, E_VENTAS_DET.ID_PRODUCTO,CODIGO, PRODUCTO, CANTIDAD, PRECIO
from E_VENTAS, E_VENTAS_DET,VENDEDORES, PRODUCTOS
WHERE E_VENTAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR and E_VENTAS.ID_VENTA = E_VENTAS_DET.ID_VENTA AND E_VENTAS_DET.ID_PRODUCTO = PRODUCTOS.ID_PRODUCTO and E_VENTAS.ID_VENDEDOR = 3 
//
--Query para ver la totalidad de las ventas crédito del 2021 
select * 
from e_ventas 
where condicion = 'D' and fecha >= '07.01.2021'
//
--Viendo las ventas crédito de rieder desde enero del 2021 
select *
from e_ventas
where cliente like 'RIE%' and condicion = 'D' and fecha >= '01.01.2021' 
//
--Obteniendo la totalidad de los creditos sacados por Gilcopar
select FECHA ,CLIENTE, COMPROBANTE,TOTAL
from e_ventas
where ID_CLIENTE = 169 and condicion = 'D' and fecha >= '01.01.2021' 
//
--Obteniendo como resultado la suma de los créditos sacados por Gilcopar que es 1925000.00
select CLIENTE, SUM(TOTAL) AS TOTAL_CREDITOS
from e_ventas
where ID_CLIENTE = 169 and condicion = 'D' and fecha >= '01.01.2021' 
GROUP BY cliente 
//
--Básicamente productosxfecha. Se le debe añadir una columna de total que es igual a el producto de cantidad * precio 
select fecha,cliente,comprobante,condicion,producto,codigo,cantidad,precio,e_ventas_det.ID_PRODUCTO
from e_ventas, e_ventas_det,PRODUCTOS
where e_ventas.ID_VENTA = e_ventas_det.ID_VENTA and e_ventas_det.ID_PRODUCTO = productos.ID_PRODUCTO
order by fecha asc 
//
--Obteniendo como resultado la suma del total del mes de junio hasta la fecha 21.06.2021
select sum(total)
from e_ventas
where fecha between '01.06.2021' and '21.06.2021'
//
--Ventas por producto 
select Fecha, Producto, Comprobante, Cliente, Codigo, Cantidad, Precio, Total, Condicion 
from e_ventas, e_ventas_det, productos 
where e_ventas.ID_VENTA = e_ventas_det.ID_VENTA and e_ventas_det.ID_PRODUCTO = productos.ID_PRODUCTO
Order by Fecha asc 
//
--Suma de ventas por códigos 
select distinct Codigo,PRODUCTO, sum(precio) as suma_de_total
from e_ventas_det, productos 
where e_ventas_det.ID_PRODUCTO = productos.ID_PRODUCTO 
Group by 1,2 
Order by suma_de_total desc 
