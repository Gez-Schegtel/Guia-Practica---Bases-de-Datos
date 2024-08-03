'''
Inmobiliaria "La Judith"
'''
CREATE TABLE propietario (
    idProp INTEGER,
    nombre_y_apellido CHAR(50),
    celular INTEGER,
    PRIMARY KEY (idProp)
)

CREATE TABLE vivienda (
    codViv INTEGER,
    resenia CHAR(255),
    direccion CHAR(30),
    idProp INTEGER,
    PRIMARY KEY (codViv),
    FOREIGN KEY (idProp) REFERENCES propietario(idProp)
)

CREATE TABLE inquilinos (
    idInquil INTEGER,
    nombre_y_apellido CHAR(50),
    celular INTEGER,
    PRIMARY KEY (idInquil)
)

CREATE TABLE alquileres (
    codAlq INTEGER,
    cuota REAL(7,2),
    f_firma DATE,
    f_garant DATE,
    f_inicio DATE,
    f_fin DATE,
    codViv INTEGER NOT NULL,
    idInquil INTEGER NOT NULL,
    PRIMARY KEY (codAlq),
    FOREIGN KEY (codViv) REFERENCES vivienda(codViv),
    FOREIGN KEY (idInquil) REFERENCES inquilinos(idInquil)
)

CREATE TABLE renovacion (
    codAlqTCR INTEGER,
    codAlqERD INTEGER,
    PRIMARY KEY (codAlqTCR, codAlqERD),
    FOREIGN KEY (codAlqTCR) REFERENCES alquileres(codAlq),
    FOREIGN KEY (codAlqERD) REFERENCES alquileres(codAlq),
)

'''
Este ejercicio no tiene nombre.
'''
clientes(dni: entero, nombre: string, apellido: string, domicilio: string, fNAcim: date)

CP: dni
CF: ~
CNN: ~
VU: ~

proveedores(cuit: string, nombre: string, domicilio: string)

CP: cuit
CF: ~
CNN: ~
VU: ~

productos(codProd: entero, nombre: string, precioUnitario: real, cuit: string)

CP: codProd
CF: cuit -> proveedores(cuit)
CNN: ~
VU: ~

compra(dni: entero, codProd: entero)

CP: (dni, codProd)
CF: dni -> clientes(dni),
    codProd -> productos(codProd)
CNN: ~
VU: ~
