USE Clinic;
-- * DML

-- ! Insert Pacientes

-- * Insert 1

INSERT INTO Pacientes (nombre, apellido, genero, edad)
VALUES(
    'Ricardo',
    'Alvarez',
    'Masculino',
    25
);

-- * Insert 2

INSERT INTO Pacientes (nombre, apellido, genero, edad)
VALUES(
    'Emely',
    'Guevara',
    'Femenino',
    18
);

-- * Insert 3

INSERT INTO Pacientes (nombre, apellido, genero, edad)
VALUES(
    'Luis',
    'Gonzalez',
    'Masculino',
    30
);

-- * Insert 4

INSERT INTO Pacientes (nombre, apellido, genero, edad)
VALUES(
    'Maria',
    'Gonzalez',
    'Femenino',
    35
);

-- * Insert 5

INSERT INTO Pacientes (nombre, apellido, genero, edad)
VALUES(
    'Jose',
    'Gonzalez',
    'Masculino',
    40
);


-- ! -------------------------------------------------------------------


-- ! Insert Expedientes

-- * Insert 1

INSERT INTO Expedientes (descripcionExpediente, fk_idPaciente)
VALUES(
    'Expediente, enfermo de COVID-19',
    1
);

-- * Insert 2

INSERT INTO Expedientes (descripcionExpediente, fk_idPaciente)
VALUES(
    'Expediente, enfermo de ZIKA',
    2
);

-- * Insert 3

INSERT INTO Expedientes (descripcionExpediente, fk_idPaciente)
VALUES(
    'Expediente, enfermo de DENGUE',
    3
);

-- * Insert 4

INSERT INTO Expedientes (descripcionExpediente, fk_idPaciente)
VALUES(
    'Expediente, enfermo de Gripa',
    4
);

-- * Insert 5

INSERT INTO Expedientes (descripcionExpediente, fk_idPaciente)
VALUES(
    'Expediente, enfermo de Salmonela',
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Doctores

-- * Insert 1

INSERT INTO Doctores (nombre, apellido, genero, edad)
VALUES(
    'Mateo',
    'Martinez',
    'Masculino',
    25
);

-- * Insert 2

INSERT INTO Doctores (nombre, apellido, genero, edad)
VALUES(
    'Julia',
    'Martinez',
    'Femenino',
    30
);

-- * Insert 3

INSERT INTO Doctores (nombre, apellido, genero, edad)
VALUES(
    'Juan',
    'Perez',
    'Masculino',
    35
);

-- * Insert 4

INSERT INTO Doctores (nombre, apellido, genero, edad)
VALUES(
    'Maria',
    'Perez',
    'Femenino',
    40
);

-- * Insert 5

INSERT INTO Doctores (nombre, apellido, genero, edad)
VALUES(
    'Pedro',
    'Gomez',
    'Masculino',
    45
);


-- ! ------------------------------------------------------------------------


-- ! Insert Enfermeras

-- * Insert 1

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Roxana',
    'Flores',
    'Femenino',
    25
);

-- * Insert 2

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Gisela',
    'Espinoza',
    'Femenino',
    20
);

-- * Insert 3

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Carlos',
    'Gonzalez',
    'Masculino',
    30
);

-- * Insert 4

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Jose',
    'Gonzalez',
    'Masculino',
    35
);

-- * Insert 5

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Luis',
    'Gonzalez',
    'Masculino',
    40
);

INSERT INTO Enfermeras (nombre, apellido, genero, edad)
VALUES(
    'Ana',
    'Martines',
    'Femenino',
    50
);



-- ! ------------------------------------------------------------------------


-- ! Insert Telefonos

-- * Insert 1

INSERT INTO Telefonos (telefono, descripcion, fk_idDoctor)
VALUES(
    '2257-7777',
    'Numero de Oficina Doc. Mateo Martinez',
    1
);

-- * Insert 2

INSERT INTO Telefonos (telefono, descripcion, fk_idEnfermera)
VALUES(
    '2121-2828',
    'Numero de Enfermera Gizela Espinoza',
    2
);

-- * Insert 3

INSERT INTO Telefonos (telefono, descripcion, fk_idPaciente)
VALUES(
    '2222-2222',
    'Numero de Paciente Ricardo Alvarez',
    1
);

-- * Insert 4

INSERT INTO Telefonos (telefono, descripcion, fk_idPaciente)
VALUES(
    '2222-2222',
    'Numero de Paciente Emely Guevara',
    2
);

-- * Insert 5

INSERT INTO Telefonos (telefono, descripcion, fk_idPaciente)
VALUES(
    '2222-2222',
    'Numero de Paciente Luis Gonzalez',
    3
);


-- * Query Test

SELECT * FROM Pacientes;

SELECT * FROM Doctores;

SELECT * FROM Telefonos;

UPDATE Doctores
SET nombre = 'Cesar',
apellido = 'Martinez',
genero = 'Masculino',
edad = 19
WHERE idDoctor = 1;

SELECT * FROM Enfermeras;

DELETE FROM Enfermeras
WHERE idEnfermera = 6;