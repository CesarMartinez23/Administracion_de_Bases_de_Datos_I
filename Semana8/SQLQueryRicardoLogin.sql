USE Clinic;
-- * DML

-- ! Insert Derpartamentos

-- * Insert 1

INSERT INTO Departamentos (nombreDepartamento, descripcionDepartamento)
VALUES(
    'La Union',
    'Zona Oriental'
);

-- * Insert 2

INSERT INTO Departamentos (nombreDepartamento, descripcionDepartamento)
VALUES(
    'San Salvador',
    'Zona Central'
);

-- * Insert 3

INSERT INTO Departamentos (nombreDepartamento, descripcionDepartamento)
VALUES(
    'San Miguel',
    'Zona Oriental'
);

-- * Insert 4

INSERT INTO Departamentos (nombreDepartamento, descripcionDepartamento)
VALUES(
    'La Libertad',
    'Zona Central'
);

-- * Insert 5

INSERT INTO Departamentos (nombreDepartamento, descripcionDepartamento)
VALUES(
    'Santa Ana',
    'Zona Occidental'
);


-- ! -------------------------------------------------------------------


-- ! Insert Municipios

-- * Insert 1

INSERT INTO Municipios (nombreMunicipio, descripcionMunicipo, fk_idDepartamento)
VALUES(
    'Santa Rosa de Lima',
    'Municipio de La Union',
    1
);

-- * Insert 2

INSERT INTO Municipios (nombreMunicipio, descripcionMunicipo, fk_idDepartamento)
VALUES(
    'La Union',
    'Municipio de La Union',
    1
);

-- * Insert 3

INSERT INTO Municipios (nombreMunicipio, descripcionMunicipo, fk_idDepartamento)
VALUES(
    'San Miguel',
    'Municipio de San Miguel',
    1
);

-- * Insert 4

INSERT INTO Municipios (nombreMunicipio, descripcionMunicipo, fk_idDepartamento)
VALUES(
    'Santa Tecla',
    'Municipio de La Libertad',
    4
);

-- * Insert 5

INSERT INTO Municipios (nombreMunicipio, descripcionMunicipo, fk_idDepartamento)
VALUES(
    'Chalchuapa',
    'Municipio de Santa Ana',
    5
);


-- * Querys Test

SELECT * FROM Departamentos;

SELECT * FROM Municipios;

SELECT * FROM YosselinSchema.Direcciones;

DELETE Municipios;