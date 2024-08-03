CREATE TABLE aviones (
    capacidad REAL,
    anios_servicio INTEGER,
    horas_servicio INTEGER,
    alcance REAL,
    cantidad_vuelos INTEGER,
    anio INTEGER,
    modelo VARCHAR(255),
    marca VARCHAR(255),
    matricula VARCHAR(255),
    tipo_avion VARCHAR(255),
    id_avion INTEGER,
    PRIMARY KEY (id_avion)
)

CREATE TABLE personal (
    nombre_y_apellido VARCHAR(255),
    fecha_nacimiento DATE,
    telefono INTEGER,
    email VARCHAR(255).
    edad INTEGER,
    dni INTEGER,
    PRIMARY KEY (dni)
)

CREATE TABLE pilotos (
    inicio_contrato DATE,
    fin_contrato DATE,
    dni INTEGER,
    id_avion INTEGER NOT NULL,
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES personal(dni) ON DELETE CASCADE,
    FOREIGN KEY (id_avion) REFERENCES aviones(id_avion)
)

CREATE TABLE tripulacion (
    tipo_vuelo VARCHAR(255),
    dni INTEGER,
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES personal(dni) ON DELETE CASCADE 
)

CREATE TABLE administrativos (
    sector VARCHAR(255),
    dni INTEGER,
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES personal(dni) ON DELETE CASCADE
)

CREATE TABLE trayectos (
    origen VARCHAR(255),
    destino VARCHAR(255),
    distancia VARCHAR(255),
    id_trayecto INTEGER,
    PRIMARY KEY (id_trayecto)
)

CREATE TABLE tiene_asignado2 (
    id_trayecto INTEGER,
    id_avion INTEGER,
    PRIMARY KEY (id_trayecto, id_avion),
    FOREIGN KEY (id_trayecto) REFERENCES trayectos(id_trayecto),
    FOREIGN KEY (id_avion) REFERENCES aviones(id_avion)
)

CREATE TABLE vuelos (
    costo REAL,
    cantidad_pasajeros INTEGER,
    hora_llegada VARCHAR(5),
    hora_salida VARCHAR(5),
    fecha DATE,
    id_vuelo INTEGER,
    id_trayecto INTEGER NOT NULL,
    id_avion INTEGER NOT NULL,
    PRIMARY KEY (id_vuelo),
    FOREIGN KEY (id_trayecto) REFERENCES trayectos(id_trayecto),
    FOREIGN KEY (id_avion) REFERENCES aviones(id_avion)
)

CREATE TABLE tiene_asignado3 (
    id_vuelo INTEGER,
    dni INTEGER,
    PRIMARY KEY(id_vuelo, dni),
    FOREIGN KEY (id_vuelo) REFERENCES vuelos(id_vuelo),
    FOREIGN KEY (dni) REFERENCES tripulacion(dni)
)

CREATE TABLE pasajeros (
    nombre_y_apellido VARCHAR(255),
    fecha_nacimiento DATE,
    nro_asiento CHAR(5),
    edad INTEGER,
    dni INTEGER,
    PRIMARY KEY (dni)
)

CREATE TABLE fue_atendido_por (
    dni_pasajero INTEGER,
    dni_administrativo INTEGER,
    PRIMARY KEY (dni_pasajero, dni_administrativo),
    FOREIGN KEY (dni_pasajero) REFERENCES pasajeros(dni),
    FOREIGN KEY (dni_administrativo) REFERENCES administrativos(dni)
)

CREATE TABLE pertenece_2 (
    dni INTEGER,
    id_vuelo INTEGER,
    PRIMARY KEY (dni, id_vuelo),
    FOREIGN KEY (dni) REFERENCES pasajeros(dni),
    FOREIGN KEY (id_vuelo) REFERENCES vuelos(id_vuelo)
)


'''
Aviones(capacidad: real, anios_servicio: integer, horas_servicio: integer, alcance: real, cantidad_vuelos: integer, anio: integer, modelo: string, marca: string, matricula: string, tipo_avion: string, id_avion: integer)
CP: id_avion
CF: ~
VNN: ~
VU: ~

Personal(nombre_y_apellido: string, fecha_nacimiento: date, telefono: integer, email: string, edad: integer, dni: integer)
CP: dni
CF: ~
VNN: ~
VU: ~

Pilotos(inicio_contrato: date, fin_contrato: date, dni: integer, id_avion: integer)
CP: dni
CF: dni -> Personal(dni), id_avion -> Aviones(id_avion)
VNN: ~
VU: ~

Tripulacion(tipo_vuelo: string, dni: integer)
CP: dni
CF: dni -> Personal(dni)
VNN: ~
VU: ~

Administrativos(sector: string, dni: integer)
CP: dni
CF: dni -> Personal(dni)
VNN: ~
VU: ~

Trayectos(origen: string, destino: string, distancia: string, id_trayecto: integer)
CP: id_trayecto
CF: ~
VNN: ~
VU: ~

Tiene_Asignado2(id_trayecto: integer, id_avion: integer)
CP: id_trayecto, id_avion
CF: id_trayecto -> Trayectos(id_trayecto), id_avion -> Aviones(id_avion)
VNN: ~
VU: ~

Vuelos(costo: real, cantidad_pasajeros: integer, hora_llegada: string, hora_salida: string, fecha: date, id_vuelo: integer, id_trayecto: integer, id_avion: integer)
CP: id_vuelo
CF: id_trayecto -> Trayectos(id_trayecto), id_avion -> Aviones(id_avion)
VNN: ~
VU: ~

Tiene_Asignado3(id_vuelo: integer, dni: integer)
CP: id_vuelo, dni
CF: id_vuelo -> Vuelos(id_vuelo), dni -> Tripulacion(dni)
VNN: ~
VU: ~

Pasajeros(nombre_y_apellido: string, fecha_nacimiento: date, nro_asiento: string, edad: integer, dni: integer)
CP: dni
CF: ~
VNN: ~
VU: ~

Fue_Atendido_Por(dni_pasajero: integer, dni_administrativo: integer)
CP: dni_pasajero, dni_administrativo
CF: dni_pasajero -> Pasajeros(dni), dni_administrativo -> Administrativos(dni)
VNN: ~
VU: ~

Pertenece_2(dni: integer, id_vuelo: integer)
CP: dni, id_vuelo
CF: dni -> Pasajeros(dni), id_vuelo -> Vuelos(id_vuelo)
VNN: ~
VU: ~
'''