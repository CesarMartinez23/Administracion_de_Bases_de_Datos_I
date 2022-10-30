USE Clinic;
GO

CREATE TABLE dbo.LogsEnfermera(
 logID INT IDENTITY (1,1) PRIMARY KEY,
 logName VARCHAR(30),
 logDate DATETIME, 
 logUser SYSNAME,
 logOperation VARCHAR(15),
 CHECK(logOperation='INSERT' OR logOperation='DELETE' OR logOperation='UPDATE')
);
GO

CREATE OR ALTER TRIGGER CesarSchema.trLogsEnfermerasInsert
ON CesarSchema.Enfermeras
AFTER INSERT
AS BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.LogsEnfermera(logName, logDate, logUser, logOperation) VALUES(
		'Registro Insertado', GETDATE(), USER, 'INSERT'
	);
END;
GO

CREATE OR ALTER TRIGGER CesarSchema.trLogsEnfermerasDelete
ON CesarSchema.Enfermeras
AFTER DELETE
AS BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.LogsEnfermera(logName, logDate, logUser, logOperation) VALUES(
		'Registro Eliminado', GETDATE(), USER, 'DELETE'
	);
END;
GO

CREATE OR ALTER TRIGGER CesarSchema.trLogsEnfermerasUpdate
ON CesarSchema.Enfermeras
AFTER UPDATE
AS BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.LogsEnfermera(logName, logDate, logUser, logOperation) VALUES(
		'Registro Actualizado', GETDATE(), USER, 'UPDATE'
	);
END;
GO


--Verificar Datos de Tablas
SELECT * FROM CesarSchema.Enfermeras
GO

SELECT * FROM LogsEnfermera
GO

--Insertas Datos de Prueba
INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Mateo', 'Martinez', 'M',12)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Cesar', 'Martinez', 'M',21)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Ana', 'Alvarenga', 'F',48)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Jennifer', 'Velasquez', 'F',22)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Bertila', 'Martinez', 'F',80)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Gisela', 'Espinoza', 'F',25)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Simon', 'Torres', 'M',59)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Rutilio', 'Zelaya', 'M',62)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('Melisa', 'Morales', 'F',35)

INSERT INTO CesarSchema.Enfermeras(nombre, apellido, genero, edad)
VALUES('John', 'Goenz', 'M',45)

--Eliminar Datos de Prueba
DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 1

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 2

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 3

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 4

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 5

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 6

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 7

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 8

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 9

DELETE FROM CesarSchema.Enfermeras WHERE idEnfermera = 10

--Actualizar Datos de Prueba

UPDATE CesarSchema.Enfermeras SET nombre = 'Alexander' WHERE idEnfermera = 1

UPDATE CesarSchema.Enfermeras SET nombre = 'Jacob' WHERE idEnfermera = 2

UPDATE CesarSchema.Enfermeras SET nombre = 'Argelia' WHERE idEnfermera = 3

UPDATE CesarSchema.Enfermeras SET nombre = 'Julissa' WHERE idEnfermera = 4

UPDATE CesarSchema.Enfermeras SET nombre = 'Julia' WHERE idEnfermera = 5

UPDATE CesarSchema.Enfermeras SET nombre = 'Jazmin' WHERE idEnfermera = 6

UPDATE CesarSchema.Enfermeras SET nombre = 'Josue' WHERE idEnfermera = 7

UPDATE CesarSchema.Enfermeras SET nombre = 'Fernando' WHERE idEnfermera = 8

UPDATE CesarSchema.Enfermeras SET nombre = 'Kenzie' WHERE idEnfermera = 9

UPDATE CesarSchema.Enfermeras SET nombre = 'Nelson' WHERE idEnfermera = 10




