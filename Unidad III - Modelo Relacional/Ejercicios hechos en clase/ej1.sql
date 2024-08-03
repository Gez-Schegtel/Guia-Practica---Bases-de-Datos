----------
PRODUCTOS(Codprod: integer, nombre: string, Precio_Unitario: real)
CP: Codprod
CF: -
CNN: -
VU: -

EMPRESA(CUIT: string, Nombre: string, Domicilio: string)
CP: CUIT
CF: -
CNN: -
VU: -

FABRICA(CodProd: integer, CUIT: string)
CP: (CodProd, CUIT)
CF: CodProd -> PRODUCTOS(CodProd), CUIT -> EMPRESA(CUIT)
CNN: -
VU: -

CLIENTES(DNI: integer, Nombre: string, Apellido: string, Domicilio: string, fNacim: date)
CP: DNI
CF: -
CNN: -
VU: -

COMPRA(DNI: integer, CodProd: integer, CUIT: string)
CP: (DNI, CodProd, CUIT)
CF: DNI -> CLIENTES(DNI), CodProd -> FABRICA(CodProd), CUIT -> FABRICA(CUIT)
CNN: -
VU: -
----------

'''
El código de Maurice:
'''

Create table PRODUCTOS(
    Codprod integer,
    nombre varchar(50),
    Precio_Unitario numeric(7,2),
    PRIMARY KEY (Codprod)
)

Create table EMPRESA(
    CUIT varchar(13),
    Nombre varchar(50),
    Domicilio varchar(50),
    PRIMARY KEY (CUIT)
)

Create table FABRICA(
    CodProd integer,
    CUIT varchar(13),
    PRIMARY KEY (codprod, CUIT),
    FOREIGN KEY (codprod) REFERENCES PRODUCTOS(codprod),
    FOREIGN KEY (CUIT) REFERENCES EMPRESA(CUIT)
)

CREATE TABLE CLIENTES(
    DNI INTEGER,
    Nombre VARCHAR(20),
    Apellido varchar(30),
    Domicilio varchar(30),
    fNacim date,
    PRIMARY KEY (DNI)
)

CREATE TABLE COMPRA(
    DNI integer,
    CodProd integer,
    CUIT VARCHAR(13),
    PRIMARY KEY (DNI, CodProd, CUIT),
    FOREIGN KEY (DNI) REFERENCES CLIENTES(DNI),
    FOREIGN KEY (CodProd) REFERENCES FABRICA(CodProd),
    FOREIGN KEY (CUIT) REFERENCES FABRICA(CUIT)
)















