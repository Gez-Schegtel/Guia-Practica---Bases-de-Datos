/*
 * Voy a comentar las claves foráneas para hacer más fácil la inserción de datos.
 * 
 * No contar con estas restricciones no afectan al desarrollo de las consultas, que es lo que nos ocupa en este examen.
 * 
 */

CREATE DATABASE IF NOT EXISTS parcial_2023;
USE parcial_2023;

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
    ide INT PRIMARY KEY,
    enombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

-- Creación de la tabla Departamentos
CREATE TABLE Departamentos (
    idd INT PRIMARY KEY,
    dnombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(15, 2) NOT NULL,
    idadm INT
    -- FOREIGN KEY (idadm) REFERENCES Empleados(ide) ON DELETE SET NULL
);

-- Creación de la tabla TrabajanEn
CREATE TABLE TrabajanEn (
    ide INT,
    idd INT,
    desde DATE NOT NULL,
    hasta DATE,
    PRIMARY KEY (ide, idd, desde)
    -- FOREIGN KEY (ide) REFERENCES Empleados(ide) ON DELETE CASCADE,
    -- FOREIGN KEY (idd) REFERENCES Departamentos(idd) ON DELETE CASCADE
);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (ide, enombre, fecha_nacimiento, salario) VALUES
(1, 'Juan Pérez', '1980-05-15', 50000.00),
(2, 'María Gómez', '1975-08-25', 60000.00),
(3, 'Carlos Sánchez', '1990-12-10', 45000.00),
(4, 'Ana Torres', '1985-03-20', 55000.00),
(5, 'Luis Díaz', '1992-07-30', 47000.00);

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (idd, dnombre, presupuesto, idadm) VALUES
(10, 'Recursos Humanos', 100000.00, 1),
(20, 'Tecnología', 200000.00, 2),
(30, 'Finanzas', 150000.00, NULL),
(40, 'Marketing', 120000.00, 3);

-- Insertar datos en la tabla TrabajanEn
INSERT INTO TrabajanEn (ide, idd, desde, hasta) VALUES
(1, 10, '2010-01-01', NULL),
(2, 20, '2012-03-15', NULL),
(3, 40, '2015-07-01', '2020-06-30'),
(3, 30, '2020-07-01', NULL),
(4, 10, '2018-09-01', NULL),
(5, 20, '2019-11-01', NULL);
