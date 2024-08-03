
CREATE TABLE reparto (
    id_reparto INTEGER,
    nombre VARCHAR(255),
    nacionalidad VARCHAR(255),
    sexo VARCHAR(255),
    PRIMARY KEY (id_reparto)
)

CREATE TABLE actores (
    actor_principal BIT,
    id_actor INTEGER,
    PRIMARY KEY (id_actor),
    FOREIGN KEY (id_actor) REFERENCES reparto(id_reparto) ON DELETE CASCADE
)

CREATE TABLE directores (
    id_director INTEGER,
    PRIMARY KEY (id_director),
    FOREIGN KEY (id_director) REFERENCES reparto(id_reparto) ON DELETE CASCADE
)

CREATE TABLE películas (
    id_película INTEGER,
    título VARCHAR(255),
    nacionalidad VARCHAR(255),
    productora VARCHAR(255),
    año_estreno INTEGER,
    días_alquiler INTEGER,
    id_director INTEGER NOT NULL,
    PRIMARY KEY (id_película),
    FOREIGN KEY (id_director) REFERENCES directores(id_director)
)

CREATE TABLE actúa (
    id_actor INTEGER,
    id_película INTEGER,
    PRIMARY KEY (id_actor, id_película),
    FOREIGN KEY (id_actor) REFERENCES actores(id_actor),
    FOREIGN KEY (id_película) REFERENCES películas(id_película)
)

CREATE TABLE ejemplares (
    nro_ejemplar INTEGER,
    estado_conservación VARCHAR(255),
    id_película INTEGER,
    PRIMARY KEY (nro_ejemplar, id_película),
    FOREIGN KEY (id_película) REFERENCES películas(id_película) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE socios (
    dni INTEGER,
    nombre VARCHAR(255),
    dirección VARCHAR(255),
    teléfono INTEGER,
    PRIMARY KEY (dni)
)

CREATE TABLE alquila (
    fecha_inicio DATE NOT NULL,
    fecha_devolución DATE NOT NULL,
    nro_ejemplar INTEGER,
    id_película INTEGER,
    dni_socio INTEGER,
    PRIMARY KEY (nro_ejemplar, id_película, dni_socio),
    FOREIGN KEY (nro_ejemplar) REFERENCES ejemplares(nro_ejemplar),
    FOREIGN KEY (id_película) REFERENCES ejemplares(id_película),
    FOREIGN KEY (dni_socio) REFERENCES socios(dni)
)

CREATE TABLE avala (
    dni_socio_avalado INTEGER,
    dni_socio_avalista INTEGER,
    PRIMARY KEY (dni_socio_avalado, dni_socio_avalista),
    FOREIGN KEY (dni_socio_avalado) REFERENCES socio(dni),
    FOREIGN KEY (dni_socio_avalista) REFERENCES socio(dni)
)