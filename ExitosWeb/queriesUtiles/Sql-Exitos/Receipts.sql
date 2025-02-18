--Query que da informacion acerca de los recibos de dinero 
select RECIBOS.id_recibo, RECIBOS.ID_CLIENTE, cliente, ruc, comprobante, fecha, MONTO
from RECIBOS, e_clientes, RECIBOS_DET
where RECIBOS.ID_CLIENTE = e_clientes.ID_CLIENTE and recibos.ID_RECIBO = RECIBOS_DET.ID_RECIBO
ORDER BY ID_RECIBO, FECHA, ID_CLIENTE, CLIENTE, RUC, COMPROBANTE, MONTO;
//
--Obteniendo como resultados los recibos de dinero de gilcopar en 2021 
select RECIBOS.ID_CLIENTE, cliente,ruc,MONTO, comprobante,id_venta 
from RECIBOS, e_clientes, RECIBOS_DET
where RECIBOS.ID_CLIENTE = e_clientes.ID_CLIENTE and recibos.ID_RECIBO = RECIBOS_DET.ID_RECIBO and RECIBOS.id_cliente = 169 and fecha >= '01.01.2021'
GROUP BY ID_CLIENTE, CLIENTE, RUC, COMPROBANTE, id_venta,monto
//
--Obteniendo como resultado la suma de los pagos hechos por Gilcopar en 2021 que es de 1820000.00
select RECIBOS.ID_CLIENTE, cliente, ruc,sum(MONTO) as Suma_de_Pagos
from RECIBOS, e_clientes, RECIBOS_DET
where RECIBOS.ID_CLIENTE = e_clientes.ID_CLIENTE and recibos.ID_RECIBO = RECIBOS_DET.ID_RECIBO and RECIBOS.id_cliente = 169 and fecha >= '01.01.2021'
GROUP BY ID_CLIENTE, CLIENTE, RUC;
//
