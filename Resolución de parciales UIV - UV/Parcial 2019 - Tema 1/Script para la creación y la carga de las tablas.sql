/*
 * Aclaraciones:
 * 
 * Las claves foráneas están comentadas así es más fácil cargar o modificar las tablas, ya que de esta forma no hace falta controlar cuestiones como la integridad referencial. 
 * 
 * No tener estas claves no afecta en nada al desarrollo de las consultas.
 * 
 */

CREATE DATABASE IF NOT EXISTS parcial_2019;
USE parcial_2019;

-- Crear la tabla Equipo
CREATE TABLE Equipo (
    noEquipo INT PRIMARY KEY,
    ciudad VARCHAR(100),
    nombre VARCHAR(100)
);

-- Crear la tabla Jugador
CREATE TABLE Jugador (
    noJugador INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT
);

-- Crear la tabla JugEn
CREATE TABLE JugEn (
    noJugador INT,
    noEquipo INT,
    añoDesde YEAR(4),
    temporadas INT,
    PRIMARY KEY (noJugador, noEquipo)
    -- FOREIGN KEY (noJugador) REFERENCES Jugador(noJugador),
    -- FOREIGN KEY (noEquipo) REFERENCES Equipo(noEquipo)
);

-- Crear la tabla Entrenador
CREATE TABLE Entrenador (
    nombre VARCHAR(100) PRIMARY KEY,
    teléfono VARCHAR(20),
    dirección VARCHAR(255)
);

-- Crear la tabla Dirigió
CREATE TABLE Dirigio (
    nombre VARCHAR(100),
    noEquipo INT,
    añoDesde YEAR(4),
    temporadas INT
    -- PRIMARY KEY (nombre, noEquipo),
    -- FOREIGN KEY (nombre) REFERENCES Entrenador(nombre),
    -- FOREIGN KEY (noEquipo) REFERENCES Equipo(noEquipo)
);

-- Insertar datos en la tabla Equipo
INSERT INTO parcial_2019.Equipo (noEquipo,ciudad,nombre) VALUES
	 (1,'Bogotá','Millonarios'),
	 (2,'Cali','Deportivo Cali'),
	 (3,'Medellín','Atlético Nacional'),
	 (4,'Barranquilla','América'),
	 (5,'Bogotá','Santa Fe'),
	 (6,'Costa Sur','Boedo Rangers'),
	 (7,'Costa Sur','Saint Mamilonne');

-- Insertar datos en la tabla Jugador
INSERT INTO Jugador (noJugador, nombre, edad) VALUES
	 (1,'Juan Pérez',28),
	 (2,'Carlos Martínez',30),
	 (3,'Andrés Gómez',25),
	 (4,'David Rodríguez',22),
	 (5,'Luis Hernández',27);

-- Insertar datos en la tabla JugEn
INSERT INTO JugEn (noJugador, noEquipo, añoDesde, temporadas) VALUES
	 (1,1,2018,5),
	 (1,2,2004,1),
	 (1,3,2005,1),
	 (1,4,2006,1),
	 (1,5,2007,1),
	 (2,2,2015,4),
	 (3,3,2019,3),
	 (4,4,2020,2),
	 (5,4,2017,NULL);

-- Insertar datos en la tabla Entrenador
INSERT INTO Entrenador (nombre, teléfono, dirección) VALUES
	 ('Diego Sánchez','3214567894','Calle 127, Bogotá'),
	 ('Fernando Díaz','3214567892','Calle 125, Medellín'),
	 ('José López','3214567891','Calle 124, Cali'),
	 ('Miguel Ramírez','3214567890','Calle 123, Bogotá'),
	 ('Raúl Torres','3214567893','Calle 126, Barranquilla');

-- Insertar datos en la tabla Dirigió
INSERT INTO Dirigio (nombre, noEquipo, añoDesde, temporadas) VALUES
	 ('Miguel Ramírez',1,2016,7),
	 ('José López',2,2017,5),
	 ('Fernando Díaz',3,2018,4),
	 ('Raúl Torres',4,2019,3),
	 ('Diego Sánchez',5,2015,8),
	 ('Raúl Torres',2,2001,9),
	 ('Diego Sánchez',1,1999,14),
	 ('José López',6,2010,2),
	 ('José López',7,2014,2);

