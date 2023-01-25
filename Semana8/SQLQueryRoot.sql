-- ! Database

-- Create Data Base: Clinic;

CREATE DATABASE Clinic;
GO

-- Use DataBase

USE Clinic;
GO


-- ! ------------------------------------------------------------------------


-- ! Create Schemas

-- Create Schemas




-- ! ------------------------------------------------------------------------


-- ! Create Logins

-- Create Logins for Users



-- ! ------------------------------------------------------------------------


-- ! Create Users

-- Create Users for Students



-- ! ------------------------------------------------------------------------


-- * DCL

-- ! Create Grant Permissions.


-- ! ------------------------------------------------------------------------


-- Create Tables DB

-- ! Table Doctores

CREATE TABLE SchemaSecretary.Doctores (
    idDoctor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(1) NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    edad INT NOT NULL CHECK (edad > 0),

	
    -- Foreign Key: idEspecialidad
    fk_idEspecialidad INT NOT NULL,
);
GO

-- ! Table Enfermeras

CREATE TABLE SchemaSecretary.Enfermeras (
    idEnfermera INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(1) NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    edad INT NOT NULL CHECK (edad > 0),
);
GO

-- ! Table Departamentos

CREATE TABLE SchemaSecretary.Departamentos (
    idDepartamento INT IDENTITY(1,1) PRIMARY KEY, 
    nombreDepartamento VARCHAR(50) NOT NULL,
    descripcionDepartamento VARCHAR(60) NOT NULL,
);
GO

-- ! Table Municipios

CREATE TABLE SchemaSecretary.Municipios (
    idMunicipio INT IDENTITY(1,1) PRIMARY KEY, 
    nombreMunicipio VARCHAR(50) NOT NULL,
    descripcionMunicipo VARCHAR(60) NOT NULL,

	-- Foreign Key: idDepartamento
    fk_idDepartamento INT NOT NULL,
);
GO

-- ! Table Expedientes

CREATE TABLE SchemaNurse.Expedientes (
    idExpediente INT IDENTITY(1,1) PRIMARY KEY,
	numeroExpediente VARCHAR(10) NOT NULL,
	fechaExpediente DATE NOT NULL,
    descripcionExpediente VARCHAR(100) NOT NULL,

    -- Foreign Key: idPaciente
    fk_idPaciente INT NOT NULL,

);
GO

-- ! Table Pacientes

CREATE TABLE SchemaSecretary.Pacientes (
    idPaciente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(1) NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    edad INT NOT NULL CHECK (edad > 0),
);
GO


-- ! Table Especialidades

CREATE TABLE SchemaSecretary.Especialidades (
    idEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombreEspecialidad VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
);
GO

-- ! Table Citas_Medicas

CREATE TABLE SchemaSecretary.Citas_Medicas (
    idCitaMedica INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    precio FLOAT(2) NOT NULL,

    -- Foreign Key: idDoctor, idEnfermera, idExpedinete
	fk_idDoctor INT NOT NULL,
    fk_idEnfermera INT NOT NULL,
	fk_idExpediente INT NOT NULL,
	fk_idDiagnostico INT NOT NULL,
);
GO

-- ! Table Diagnosticos

CREATE TABLE SchemaDoctor.Diagnosticos (
    idDiagnostico INT IDENTITY(1,1) PRIMARY KEY,
	sintomas VARCHAR(100) NOT NULL,
	signos_vitales VARCHAR(100) NOT NULL,

);
GO

-- ! Table Recetas

CREATE TABLE SchemaDoctor.Recetas (
    idReceta INT IDENTITY(1,1) PRIMARY KEY,
	dosis VARCHAR(100) NOT NULL,
    descripcionReceta VARCHAR(100) NOT NULL,

    -- Foreign Key: idDiagnostico
    fk_idMedicamento INT NOT NULL,
	fk_idDiagnostico INT NOT NULL,

);
GO

-- ! Table Farmaceutica

CREATE TABLE SchemaNurse.Farmaceuticas(
	idFarmaceutica INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
);

-- ! Table Medicamentos

CREATE TABLE SchemaNurse.Medicamentos (
    idMedicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombreMedicamento VARCHAR(50) NOT NULL,
    fechaCaducidad VARCHAR(50) NOT NULL,
    indicacionesMedicamento VARCHAR(100) NOT NULL,
    
	-- Foreign Key: idDetalleReceta
    fk_idFarmaceutica INT NOT NULL,

);
GO

CREATE TABLE SchemaSecretary.Direccion_Paciente(
    idDireccion INT IDENTITY (1,1) PRIMARY KEY,
    calle VARCHAR(50),
    ciudad VARCHAR(50),
    numeroCasa VARCHAR(5),

    -- Foreign Key: idMunicipio
    fk_idMunicipio INT NOT NULL,
    fk_idPaciente INT NOT NULL,
);
GO

CREATE TABLE SchemaSecretary.Telefono_Paciente(
    idTelefono INT IDENTITY (1,1) PRIMARY KEY,
    telefono VARCHAR (15),
    descripcion VARCHAR (20),

    -- Foreign Key: idPaciente
    fk_idPaciente INT NOT NULL,
);
GO

CREATE TABLE SchemaSecretary.Direccion_Doctor (
    idDireccion INT IDENTITY (1,1) PRIMARY KEY,
    Calle VARCHAR (30),
    Cuidad VARCHAR (30),
    Numero_Casa VARCHAR(5),

    -- Foreign Key: idMunicipio
    fk_idMunicipio INT NOT NULL,
    fk_idDoctor INT NOT NULL,
);

CREATE TABLE SchemaSecretary.Telefono_Doctor (
    idTelefono INT IDENTITY (1,1) PRIMARY KEY,
    telefono VARCHAR (15),
    descripcion VARCHAR (20),

    -- Foreign Key: idDoctor
    fk_idDoctor INT NOT NULL,
);
GO

CREATE TABLE SchemaSecretary.Direccion_Enfermera (
    idDireccion INT IDENTITY (1,1) PRIMARY KEY,
    calle VARCHAR (30),
    cuidad VARCHAR (30),
    numeroCasa VARCHAR(5),

    -- Foreign Key: idMunicipio
    fk_idMunicipio INT NOT NULL,
    fk_idEnfermera INT NOT NULL,
);
GO

CREATE TABLE SchemaSecretary.Telefono_Enfermera (
    idTelefono INT IDENTITY (1,1) PRIMARY KEY,
    telefono VARCHAR (15),
    descripcion VARCHAR (20),

    -- Foreign Key: idEnfermera
    fk_idEnfermera INT NOT NULL,
);
GO

-- ! ------------------------------------------------------------------------


-- * DDL

-- ! Alter Tables

--! Table Direccion_Doctor
-- * Add Foreign Key: idMunicipio
ALTER TABLE SchemaSecretary.Direccion_Doctor
ADD FOREIGN KEY (fk_idMunicipio) REFERENCES SchemaSecretary.Municipios(idMunicipio)
GO

-- * Add Foreign Key: idDoctor
ALTER TABLE SchemaSecretary.Direccion_Doctor
ADD FOREIGN KEY (fk_idDoctor) REFERENCES SchemaSecretary.Doctor(idDoctor)
GO

--! Table Telefono_Doctor
-- * Add Foreign Key: idDoctor
ALTER TABLE SchemaSecretary.Telefono_Doctor
ADD FOREIGN KEY (fk_idDoctor) REFERENCES SchemaSecretary.Doctor(idDoctor)
GO

--! Table Direccion_Paciente

-- * Add Foreign Key: idPaciente
ALTER TABLE SchemaSecretary.Direccion_Paciente
ADD FOREIGN KEY (fk_idPaciente) REFERENCES SchemaSecretary.Paciente(idPaciente)
GO

-- * Add Foreign Key: idMunicipio
ALTER TABLE SchemaSecretary.Direccion_Paciente
ADD FOREIGN KEY (fk_idMunicipio) REFERENCES SchemaSecretary.Municipios(idMunicipio)
GO

--! Table Telefono_Paciente

-- * Add Foreign Key: idPaciente
ALTER TABLE SchemaSecretary.Telefono_Paciente
ADD FOREIGN KEY (fk_idPaciente) REFERENCES SchemaSecretary.Paciente(idPaciente)
GO

--! Table Direccion_Enfermera

--* Add Foreign Key: idEnfermera
ALTER TABLE SchemaSecretary.Direccion_Enfermera
ADD FOREIGN KEY (fk_idEnfermera) REFERENCES SchemaSecretary.Enfermera(idEnfermera)
GO

-- * Add Foreign Key: idMunicipio
ALTER TABLE SchemaSecretary.Direccion_Enfermera
ADD FOREIGN KEY (fk_idMunicipio) REFERENCES SchemaSecretary.Municipios(idMunicipio)
GO

--! Table Telefono_Enfermera

-- * Add Foreign Key: idEnfermera
ALTER TABLE SchemaSecretary.Telefono_Enfermera
ADD FOREIGN KEY (fk_idEnfermera) REFERENCES SchemaSecretary.Enfermera(idEnfermera)
GO


-- ! Table Expedientes
-- * Add Foreign Key: idPaciente
ALTER TABLE SchemaNurse.Expedientes
ADD FOREIGN KEY(fk_idPaciente) REFERENCES SchemaSecretary.Pacientes(idPaciente);
GO

-- ! Table Especialidades
-- * Add Foreign Key: idDoctor
ALTER TABLE SchemaSecretary.Especialidades
ADD FOREIGN KEY(fk_idDoctor) REFERENCES SchemaSecretary.Doctor(idDoctor);
GO


-- ! Table Citas_Medicas
-- * Add Foreign Key: idDoctor
ALTER TABLE SchemaSecretary.Citas_Medicas
ADD FOREIGN KEY(fk_idDoctor) REFERENCES SchemaSecretary.Doctor(idDoctor);
GO
    
-- * Add Foreign Key: idEnfermera
ALTER TABLE SchemaSecretary.Citas_Medicas
ADD FOREIGN KEY(fk_idEnfermera) REFERENCES SchemaSecretary.Enfermeras(idEnfermera);
GO
    
-- * Add Foreign Key: idExpediente
ALTER TABLE SchemaSecretary.Citas_Medicas
ADD FOREIGN KEY(fk_idExpediente) REFERENCES SchemaNurse.Expedientes(idExpediente);
GO

-- * Add Foreign Key: idDiagnostico
ALTER TABLE SchemaSecretary.Citas_Medicas
ADD FOREIGN KEY(fk_idDiagnostico) REFERENCES SchemaDoctor.Diagnosticos(idDiagnostico);
GO


-- ! Table Recetas
-- * Add Foreign Key: idDiagnostico
ALTER TABLE SchemaDoctor.Recetas
ADD FOREIGN KEY(fk_idDiagnostico) REFERENCES SchemaDoctor.Diagnosticos(idDiagnostico);
GO

-- ! Table Municipios
-- * Add Foreign Key: idDepartamento
ALTER TABLE SchemaSecretary.Municipios
ADD FOREIGN KEY(fk_idDepartamento) REFERENCES SchemaSecretary.Departamentos(idDepartamento);
GO


-- ! ------------------------------------------------------------------------