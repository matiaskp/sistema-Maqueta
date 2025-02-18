CREATE TABLE Materias 
(id char(10) Primary KEY,
Materia char(50) NOT NULL,
Total_tareas INTEGER NULL,
Tarea_Desc Varchar (750) NULL
Fecha_de_entrega INTEGER
);
//
Insert into Materias
(id 
,Materia
,Total_tareas
,Tarea_Desc
,Fecha_de_entrega
)
VALUES
(
"6"
,"Comunicación"
,2
,"Oraciones según su enunciado"
,28.05
);
///
CREATE TEMP TABLE "Nombres_de_Materias" as 
SELECT Materia
from Materias;
//
select *
from temp.Nombres_de_Materias;
//
  --Where clause operators
= --Equal
<> --Not equal, Note: en algunas versiones de sql este operador se puede escribir como !"
> --Greater than
< --Less than
>= --Greater than or equal
<= --Less than or equal
BETWEEN/ --Between an inclusive range
IS NULL/-- Is a null value
IN, OR , NOT
Where SupplierID in (9,10,11);
Where ProductName = "Tofu" OR "Konbu";
Where NOT City = "London" And Not City = "Seattle";
//
        -- Wildcards // Operador LIKE con comodines 
"%Pizza" --Grabs anything ending with the word pizza
"Pizza%" --Grabs anything after the word pizza 
"%Pizza%" --Grabs anything before and after the word pizza 
    --Más ejemplos 
"M%S" --Grabs anything that starts with "M" and ends with "S" (como Matias)
"t%@gmail.com" --Grabs gmail adresses that start with "t" (hoping to find Tom)
Where size LIKE "%pizza";
Output: spizza
        mpizza
//
        --Operadores Matemáticos (-,+,*,/)
select ProductId, UnitsOnOrder, UnitPrice
,UnitsOnOrder * UnitPrice AS Total_Order_Cost
FROM Products;

SELECT ProductId, Quantity, UnitPrice, Discount 
,(UnitPrice-Discount) /Quantity AS Total_Cost 
From OrderDetails;
//
  //  --Funciones Agregadas AVG, COUNT, MIN, MAX, SUM, DISTINCT
Select AVG(UnitPrice) AS avg_price --Seleccionando el precio unitario promedio
From products;

Select COUNT(*) AS total_customers --Contando el total de clientes 
From customers;

 Select COUNT(CustomerID) AS total_customers --Contando la cantidad de ids en la columna individual "CustomerID" 
 From customers; 

Select Max(UnitPrice) AS max_prod_price --Obteniendo el máximo y mínimo precio unitario de los productos
,MIN(UnitPrice) AS min_prod_price 
From Products;

Select SUM(UnitPrice) AS total_prod_price --Obteniendo la suma del precio unitario
From Products;

Select SUM(UnitPrice*UnitsInStock) --Obteniendo la suma de (la multiplicacion de UnitPricexUnitsInStock) en donde el SupplierID = 23
As total_price 
From Products 
Where SupplierID = 23; 

Select COUNT(DISTINCT CustomerID) --Contando la cantidad de distintos CustomerID en la tabla customers
FROM customers;
--Si la palabra DISTINCT no es específica en una declaración, SQL siempre asumirá que desea todos los datos. Por ejemplo, es posible que tenga un cliente que esté en una tabla varias veces. Si simplemente está haciendo un recuento en sus ID de cliente y no distingue a contar solo los ID de cliente distintos, es posible que esté recibiendo registros duplicados allí. Y esto es realmente útil para ejecutar consultas donde está contando distintos y para ver dónde incluso podría haber algunos duplicados potenciales en una columna. Hay algunas cosas a tener en cuenta al usar DISTINCT con nuestra función agregada de conteo. No puede usar DISTINCT en la función COUNT con el asterisco (*). Solo tenga esto en cuenta, no solo para cuándo y dónde puede usar DISTINCT, sino también para pensar cuándo desea usar DISTINCT y cuándo no lo hace.
//
        --Agrupando datos con SQL (GROUP BY, HAVING, ORDER BY)

SELECT Region --Contando la cantidad total de clientes para cada región 
,COUNT(CustomerID) AS total_customers
From customers
GROUP BY Region;

SELECT * --From chinook database
FROM INVOICES 
WHERE CustomerId = 2
GROUP BY BillingCity, BillingCountry

SELECT 
CustomerID
,COUNT (*) AS orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT (*) >=2;

SELECT --From chinook database
total
,COUNT (*) AS total_of_totals
FROM invoices
GROUP BY total
HAVING COUNT (*) >=2;
//
--Subqueries 
select CustomerId, BillingCity, BillingCountry --From chinook database
from invoices
where CustomerId in (select CustomerId 
from customers
where FirstName = "Luís")
//
--Subquery in Subquery
--1. Order numbers for toothbrushes 
--2. Customer ID's for those orders 
--3. Customer information for those orders 

Select Customer_name, Customer_contact 
From Customers 
Where cust_id IN 
Select customer_id 
From Orders 
Where order_number IN (Select order_number 
From OrderItems 
Where prod_name = 'Toothbrush')
//
--Subqueries for Calculations 
--Total number of orders placed by every customer

Select customer_name, customer_state,
(Select count (*) as orders 
From Orders 
Where Orders.customer_id = Customer.customer_id) as orders 
From customers 
Order By Customer_name
//
--Joins 
--Cartesian (Cross) Join con una unión cartesiana, esto le permite tomar cada registro de la primera tabla y emparejarlo con todos los registros de la segunda tabla.
SELECT product_name
,unit_price
,company_name
FROM suppliers CROSS JOIN products;
//
--Inner Join: Trae de vuelta sólo los registros coincidentes entre tablas 
 SELECT suppliers.CompanyName
,ProductName
,UnitPrice
FROM Suppliers INNER JOIN Products 
ON Suppliers.supplierid = Products.supplierid
//
select o.Order_ID, c.CompanyName, e.LastName
From ((Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID))
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID);
// 
select sum(A.total) as total_ventas, sum (E.CTOTAL) as total_compras 
from ((e_ventas A inner join e_ventas_det B on A.id_venta = B.ID_VENTA) Inner join Productos C on C.ID_PRODUCTO = B.ID_PRODUCTO
 inner join e_compras_det D on D.ID_PRODUCTO = C.ID_PRODUCTO Inner join E_compras E on E.ID_COMPRA = D.ID_COMPRA)
//
--Funciono pero no se que bien porque 
SELECT total_ventas - total_compras as Rentabilidad  
from (select sum(A.total) as total_ventas, sum (E.CTOTAL) as total_compras 
from ((e_ventas A inner join e_ventas_det B on A.id_venta = B.ID_VENTA) Inner join Productos C on C.ID_PRODUCTO = B.ID_PRODUCTO
 inner join e_compras_det D on D.ID_PRODUCTO = C.ID_PRODUCTO Inner join E_compras E on E.ID_COMPRA = D.ID_COMPRA))
//
--Algo más sencillo creo. Los resultados de este y el anterior están mal 
Select Suma_de_ventas - Suma_de_compras as Rentabilidad
From(
SELECT SUM(TOTAL) AS Suma_de_ventas ,SUM (Ctotal) as Suma_de_compras 
From (select CTOTAL FROM E_COMPRAS), E_ventas) 
//
--Aliases and Self Joins
SELECT column_name 
FROM table_name AS alias_name
//
SELECT vendor_name,product_name,product_price
FROM Vendors AS v, Products AS o 
WHERE v.vendor_id = p.vendor_id; 
//
--Unions 
Select column_name(s) From
Table1 
Union 
Select column_name(s) From 
Table2;
//
Select City, Country FROM Customers 
Where country = 'Germany'
Union 
Select City, Country From 
Suppliers 
Where Country = 'Germany'
Order By City;
//
--Uniones Avanzadas: Left, Right, and Full Outer Joins
--Left y Right join traen los registros coincidentes con las tablas especificadas y el Full Outer Join trae todos los registros de las dos tablas
SELECT C.CustomerName, O.OrderID
FROM Customers C
LEFT JOIN Orders O On C.CustomerID = O.CustomerID
ORDER BY C.CustomerName;
//
--Strings de texto
Select TRIM (" You are the best ") AS TrimmedString;
//
SUBSTR(string name, string position, number of
characters to be returned);

SELECT first_name, SUBSTR
(first_name,2,3)
From Employees
Where department_id=60;
//
SELECT first_name
SUBSTR (first_name,1,3)
FROM Employees
WHERE department_id=100; 
//
SELECT UPPER(column_name) FROM table_name
SELECT LOWER(column_name) FROM table_name
SELECT UCASE(column_name) FROM table_name
//
