----------
camiones(matricula: string, modelo: string, tipo: string, potencia: real)
CP: matricula
CF: -
CNN: -
VU: -

camioneros(dni: integer, nombre: string, domicilio: string, telefono: integer, salario: real, fecha_partida: date, fecha_regreso: date, provincia: string, matricula: string)
CP: dni
CF: matricula -> camiones(matricula)
CNN: fecha_partida, fecha_regreso, matricula
VU: matricula

provincia(cod_postal: integer, nombre: string)
CP: cod_postal
CF: -
CNN: -
VU: -

paquete(cod_paq: integer, descrip: text, destinat: string, domicilio_destino: string, cod_postal: integer, dni: integer)
CP: cod_paq
CF: cod_postal -> provincia(cod_postal), dni -> camioneros(dni)
CNN: -
VU: -

----------
CREATE TABLE camiones (
    matricula VARCHAR(10),
    modelo VARCHAR(30),
    tipo VARCHAR(30),
    potencia REAL,
    PRIMARY KEY (matricula)
)

CREATE TABLE camioneros (
    dni INTEGER,
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    telefono INTEGER,
    salario REAL,
    fecha_partida DATE NOT NULL,
    fecha_regreso DATE NOT NULL,
    provincia VARCHAR(50),
    matricula VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (dni),
    FOREIGN KEY (matricula) REFERENCES camiones(matricula)
)

CREATE TABLE provincia (
    cod_postal INTEGER,
    nombre VARCHAR(50),
    PRIMARY KEY (cod_postal)
)

CREATE TABLE paquete (
    cod_paq INTEGER,
    descrip TEXT,
    destinat VARCHAR(50),
    domicilio_destino VARCHAR(50),
    cod_postal INTEGER,
    dni INTEGER,
    PRIMARY KEY (cod_paq),
    FOREIGN KEY (cod_postal) REFERENCES provincia(cod_postal),
    FOREIGN KEY (dni) REFERENCES camioneros(dni)
)