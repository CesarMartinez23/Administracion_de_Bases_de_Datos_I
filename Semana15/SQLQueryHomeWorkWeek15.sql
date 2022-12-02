USE AdventureWorks2019;

--1
/*
Creamos una funcion que recibe una fecha y nos retorna un entero con el año de la fecha ingresada
*/
CREATE OR ALTER FUNCTION HumanResources.dateOfTheBirthday(@birthday DATE)
RETURNS INT
AS BEGIN 
	RETURN
		YEAR(@birthday);
END;

--2
/*
Creamos una consulta donde retornamos la edad de los empleados de la tabla HumanResources.Employee a partir de su fecha de nacimiento, esto obteniendo el año actual y restando el año de nacimiento solamente el año mediante la funcion creada anteriormente y mostrando su edad de manera ascendente
*/
SELECT (YEAR(GETDATE())-HumanResources.dateOfTheBirthday(BirthDate)) "Edad"
FROM HumanResources.Employee
ORDER BY "Edad" ASC;

--3
/*
Creamos una funcion que obtiene el nombre, el numero de producto, el precio de los productos y su fecha de modificacion de productos de la tabla Production.Product esto a partir de un parametro que recibe la funcion que es la fecha de modificacion de los productos
*/
CREATE OR ALTER FUNCTION getProducts(@modifieDate DATETIME)
RETURNS TABLE
AS 
	RETURN 
		SELECT Name, ProductNumber, ListPrice, ModifiedDate
		FROM Production.Product
		WHERE CAST(ModifiedDate AS DATE)=@modifieDate

SELECT * FROM getProducts('02/08/2014');