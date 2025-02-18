--Seleccionando de productos las tablas que considero útiles. Total = 8404
select ID_PRODUCTO,CODIGO,PRODUCTO,REFERENCIA,EXI_MINIMA,TOTAL_COMPRAS,FECHA_INICIAL,T_EXI,ID_GRUPO,ID_MARCA 
from Productos 
//
--Join de Marcas. Total = 6970
select ID_PRODUCTO,CODIGO,PRODUCTO,REFERENCIA,EXI_MINIMA,TOTAL_COMPRAS,FECHA_INICIAL,T_EXI,ID_GRUPO,PRODUCTOS.ID_MARCA 
from Productos,MARCAS
where PRODUCTOS.ID_MARCA = marcas.ID_MARCA 
//
--Query con todo pero marcas not null
select id_producto,codigo,producto,referencia,exi_minima,total_compras,fecha_inicial,t_exi,id_grupo,productos.ID_MARCA,marcas.NOMBRE
from productos left outer join 
marcas on productos.ID_MARCA = marcas.ID_MARCA;
