-- ! Database

-- Create Data Base: Clinic;

CREATE DATABASE Clinic;

-- Use DataBase

USE Clinic;


-- ! ------------------------------------------------------------------------


-- ! Create Schemas

-- Create Schemas for Students

CREATE SCHEMA CesarSchema;

CREATE SCHEMA YosselinSchema;

CREATE SCHEMA RicardoSchema;


-- ! ------------------------------------------------------------------------


-- ! Create Logins

-- Create Logins for Users

CREATE LOGIN CesarLogin WITH PASSWORD = 'CesarPassword';

CREATE LOGIN YosselinLogin WITH PASSWORD = 'YosselinPassword';

CREATE LOGIN RicardoLogin WITH PASSWORD = 'RicardoPassword';


-- ! ------------------------------------------------------------------------


-- ! Create Users

-- Create Users for Students

CREATE USER CesarUser FOR LOGIN CesarLogin WITH DEFAULT_SCHEMA = CesarSchema;

CREATE USER YosselinUser FOR LOGIN YosselinLogin WITH DEFAULT_SCHEMA = YosselinSchema;

CREATE USER RicardoUser FOR LOGIN RicardoLogin WITH DEFAULT_SCHEMA = RicardoSchema;


-- ! ------------------------------------------------------------------------


-- * DCL

-- ! Create Grant Permissions for Users.

-- All Grants on Schema for User

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::CesarSchema TO CesarUser;


-- ! Grants for User on Schemas

GRANT SELECT ON SCHEMA::YosselinSchema TO YosselinUser;

GRANT INSERT ON SCHEMA::YosselinSchema TO YosselinUser;

GRANT UPDATE ON SCHEMA::YosselinSchema TO YosselinUser;


GRANT INSERT ON SCHEMA::RicardoSchema TO RicardoUser;

-- ! ------------------------------------------------------------------------


-- Create Tables DB

-- ! Table Doctores

CREATE TABLE CesarSchema.Doctores (
    idDoctor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    edad INT NOT NULL,
);

-- ! Table Enfermeras

CREATE TABLE CesarSchema.Enfermeras (
    idEnfermera INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    edad INT NOT NULL,
);

-- ! Table Departamentos

CREATE TABLE RicardoSchema.Departamentos (
    idDepartamento INT IDENTITY(1,1) PRIMARY KEY, 
    nombreDepartamento VARCHAR(50) NOT NULL,
    descripcionDepartamento VARCHAR(50) NOT NULL,
);

-- ! Table Expedientes

CREATE TABLE CesarSchema.Expedientes (
    idExpediente INT IDENTITY(1,1) PRIMARY KEY,
    descripcionExpediente VARCHAR(100) NOT NULL,

    -- Foreign Key: idPaciente
    fk_idPaciente INT NOT NULL,

);

-- ! Table Pacientes

CREATE TABLE CesarSchema.Pacientes (
    idPaciente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    edad INT NOT NULL,
);

-- ! Table Telefonos

CREATE TABLE CesarSchema.Telefonos (
    idTelefono INT IDENTITY(1,1) PRIMARY KEY, 
    telefono VARCHAR(15) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,

    -- Foreign Key: idDoctor, idEnfermera, idPaciente
    fk_idDoctor INT, --NOT NULL
    fk_idEnfermera INT, --NOT NULL
	fk_idPaciente INT, --NOT NULL

);

-- ! Table Especialidades

CREATE TABLE YosselinSchema.Especialidades (
    idEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombreEspecialidad VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,

    -- Foreign Key: idDoctor
    fk_idDoctor INT NOT NULL,
);

-- ! Table Citas_Medicas

CREATE TABLE YosselinSchema.Citas_Medicas (
    idCitaMedica INT IDENTITY(1,1) PRIMARY KEY,
    fecha VARCHAR(50) NOT NULL,
    precio FLOAT(2) NOT NULL,

    -- Foreign Key: idDoctor, idEnfermera, idExpedinete
	fk_idDoctor INT, --NOT NULL
    fk_idEnfermera INT, --NOT NULL
	fk_idExpediente INT, --NOT NULL
);

-- ! Table Diagnosticos

CREATE TABLE YosselinSchema.Diagnosticos (
    idDiagnostico INT IDENTITY(1,1) PRIMARY KEY,
    descripcionDiagnostico VARCHAR(100) NOT NULL,

    -- Foreign Key: idCitaMedica
    fk_idCitaMedica INT NOT NULL,

);

-- ! Table Recetas

CREATE TABLE YosselinSchema.Recetas (
    idReceta INT IDENTITY(1,1) PRIMARY KEY,
    descripcionReceta VARCHAR(100) NOT NULL,

    -- Foreign Key: idDiagnostico
    fk_idDiagnostico INT NOT NULL,

);

-- ! Table Detalles_Recetas

CREATE TABLE YosselinSchema.Detalles_Recetas (
    idDetalleReceta INT IDENTITY(1,1) PRIMARY KEY,
    descripcionDetalleReceta VARCHAR(100) NOT NULL,

    -- Foreign Key: idReceta
    fk_idReceta INT NOT NULL,
);

-- ! Table Medicamentos

CREATE TABLE YosselinSchema.Medicamentos (
    idMedicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombreMedicamento VARCHAR(30) NOT NULL,
    dosisAsignada VARCHAR(50) NOT NULL,
    fechaCaducidad VARCHAR(50) NOT NULL,
    indicacionesMedicamento VARCHAR(100) NOT NULL,
    
	-- Foreign Key: idDetalleReceta
    fk_idDetalleReceta INT NOT NULL,

);

-- ! Table Municipios

CREATE TABLE RicardoSchema.Municipios (
    idMunicipio INT IDENTITY(1,1) PRIMARY KEY, 
    nombreMunicipio VARCHAR(30) NOT NULL,
    descripcionMunicipo VARCHAR(50) NOT NULL,

	-- Foreign Key: idDepartamento
    fk_idDepartamento INT NOT NULL,

);

-- ! Table Direcciones

CREATE TABLE YosselinSchema.Direcciones (
    idDireccion INT IDENTITY(1,1) PRIMARY KEY,
    calle VARCHAR(35) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    
	-- Foreign Key: idPaciente, idDoctor, idEnfermera, idMunicipio
    fk_idPaciente INT,  --NOT NULL
    fk_idDoctor INT,  --NOT NULL
	fk_idEnfermera INT,  --NOT NULL
    fk_idMunicipio INT,  --NOT NULL

);

-- ! ------------------------------------------------------------------------


-- * DDL

-- ! Alter Tables


-- ! Table Expedientes
-- * Add Foreign Key: idPaciente
ALTER TABLE CesarSchema.Expedientes
ADD FOREIGN KEY(fk_idPaciente) REFERENCES CesarSchema.Pacientes(idPaciente);


-- ! Table Telefonos
-- * Add Foreign Key: idDoctor
ALTER TABLE CesarSchema.Telefonos
ADD FOREIGN KEY(fk_idDoctor) REFERENCES CesarSchema.Doctores(idDoctor);

-- * Add Foreign Key: idEnfermera
ALTER TABLE CesarSchema.Telefonos
ADD FOREIGN KEY(fk_idEnfermera) REFERENCES CesarSchema.Enfermeras(idEnfermera);

-- * Add Foreign Key: idPaciente
ALTER TABLE CesarSchema.Telefonos
ADD FOREIGN KEY(fk_idPaciente) REFERENCES CesarSchema.Pacientes(idPaciente);


-- ! Table Especialidades
-- * Add Foreign Key: idDoctor
ALTER TABLE YosselinSchema.Especialidades
ADD FOREIGN KEY(fk_idDoctor) REFERENCES CesarSchema.Doctores(idDoctor);


-- ! Table Citas_Medicas
-- * Add Foreign Key: idDoctor
ALTER TABLE YosselinSchema.Citas_Medicas
ADD FOREIGN KEY(fk_idDoctor) REFERENCES CesarSchema.Doctores(idDoctor);
    
-- * Add Foreign Key: idEnfermera
ALTER TABLE YosselinSchema.Citas_Medicas
ADD FOREIGN KEY(fk_idEnfermera) REFERENCES CesarSchema.Enfermeras(idEnfermera);
    
-- * Add Foreign Key: idExpediente
ALTER TABLE YosselinSchema.Citas_Medicas
ADD FOREIGN KEY(fk_idExpediente) REFERENCES CesarSchema.Expedientes(idExpediente);


-- ! Table Diagnosticos
-- * Add Foreign Key: idCitaMedica
ALTER TABLE YosselinSchema.Diagnosticos
ADD FOREIGN KEY(fk_idCitaMedica) REFERENCES YosselinSchema.Citas_Medicas(idCitaMedica);


-- ! Table Recetas
-- * Add Foreign Key: idDiagnostico
ALTER TABLE YosselinSchema.Recetas
ADD FOREIGN KEY(fk_idDiagnostico) REFERENCES YosselinSchema.Diagnosticos(idDiagnostico);


-- ! Table Detalles_Recetas
-- * Add Foreign Key: idReceta
ALTER TABLE YosselinSchema.Detalles_Recetas
ADD FOREIGN KEY(fk_idReceta) REFERENCES YosselinSchema.Recetas(idReceta);


-- ! Table Medicamentos
-- * Add Foreign Key: idDetalleReceta
ALTER TABLE YosselinSchema.Medicamentos
ADD FOREIGN KEY(fk_idDetalleReceta) REFERENCES YosselinSchema.Detalles_Recetas(idDetalleReceta);


-- ! Table Municipios
-- * Add Foreign Key: idDepartamento
ALTER TABLE RicardoSchema.Municipios
ADD FOREIGN KEY(fk_idDepartamento) REFERENCES RicardoSchema.Departamentos(idDepartamento);


-- ! Table Direcciones
-- * Add Foreign Key: idPaciente
ALTER TABLE YosselinSchema.Direcciones
ADD FOREIGN KEY(fk_idPaciente) REFERENCES CesarSchema.Pacientes(idPaciente);

-- * Add Foreign Key: idDoctor
ALTER TABLE YosselinSchema.Direcciones
ADD FOREIGN KEY(fk_idDoctor) REFERENCES CesarSchema.Doctores(idDoctor);

-- * Add Foreign Key: idEnfermera
ALTER TABLE YosselinSchema.Direcciones
ADD FOREIGN KEY(fk_idEnfermera) REFERENCES CesarSchema.Enfermeras(idEnfermera);

-- * Add Foreign Key: idMunicipio
ALTER TABLE YosselinSchema.Direcciones
ADD FOREIGN KEY(fk_idMunicipio) REFERENCES RicardoSchema.Municipios(idMunicipio);


-- ! ------------------------------------------------------------------------


-- * DCL

-- ! Grants especific in Tables on Schemas for Users

GRANT SELECT ON OBJECT::RicardoSchema.Departamentos TO RicardoUser;

GRANT SELECT ON OBJECT::RicardoSchema.Municipios TO RicardoUser;

GRANT SELECT ON OBJECT::YosselinSchema.Direcciones TO RicardoUser;