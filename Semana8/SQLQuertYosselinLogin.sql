USE Clinic;
-- * DML

-- ! Insert Especialidades

-- * Insert 1

INSERT INTO Especialidades (nombreEspecialidad, descripcion, fk_idDoctor)
VALUES(
    'Cirujano Plastico',
    'Cirujia Plastica en todo el cuerpo',
    1
);

-- * Insert 2

INSERT INTO Especialidades (nombreEspecialidad, descripcion, fk_idDoctor)
VALUES(
    'Medico Pediatra',
    'Medico Pediatra para niños',
    2
);

-- * Insert 3

INSERT INTO Especialidades (nombreEspecialidad, descripcion, fk_idDoctor)
VALUES(
    'Medico General',
    'Medico General para todo tipo de enfermedades',
    3
);

-- * Insert 4

INSERT INTO Especialidades (nombreEspecialidad, descripcion, fk_idDoctor)
VALUES(
    'Dermatologo',
    'Medico Dermatologo para enfermedades de la piel',
    4
);

-- * Insert 5

INSERT INTO Especialidades (nombreEspecialidad, descripcion, fk_idDoctor)
VALUES(
    'Denstista',
    'Dentista para enfermedades de los dientes',
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Citas_Medicas

-- * Insert 1

INSERT INTO Citas_Medicas (fecha, precio, fk_idDoctor, fk_idEnfermera, fk_idExpediente)
VALUES(
    'Lunes 19 de Septiembre de 2022',
    25.50,
    1,
    1,
    1
);

-- * Insert 2

INSERT INTO Citas_Medicas (fecha, precio, fk_idDoctor, fk_idEnfermera, fk_idExpediente)
VALUES(
    'Martes 20 de Septiembre de 2022',
    30.50,
    2,
    2,
    2
);

-- * Insert 3

INSERT INTO Citas_Medicas (fecha, precio, fk_idDoctor, fk_idEnfermera, fk_idExpediente)

VALUES(
    'Miercoles 21 de Septiembre de 2022',
    35.50,
    3,
    3,
    3
);

-- * Insert 4

INSERT INTO Citas_Medicas (fecha, precio, fk_idDoctor, fk_idEnfermera, fk_idExpediente)
VALUES(
    'Jueves 22 de Septiembre de 2022',
    40.50,
    4,
    4,
    4
);

-- * Insert 5

INSERT INTO Citas_Medicas (fecha, precio, fk_idDoctor, fk_idEnfermera, fk_idExpediente)
VALUES(
    'Viernes 23 de Septiembre de 2022',
    45.50,
    5,
    5,
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Diagnosticos

-- * Insert 1

INSERT INTO Diagnosticos (descripcionDiagnostico, fk_idCitaMedica)
VALUES(
    'Se diagnostico Covid-19',
    1
);

-- * Insert 2

INSERT INTO Diagnosticos (descripcionDiagnostico, fk_idCitaMedica)
VALUES(
    'Se diagnostico ZIKA',
    2
);

-- * Insert 3

INSERT INTO Diagnosticos (descripcionDiagnostico, fk_idCitaMedica)
VALUES(
    'Se diagnostico Dengue',
    3
);

-- * Insert 4

INSERT INTO Diagnosticos (descripcionDiagnostico, fk_idCitaMedica)
VALUES(
    'Se diagnostico Gripa',
    4
);

-- * Insert 5

INSERT INTO Diagnosticos (descripcionDiagnostico, fk_idCitaMedica)
VALUES(
    'Se diagnostico Salmonela',
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Recetas

-- * Insert 1

INSERT INTO Recetas (descripcionReceta, fk_idDiagnostico)
VALUES(
    'Receta para COVID-19',
    1
);

-- * Insert 2

INSERT INTO Recetas (descripcionReceta, fk_idDiagnostico)
VALUES(
    'Receta para ZIKA',
    2
);

-- * Insert 3

INSERT INTO Recetas (descripcionReceta, fk_idDiagnostico)
VALUES(
    'Receta para Dengue',
    3
);

-- * Insert 4

INSERT INTO Recetas (descripcionReceta, fk_idDiagnostico)
VALUES(
    'Receta para Gripa',
    4
);

-- * Insert 5

INSERT INTO Recetas (descripcionReceta, fk_idDiagnostico)
VALUES(
    'Receta para Salmonela',
    5
);

-- ! -------------------------------------------------------------------


-- ! Insert Detalle_Recetas 

-- * Insert 1

INSERT INTO Detalles_Recetas (descripcionDetalleReceta, fk_idReceta)
VALUES(
    'Receta para COVID-19',
    1
);

-- * Insert 2

INSERT INTO Detalles_Recetas (descripcionDetalleReceta, fk_idReceta)
VALUES(
    'Receta para ZIKA',
    2
);

-- * Insert 3

INSERT INTO Detalles_Recetas (descripcionDetalleReceta, fk_idReceta)
VALUES(
    'Receta para Dengue',
    3
);

-- * Insert 4

INSERT INTO Detalles_Recetas (descripcionDetalleReceta, fk_idReceta)
VALUES(
    'Receta para Gripa',
    4
);

-- * Insert 5

INSERT INTO Detalles_Recetas (descripcionDetalleReceta, fk_idReceta)
VALUES(
    'Receta para Salmonela',
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Medicamentos

-- * Insert 1

INSERT INTO Medicamentos (nombreMedicamento, dosisAsignada, fechaCaducidad, indicacionesMedicamento, fk_idDetalleReceta)
VALUES(
    'Acetaminofen',
    '1 Tableta cada 4 Horas',
    '1 de Enero de 2030',
    'Tomar cada 4 Horas, en caso de alergias, consulte a su medico',
    1
);

-- * Insert 2

INSERT INTO Medicamentos (nombreMedicamento, dosisAsignada, fechaCaducidad, indicacionesMedicamento, fk_idDetalleReceta)
VALUES(
    'Ibuprofeno',
    '1 Tableta cada 8 Horas',
    '31 de Diciembre de 2030',
    'Tomar cada 8 Horas, en caso de alergias, consulte a su medico',
    2
);

-- * Insert 3

INSERT INTO Medicamentos (nombreMedicamento, dosisAsignada, fechaCaducidad, indicacionesMedicamento, fk_idDetalleReceta)
VALUES(
    'Amoxicilina',
    '1 Tableta cada 12 Horas',
    '15 de Marzo de 2030',
    'Tomar cada 12 Horas, en caso de alergias, consulte a su medico',
    3
);

-- * Insert 4

INSERT INTO Medicamentos (nombreMedicamento, dosisAsignada, fechaCaducidad, indicacionesMedicamento, fk_idDetalleReceta)
VALUES(
    'Paracetamol',
    '1 Tableta cada 4 Horas',
    '25 de Marzo de 2030',
    'Tomar cada 4 Horas, en caso de alergias, consulte a su medico',
    4
);

-- * Insert 5

INSERT INTO Medicamentos (nombreMedicamento, dosisAsignada, fechaCaducidad, indicacionesMedicamento, fk_idDetalleReceta)
VALUES(
    'Aspirina',
    '1 Tableta cada 8 Horas',
    '15 de Septiembre de 2030',
    'Tomar cada 48 Horas, en caso de alergias, consulte a su medico',
    5
);


-- ! -------------------------------------------------------------------


-- ! Insert Direcciones

-- * Insert 1

INSERT INTO Direcciones (calle, ciudad, fk_idDoctor, fk_idMunicipio)
VALUES(
    'Barrio El Calvario',
    'Santa Rosa de Lima',
    1,
    1
);

-- * Insert 2

INSERT INTO Direcciones (calle, ciudad, fk_idEnfermera, fk_idMunicipio)
VALUES(
    'Barrio La Union',
    'La Union',
    1,
    2
);

-- * Insert 3

INSERT INTO Direcciones (calle, ciudad, fk_idPaciente, fk_idMunicipio)
VALUES(
    'Colonia San Miguel',
    'San Miguel',
    1,
    3
);

-- * Insert 4

INSERT INTO Direcciones (calle, ciudad, fk_idDoctor, fk_idMunicipio)
VALUES(
    'Barrio Santa Tecla',
    'Santa Tecla',
    2,
    4
);

-- * Insert 5

INSERT INTO Direcciones (calle, ciudad, fk_idEnfermera, fk_idMunicipio)
VALUES(
    'Colonia Chalchuapa',
    'Santa Ana',
    2,
    5
);


-- * Query Test

SELECT * FROM Especialidades;

UPDATE Especialidades
SET nombreEspecialidad = 'Cirujano Veterinario', descripcion = 'Cirujano para animales'
WHERE idEspecialidad = 1;

DELETE Especialidades;