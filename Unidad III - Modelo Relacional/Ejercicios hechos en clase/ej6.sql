----------
persona(nombre: string, calle: string, ciudad: string, id_persona: entero)

CP: id_persona
CF: ~
CNN: ~
VU: ~

empleado(suedo: real, id_persona)

CP: id_persona
CF: id_persona -> persona(id_persona) EN BORRADO CASCADA
CNN: ~
VU: ~

cliente(calificación_creditaria: string, id_persona: entero)

CP: id_persona
CF: id_persona -> persona(id_persona) EN BORRADO CASCADA
CNN: ~
VU: ~

oficial(número_despacho: entero, id_persona: entero)

CP: id_persona
CF: id_persona -> empleado(id_persona) EN BORRADO CASCADA
CNN: ~
VU: ~

cajero(número_caja: entero, horas_trabajadas: real, id_persona: entero)

CP: id_persona
CF: id_persona -> empleado(id_persona) EN BORRADO CASCADA
CNN: ~
VU: ~

secretaria(horas_trabajadas: real, id_persona: entero)

CP: id_persona
CF: id_persona -> empleado(id_persona) EN BORRADO CASCADA
CNN: ~
VU: ~
----------

CREATE TABLE persona (
    nombre VARCHAR(255),
    calle VARCHAR(255),
    ciudad VARCHAR(255),
    id_persona INT,
    PRIMARY KEY (id_persona)
);

CREATE TABLE empleado (
    sueldo REAL,
    id_persona INT,
    PRIMARY KEY (id_persona),
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
);

CREATE TABLE cliente (
    calificación_creditaria VARCHAR(255),
    id_persona INT,
    PRIMARY KEY (id_persona),
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
);

CREATE TABLE oficial (
    número_despacho INT,
    id_persona INT,
    PRIMARY KEY (id_persona),
    FOREIGN KEY (id_persona) REFERENCES empleado(id_persona) ON DELETE CASCADE
);

CREATE TABLE cajero (
    número_caja INT,
    horas_trabajadas REAL,
    id_persona INT,
    PRIMARY KEY (id_persona),
    FOREIGN KEY (id_persona) REFERENCES empleado(id_persona) ON DELETE CASCADE
);

CREATE TABLE secretaria (
    horas_trabajadas REAL,
    id_persona INT,
    PRIMARY KEY (id_persona),
    FOREIGN KEY (id_persona) REFERENCES empleado(id_persona) ON DELETE CASCADE
);
