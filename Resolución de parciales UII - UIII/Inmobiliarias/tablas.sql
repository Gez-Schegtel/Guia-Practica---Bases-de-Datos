
'''------------

ciudades(id_ciudad: integer, nombre: string)
CP: id_ciudad
CF: ~
VNN: nombre
VU: ~

zonas(nombre: string, id_ciudad: integer, id_agencia: integer)
CP: (nombre, id_ciudad) 
CF: id_ciudad -> ciudades(id_ciudad) on delete cascade on update cascade, id_agencia -> agencias(id_agencia)
VNN: id_agencia
VU: ~

agencias(director: string, teléfono: integer, dirección: string, id_agencia: integer, dni: integer)
CP: id_agencia 
CF: dni -> agentes(dni)
VNN: dni
VU: ~

agentes(nombre: string, dirección: string, teléfono: string, antigüedad: integer, cant_facturada: real, fecha_contratación: date, dni: integer)
CP: dni
CF: ~
VNN: (nombre, fecha_contratación)
VU: ~

trabajan(dni: integer, id_agencia: integer)
CP: (dni, id_agencia)
CF: dni -> agentes(dni), id_agencia -> agencias(id_agencia)
VNN: ~
VU: ~

se_registra(desde: date, id_agencia: integer, dni: integer)
CP: (dni, id_agencia) 
CF: dni -> clientes(dni), id_agencia -> agencias(id_agencia)
VNN: desde
VU: ~

clientes(nombre: string, teléfono: integer, email: string, dni: integer)
CP: dni
CF: ~
VNN: (nombre, teléfono)
VU: ~

es_asignado(dni_cliente, dni_agente)
CP: (dni_cliente, dni_agente)
CF: dni_cliente -> clientes(dni), dni_agente -> agentes(dni)
VNN: ~
VU: ~

preferencias(nro_habitaciones: integer, rango_precios: real, fecha_adq: date, tipo_inmueble: string, zona: string, nro_pref: integer, dni: integer)
CP: (nro_pref: integer, dni: integer)
CF: dni -> clientes(dni) on delete cascade on update cascade
VNN: ~
VU: ~

inmuebles(dirección: string, precio: real, propietario: string, disponibilidad: boolean, id_inmueble: integer, id_ciudad: integer)
CP: id_inmueble
CF: id_ciudad -> id_ciudad(ciudades)
VNN: id_ciudad
VU: ~

campos(superficie: real, urbanizado: boolean, id_inmueble: integer)
CP: id_inmueble 
CF: id_inmueble -> inmuebles(id_inmueble) on delete cascade
VNN: ~
VU: ~

comerciales(uso_destinado: string, área: real, id_inmueble: integer)
CP: id_inmueble
CF: id_inmueble -> inmuebles(id_inmueble) on delete cascade
VNN: ~
VU: ~

viviendas(garage: boolean, superficie: real, descripción: string, nro_habitacioens: integer, nro_baños: integer, id_inmueble: integer)
CP: id_inmueble
CF: id_inmueble -> inmuebles(id_inmueble) on delete cascade
VNN: ~
VU: ~

controla_1(id_agencia: integer, id_inmueble: integer)
CP: (id_agencia, id_inmueble) 
CF: id_agencia -> agencias(id_agencias), id_inmueble -> inmuebles(id_inmueble)
VNN: ~
VU: ~

visita(dni_agente: integer, dni_cliente: integer, id_inmueble: integer, fecha_vis: date, duración: integer)
CP: (dni_agente, dni_cliente, id_inmueble) 
CF: dni_agente -> agentes(dni), dni_cliente -> clientes(dni_cliente), id_inmueble -> inmuebles(id_inmueble)
VNN: (fecha_vis, duración)
VU: ~

compra(dni: integer, id_inmueble: integer)
CP: (dni, id_inmueble) 
CF: dni -> clientes(dni), id_inmueble -> inmuebles(id_inmueble)
VNN: ~
VU: ~

vende(fecha_dis: date, detalle: string, tipo_inmueble: string, dni: integer, id_inmueble: integer)
CP: (dni, id_inmueble)
CF: dni -> clientes(dni), id_inmueble -> inmuebles(id_inmueble)
VNN: (fecha_dis, detalle, tipo_inmueble)
VU: ~

------------'''

CREATE TABLE ciudades (
    id_ciudad INTEGER,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_ciudad)
);

CREATE TABLE zonas (
    nombre VARCHAR(255),
    id_ciudad INTEGER,
    id_agencia INTEGER NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (nombre, id_ciudad)
);

CREATE TABLE agencias (
    director VARCHAR(255),
    teléfono INTEGER,
    dirección VARCHAR(255),
    id_agencia INTEGER,
    dni INTEGER,
    FOREIGN KEY (dni) REFERENCES agentes(dni),
    PRIMARY KEY(id_agencia)
);

CREATE TABLE agentes (
    nombre VARCHAR(255) NOT NULL,
    dirección VARCHAR(255),
    teléfono VARCHAR(255),
    antigüedad INTEGER,
    cant_facturada REAL,
    fecha_contratación DATE NOT NULL,
    dni INTEGER,
    PRIMARY KEY(dni)
);

CREATE TABLE trabajan (
    dni INTEGER,
    id_agencia INTEGER,
    FOREIGN KEY (dni) REFERENCES agentes(dni),
    FOREIGN KEY (id_agencia) REFERENCES agencias(id_agencia),
    PRIMARY KEY (dni, id_agencia)
);

CREATE TABLE se_registra (
    desde DATE NOT NULL,
    id_agencia INTEGER,
    dni INTEGER,
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (id_agencia) REFERENCES agencias(id_agencia),
    PRIMARY KEY (dni, id_agencia)
);

CREATE TABLE clientes (
    nombre VARCHAR(255) NOT NULL,
    teléfono INTEGER NOT NULL,
    email VARCHAR(255),
    dni INTEGER,
    PRIMARY KEY(dni)
);

CREATE TABLE es_asignado (
    dni_cliente INTEGER,
    dni_agente INTEGER,
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni),
    FOREIGN KEY (dni_agente) REFERENCES agentes(dni),
    PRIMARY KEY (dni_cliente, dni_agente)
);

CREATE TABLE preferencias (
    nro_habitaciones INTEGER,
    rango_precios REAL,
    fecha_adq DATE,
    tipo_inmueble VARCHAR(255),
    zona VARCHAR(255),
    nro_pref INTEGER,
    dni INTEGER,
    FOREIGN KEY (dni) REFERENCES clientes(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (nro_pref, dni)
);

CREATE TABLE inmuebles (
    dirección VARCHAR(255),
    precio REAL,
    propietario VARCHAR(255),
    disponibilidad BOOLEAN,
    id_inmueble INTEGER,
    id_ciudad INTEGER NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE campos (
    superficie REAL,
    urbanizado BOOLEAN,
    id_inmueble INTEGER,
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble) ON DELETE CASCADE,
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE comerciales (
    uso_destinado VARCHAR(255),
    área REAL,
    id_inmueble INTEGER,
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble) ON DELETE CASCADE,
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE viviendas (
    garage BOOLEAN,
    superficie REAL,
    descripción VARCHAR(255),
    nro_habitacioens INTEGER,
    nro_baños INTEGER,
    id_inmueble INTEGER,
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble) ON DELETE CASCADE,
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE controla_1 (
    id_agencia INTEGER,
    id_inmueble INTEGER,
    FOREIGN KEY (id_agencia) REFERENCES agencias(id_agencia),
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble),
    PRIMARY KEY (id_agencia, id_inmueble)
);

CREATE TABLE visita (
    dni_agente INTEGER,
    dni_cliente INTEGER,
    id_inmueble INTEGER,
    fecha_vis DATE NOT NULL,
    duración INTEGER NOT NULL,
    FOREIGN KEY (dni_agente) REFERENCES agentes(dni),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni_cliente),
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble),
    PRIMARY KEY (dni_agente, dni_cliente, id_inmueble)
);

CREATE TABLE compra (
    dni INTEGER,
    id_inmueble INTEGER,
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble),
    PRIMARY KEY (dni, id_inmueble)
);

CREATE TABLE vende (
    fecha_dis DATE NOT NULL,
    detalle VARCHAR(255) NOT NULL,
    tipo_inmueble VARCHAR(255) NOT NULL,
    dni INTEGER,
    id_inmueble INTEGER,
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (id_inmueble) REFERENCES inmuebles(id_inmueble),
    PRIMARY KEY (dni, id_inmueble)
);
