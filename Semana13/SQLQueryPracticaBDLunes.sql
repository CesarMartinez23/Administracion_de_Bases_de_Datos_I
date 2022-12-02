USE Northwind;

--Obtener Clientes

ALTER PROCEDURE getCustomerbyID
@IDCUSTOMER nchar(5)='FISSA' --Parametro de filtro.
AS 
	SELECT CustomerID, ContactName FROM Customers
	WHERE CustomerID = @IDCUSTOMER

--Ejecutamos el procedimiento
EXEC getCustomerbyID 'FISSA'
EXEC getCustomerbyID @IDCUSTOMER='FISSA'

--Ejecutamos el procedimiento sin pasarle un parametro, que eliga el que tiene por defecto
EXEC getCustomerbyID

--Ejecutamos el procedimiento pasandole otro parametro
EXEC getCustomerbyID 'ALFKI'
EXEC getCustomerbyID @IDCUSTOMER='ALFKI'


--Crear procedimiento con parametros de salida.

CREATE PROCEDURE getTotalProducts
@TOTALP INT OUTPUT
AS
	SELECT * FROM Products
	SELECT @TOTALP=@@ROWCOUNT
	RETURN (0) --No es necesario escribirlo.

--Declarar variable local
DECLARE @products INT --Variable para almacenar el valor de retorno del parametro de salida
EXEC getTotalProducts @TOTALP = @products OUTPUT
SELECT [Total de Productos] = @products

--Eliminar un procedimiento
DROP PROCEDURE getTotalProducts

--Procedimiento para insertar registros en una tabla.
CREATE PROCEDURE insertRegion
	@ID INT,
	@DESC VARCHAR(20)
AS
	IF(
		SELECT COUNT(*) FROM Region WHERE RegionID =@ID OR RegionDescription = @DESC
	) = 0
		INSERT INTO Region(RegionID, RegionDescription) VALUES(@ID, @DESC)
	ELSE
		PRINT 'La region ya existe, intente con otro nombre'


SELECT * FROM Region

EXEC insertRegion 5, 'Eastern'
EXEC insertRegion 1, 'New Region'
EXEC insertRegion 5, 'New Region'


--Usar	SELECT CASE
--Verificar si existen empleados en un pais determinado
CREATE PROCEDURE employeeExistsbyCountry
	@COUNTRY VARCHAR(20)
AS
	SELECT 
		CASE(SELECT COUNT(*) FROM Employees WHERE Country=@COUNTRY)
		WHEN 0 THEN 'No tenemos empleados del pais: ' +@COUNTRY
		ELSE 'Si tenemos empleados del pais: ' +@COUNTRY
	END

	
SELECT COUNT(Country) Cantidad, Country FROM Employees
GROUP BY Country;

EXEC employeeExistsbyCountry 'MEXICO'


--Mostrar el total por orden
CREATE PROCEDURE totalbyOrder
AS
	SELECT OrderID, SUM(Quantity*UnitPrice) AS Total FROM [Order Details]
	GROUP BY OrderID;

EXEC totalbyOrder

------------------------------------------------------------------------------------------------------
--Modificar el procedimiento anterior de tal manera que reciba como parametro el codigo de la orden

ALTER PROCEDURE totalbyOrder
	@ORDERID int
AS
	SELECT OrderID, SUM(Quantity*UnitPrice) AS Total FROM [Order Details]
	WHERE OrderID =@ORDERID
	GROUP BY OrderID;

EXEC totalbyOrder 10248

-- 2- Cree un procedimiento que reciba el año como parametro y muestre nombre y fecha de contratacion de los empleados contratados durante este año.

CREATE PROCEDURE getDateContract
	@YEAREMPLOYEE INT
AS 
	SELECT CONCAT(FirstName, ' ', LastName) "Full Name", YEAR(HireDate) "Año" FROM Employees
	WHERE YEAR(HireDate) = @YEAREMPLOYEE

EXEC getDateContract 1993

-- 3- Modificar el procedimiento anterior para que tambien reciba un parametro de salida el cual debera mostrar el total de empleados contratados ese año

ALTER PROCEDURE getDateContract
	@YEAREMPLOYEE INT OUTPUT
AS 
	SELECT YEAR(HireDate) "Año", COUNT(EmployeeID) "Total" FROM Employees
	WHERE YEAR(HireDate) = @YEAREMPLOYEE
	GROUP BY YEAR(HireDate)


EXEC getDateContract 1993
