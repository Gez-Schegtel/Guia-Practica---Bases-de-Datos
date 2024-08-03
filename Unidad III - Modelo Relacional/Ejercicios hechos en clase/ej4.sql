----------
médico(nombre: string, apellido: string, especialidad: string, teléfono: entero, idMedico: entero)

CP: idMedico
CF: ~
CNN: ~
VU: ~

paciente(nombreP: string, apellidoP: string, domicilio: string, fechaNacimiento: date, teléfono: entero, idPaciente: entero, idMedico: entero)

CP: idPaciente
CF: idMedico -> médico(idMedico)
CNN: ~
VU: ~

internación(habitación: string, cama: string, fIngreso: date, fEgreso: date, idInter: entero, idPaciente: entero)

CP: idInter
CF: idPaciente -> paciente(idPaciente)
CNN: ~
VU: ~
----------

CREATE TABLE médico (
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    especialidad VARCHAR(255),
    teléfono INT,
    idMedico INT,
    PRIMARY KEY (idMedico)
);

CREATE TABLE paciente (
    nombreP VARCHAR(255),
    apellidoP VARCHAR(255),
    domicilio VARCHAR(255),
    fechaNacimiento DATE,
    teléfono INT,
    idPaciente INT,
    idMedico INT,
    PRIMARY KEY (idPaciente),
    FOREIGN KEY (idMedico) REFERENCES médico(idMedico)
);

CREATE TABLE internación (
    habitación VARCHAR(255),
    cama VARCHAR(255),
    fIngreso DATE,
    fEgreso DATE,
    idInter INT,
    idPaciente INT,
    PRIMARY KEY (idInter),
    FOREIGN KEY (idPaciente) REFERENCES paciente(idPaciente)
);
