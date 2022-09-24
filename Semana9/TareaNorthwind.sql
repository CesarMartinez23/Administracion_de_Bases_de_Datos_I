USE Northwind;

-- Query 1
/*
	Utilice la funcion DATEDIFF para obtener la diferencia en dias entre OrderData y 
	RequiredDate de la tabla orders.
*/

SELECT OrderID, OrderDate, RequiredDate, DATEDIFF(day,OrderDate,RequiredDate) "Diferencia de Dias"
FROM Orders;

-- Query 2
/*
	Muestra el numero de clientes, la primera fecha y la fecha mas reciente de la tabla orders.
*/

SELECT COUNT(CustomerID) NumeroClientes, MIN(OrderDate) "Primer Fecha", MAX(OrderDate) "Fecha mas Reciente" 
FROM Orders;

-- Query 3
/*
	Mostrar companyName de la tabla customers, en donde City sea diferente de
	Country y country no sea Mexico.
*/

SELECT companyName
FROM Customers
WHERE City != Country AND Country != 'Mexico';

-- Query 4
/*
	Mostrar la cantidad de pedidos realizados por un cliente de la tabla orders en donde
	los pedidos sean mayores a 5 y menores a 10 (Muestre 3 resultados, el primero
	utilizando >=,<=; el segundo utilizando BETWEEN y el tercero utilizando IN).
*/

SELECT CustomerID, COUNT(OrderID) "Ordenes"
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 5 AND COUNT(OrderID) <= 10;


SELECT CustomerID, COUNT(OrderID) "Ordenes"
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) BETWEEN 5 AND 10;


SELECT CustomerID, COUNT(OrderID) "Ordenes"
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) IN(5,6,7,8,9,10);

-- Query 5
/*
	Mostrar el codigo del cliente y la fecha que realizo la orden de la tabla orders, debera
	mostrar solo las del año 1998, utilice el operador LIKE y la funcion YEAR.
*/

SELECT CustomerID, OrderID, OrderDate, YEAR(OrderDate) "Year"
FROM Orders
WHERE YEAR(OrderDate) LIKE '%1998%';


SELECT CustomerID, OrderID, OrderDate, YEAR(OrderDate) "Year"
FROM Orders
WHERE YEAR(OrderDate) = 1998;