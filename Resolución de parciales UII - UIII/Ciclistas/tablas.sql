
'''
El parcial no pide la tabla del modelo ER del primer punto, pero lo voy a hacer igual para practicar.

El segundo punto no lo voy a hacer porque esos ejercicios los hicimos en clase.
'''

CREATE TABLE etapas (
    puertos_montaña VARCHAR(255),
    nro_etapa INTEGER,
    fecha DATE,
    hora_salida INTEGER,
    hora_llegada INTEGER,
    contrarreloj BOOLEAN,
    distancia REAL,
    origen VARCHAR(255),
    destino VARCHAR(255),
    id_etapa INTEGER,
    PRIMARY KEY (id_etapa)
)

CREATE TABLE puertos (
    categoría_puerto VARCHAR(255),
    montaña BOOLEAN,
    id_puerto INTEGER,
    id_etapa INTEGER,
    PRIMARY KEY (id_puerto, id_etapa),
    FOREIGN KEY (id_etapa) REFERENCES etapas(id_etapa) ON DELETE CASCADE
)

CREATE TABLE proveedores (
    nombre VARCHAR(255),
    tipo_materiales VARCHAR(255),
    id_proveedor INTEGER,
    PRIMARY KEY (id_proveedor)
)

CREATE TABLE equipos (
    patrocinador VARCHAR(255),
    director VARCHAR(255),
    nacionalidad VARCHAR(255),
    nombre_equipo VARCHAR(255),
    id_equipo INTEGER,
    PRIMARY KEY (id_equipo)
)

CREATE TABLE contrato (
    detalle VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_contrato INTEGER,
    id_equipo INTEGER NOT NULL,
    id_proveedor INTEGER NOT NULL,
    PRIMARY KEY (id_contrato),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
)

CREATE TABLE clasificaciones (
    tiempo_total INTEGER,
    puntos_totales INTEGER,
    id_clasificación INTEGER,
    PRIMARY KEY (id_clasificación)
)

CREATE TABLE clasifica_1 (
    id_ciclista INTEGER,
    id_puerto INTEGER,
    id_etapa INTEGER,
    id_clasificación INTEGER,
    posición_llegada INTEGER,
    tiempo_parcial INTEGER,
    puntos_parciales INTEGER,
    PRIMARY KEY (id_ciclista, id_puerto, id_etapa, id_clasificación),
    FOREIGN KEY (id_ciclista) REFERENCES ciclistas(id_ciclista),
    FOREIGN KEY (id_puerto) REFERENCES puertos(id_puerto),
    FOREIGN KEY (id_etapa) REFERENCES puertos(id_etapa),
    FOREIGN KEY (id_clasificación) REFERENCES clasificaciones(id_clasificación)
)

CREATE TABLE ciclistas (
    nacionalidad VARCHAR(255),
    nombre VARCHAR(255),
    fecha_nacimiento DATE,
    edad INTEGER,
    mejores_clasificaciones TEXT,
    dorsal INTEGER,
    id_ciclista INTEGER,
    id_equipo INTEGER NOT NULL,
    PRIMARY KEY (id_ciclista),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
)

CREATE TABLE entrevistas (
    entrevistador VARCHAR(255),
    fecha DATE,
    id_entrevista INTEGER,
    id_ciclista INTEGER NOT NULL,
    PRIMARY KEY (id_entrevista),
    FOREIGN KEY (id_ciclista) REFERENCES ciclistas(id_ciclista)
)