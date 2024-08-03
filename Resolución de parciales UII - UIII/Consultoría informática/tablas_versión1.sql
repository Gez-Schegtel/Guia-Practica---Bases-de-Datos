
CREATE TABLE CONSULTORES (
    teléfono INTEGER,
    especialista_financiero BIT,
    salario REAL,
    cat_profesional VARCHAR(255),
    nombre VARCHAR(255),
    id_consultor INTEGER,
    PRIMARY KEY (id_consultor)
)

CREATE TABLE es_responsable_2 (
    id_consultor_encargado INTEGER,
    id_consultor_dependiente INTEGER,
    PRIMARY KEY (id_consultor_encargado, id_consultor_dependiente),
    FOREIGN KEY (id_consultor_encargado) REFERENCES CONSULTORES(id_consultor),
    FOREIGN KEY (id_consultor_dependiente) REFERENCES CONSULTORES(id_consultor)
)

CREATE TABLE CLIENTES (
    nombre VARCHAR(255),
    dirección VARCHAR(255),
    cuit CHAR(11),
    teléfono INTEGER,
    id_cliente INTEGER,
    PRIMARY KEY (id_cliente)
)

CREATE TABLE TICS (
    bolsa BIT,
    id_cliente INTEGER,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente) ON DELETE CASCADE
)

CREATE TABLE CONSTRUCTORAS (
    participación_OE VARCHAR(255),
    id_cliente INTEGER,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente) ON DELETE CASCADE
)

CREATE TABLE FINANCIERAS (
    volumen_ADM VARCHAR(255),
    id_cliente INTEGER,
    id_consultor INTEGER NOT NULL,
    PRIMARY KEY (id_cliente) REFERENCES CLIENTES(id_cliente) ON DELETE CASCADE
    FOREIGN KEY (id_consultor) REFERENCES CONSULTORES(id_consultor)
)

CREATE TABLE PROYECTOS (
    presupuesto REAL,
    duración INTEGER,
    nombre VARCHAR(255),
    descripción VARCHAR(255),
    id_proyecto INTEGER,
    id_consultor INTEGER NOT NULL,
    PRIMARY KEY (id_proyecto),
    FOREIGN KEY (id_consultor) REFERENCES CONSULTORES(id_consultor)
)

CREATE TABLE es_adquirido (
    precio REAL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    id_cliente INTEGER,
    id_proyecto INTEGER,
    PRIMARY KEY (id_cliente, id_proyecto),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    FOREIGN KEY (id_proyecto) REFERENCES PROYECTOS(id_proyecto)
)