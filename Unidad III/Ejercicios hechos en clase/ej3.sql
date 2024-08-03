----------
'''
Aclaración: A la entidad "cuotas" le falta la clave en el DER, así que voy asignarle acá una que se llama "idCuota".
'''
propietario(nya: string, idProp: entero)

CP: idProp
CF: ~
CNN: ~
VU: ~

vivienda(reseña: string, dirección: string, codViv: entero, idProp: entero)

CP: codViv
CF: idProp -> propietario(idProp)
CNN: ~
VU: ~

inquilinos(nya: string, idInquilino: entero)

CP: idInquilino
CF: ~
CNN: ~
VU: ~

alquileres(fFirma: date, fGarant: date, fInicio: date, fFin: date, codAlq: entero, codViv: entero, idInquilino: entero)

CP: codAlq
CF: codViv -> vivienda(codViv)
    idInquilino -> inquilinos(idInquilino)
CNN: (codViv, idInquilino)
VU: ~

renovación(codAlqEsRenoDe: entero, codAlqTieneComoReno: entero)

CP: (codAlqEsRenoDe, codAlqTieneComoReno)
CF: codAlqEsRenoDe -> alquileres(codAlq),
    codAlqTieneComoReno -> alquileres(codAlq)
CNN: ~
VU: ~

cuotas(fPago: date, nroCuota: entero, importe: real, idCuota: entero, codAlq: entero)

CP: (codAlq, idCuota)
CF: codAlq -> alquileres(codAlq) EN BORRADO CASCADA
CNN: ~
VU: ~
----------

CREATE TABLE propietario (
    nya VARCHAR(255),
    idProp INT,
    PRIMARY KEY (idProp)
);

CREATE TABLE vivienda (
    reseña VARCHAR(255),
    dirección VARCHAR(255),
    codViv INT,
    idProp INT,
    PRIMARY KEY (codViv),
    FOREIGN KEY (idProp) REFERENCES propietario(idProp)
);

CREATE TABLE inquilinos (
    nya VARCHAR(255),
    idInquilino INT,
    PRIMARY KEY (idInquilino)
);

CREATE TABLE alquileres (
    fFirma DATE,
    fGarant DATE,
    fInicio DATE,
    fFin DATE,
    codAlq INT,
    codViv INT,
    idInquilino INT,
    PRIMARY KEY (codAlq),
    FOREIGN KEY (codViv) REFERENCES vivienda(codViv),
    FOREIGN KEY (idInquilino) REFERENCES inquilinos(idInquilino)
);

CREATE TABLE renovación (
    codAlqEsRenoDe INT,
    codAlqTieneComoReno INT,
    PRIMARY KEY (codAlqEsRenoDe, codAlqTieneComoReno),
    FOREIGN KEY (codAlqEsRenoDe) REFERENCES alquileres(codAlq),
    FOREIGN KEY (codAlqTieneComoReno) REFERENCES alquileres(codAlq)
);

CREATE TABLE cuotas (
    fPago DATE,
    nroCuota INT,
    importe REAL,
    idCuota INT,
    codAlq INT,
    PRIMARY KEY (codAlq, idCuota),
    FOREIGN KEY (codAlq) REFERENCES alquileres(codAlq) ON DELETE CASCADE
);
