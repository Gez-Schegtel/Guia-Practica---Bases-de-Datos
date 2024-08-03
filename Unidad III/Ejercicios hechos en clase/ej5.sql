----------
equipos(partidos_ganados: integer, partidos_perdidos: integer, partidos_empatados: integer, nombre_equipo: integer)

CP: nombre_equipo
CF: ~
CNN: ~
VU: ~

resultado(visitante: string, goles_local: integer, id_resultado: integer)

CP: id_resultado
CF: ~
CNN: ~
VU: ~

jugadores(nya: string, posición: integer, tot_fuera_juego: integer, tot_tar_ama: integer, part_jugados: integer, tot_tar_roj: integer, tot_goles: integer, tot_asis: integer, tarjetas_rojas: integer, goles_jugador: integer, tarjetas_amarillas: integer, asistencias: integer, fuera_de_juego: integer, dni_jugador_visitante: integer, dni: integer, nombre_equipo: string, id_resultado: integer)

CP: dni
CF: nombre_equipo -> equipos(nombre_equipo), dni_jugador_visitante -> jugadores(dni), id_resultado -> resultado(id_resultado)
CNN: (dni_jugador_visitante, nombre_equipo, id_resultado)
VU: dni_jugador_visitante
----------

CREATE TABLE equipos (
    partidos_ganados INT,
    partidos_perdidos INT,
    partidos_empatados INT,
    nombre_equipo INT,
    PRIMARY KEY (nombre_equipo)
);

CREATE TABLE resultado (
    visitante VARCHAR(255),
    goles_local INT,
    id_resultado INT,
    PRIMARY KEY (id_resultado)
);

CREATE TABLE jugadores (
    nya VARCHAR(255),
    posición INT,
    tot_fuera_juego INT,
    tot_tar_ama INT,
    part_jugados INT,
    tot_tar_roj INT,
    tot_goles INT,
    tot_asis INT,
    tarjetas_rojas INT,
    goles_jugador INT,
    tarjetas_amarillas INT,
    asistencias INT,
    fuera_de_juego INT,
    dni_jugador_visitante INT NOT NULL UNIQUE,
    dni INT,
    nombre_equipo VARCHAR(255) NOT NULL,
    id_resultado INT NOT NULL,
    PRIMARY KEY (dni),
    FOREIGN KEY (nombre_equipo) REFERENCES equipos(nombre_equipo),
    FOREIGN KEY (dni_jugador_visitante) REFERENCES jugadores(dni),
    FOREIGN KEY (id_resultado) REFERENCES resultado(id_resultado)
);

