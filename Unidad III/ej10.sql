----------
1.
CREATE TABLE automoviles (
    patente CHAR(10),
    modelo CHAR(20),
    marca CHAR(30),
    nrochasis INTEGER,
    nroacci INTEGER,
    dni INTEGER NOT NULL, 
    PRIMARY KEY (patente),
    FOREIGN KEY (dni) REFERENCES clientes(dni),
) 

CREATE TABLE clientes (
    dni INTEGER,
    nombre_y_apellido CHAR(40),
    tel INTEGER,
    email CHAR(40),
    PRIMARY KEY (dni)
)
----------
2.
CREATE TABLE pacientes (
    dni INTEGER,
    nya CHAR (30),
    tel INTEGER,
    direc CHAR (30),
    PRIMARY KEY (dni),
    
)

CREATE TABLE medicos (
    dni INTEGER,
    nro_mat CHAR(30),
    nombre_y_apellido CHAR(40),
    especialidad CHAR(20),
    PRIMARY KEY (dni)
)

CREATE TABLE examenes_medicos (
    nro_exam INTEGER,
    fecha_exam DATE,
    tipo_exam CHAR(30),
    dni INTEGER NOT NULL,
    nro_mat CHAR(30) NOT NULL,
    PRIMARY KEY (nro_exam),
    FOREIGN KEY (dni) REFERENCES pacientes(dni),
    FOREIGN KEY (nro_mat) REFERENCES medicos(nro_mat)
)
----------
3.
CREATE TABLE materias (
    id_mat INTEGER,
    programa CHAR(200),
    titulo CHAR(200),
    PRIMARY KEY (id_mat)
)

CREATE TABLE requiere (
    idmat_requerida CHAR(30),
    idmat_requirente CHAR (30),
    PRIMARY KEY (idmat_requerida, idmat_requirente),
    FOREIGN KEY (idmat_requerida) REFERENCES materias (id_mat),
    FOREIGN KEY (idmat_requirente) REFERENCES materias (id_mat),
)

CREATE TABLE dictado_de_materias (
    anio INTEGER,
    semestre CHAR(10),
    nro_secc CHAR(10),
    horarios CHAR(20),
    aulas CHAR(10),
    id_mat INTEGER,
    PRIMARY KEY (id_mat, anio, semestre, nro_secc),
    FOREIGN KEY (id_mat) REFERENCES materias(id_mat) ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE profesores (
    titulo CHAR (50), 
    depto CHAR (30),
    nomyape CHAR (30),
    nro_ident INTEGER,
    PRIMARY KEY (nro_ident),
    
)

CREATE TABLE estudiantes (
    dni INTEGER,
    nombre_y_apellido CHAR(40),
    nro_legajo INTEGER,
    tel INTEGER,
    email CHAR(50),
    PRIMARY KEY (dni)
)
CREATE TABLE realiza (
    nro_ident INTEGER, 
    anio INTEGER,
    semestre CHAR (10),
    nro_secc CHAR(10),
    id_mat INTEGER,
    PRIMARY KEY (id_mat, nro_ident, anio, semestre, nro_secc),
    FOREIGN KEY (id_mat) REFERENCES materias(id_mat), 
    FOREIGN KEY (anio) REFERENCES dictado_de_materias(anio), 
    FOREIGN KEY (nro_secc) REFERENCES dictado_de_materias(nro_secc),
    FOREIGN KEY (semestre) REFERENCES dictado_de_materias(semestre),
    FOREIGN KEY (nro_ident) REFERENCES profesores(nro_ident)    
)

CREATE TABLE asiste (
    nro_mat INTEGER,
    nota REAL,
    dni INTEGER,
    anio INTEGER,
    semestre CHAR(10),
    nro_secc CHAR(10),
    PRIMARY KEY (dni, anio, semestre, nro_secc),
    FOREIGN KEY (dni) REFERENCES estudiantes(dni),
    FOREIGN KEY (anio) REFERENCES dictado_de_materias(anio),
    FOREIGN KEY (semestre) REFERENCES dictado_de_materias(semestre),
    FOREIGN KEY (nro_secc) REFERENCES dictado_de_materias(nro_secc)
)
----------
4.a
CREATE TABLE materia (
    id_mat INTEGER,
    nombre CHAR(30),
    nivel CHAR(2),
    PRIMARY KEY (id_mat)
)

CREATE TABLE dictado (
    aula CHAR(2),
    horario CHAR(10),
    anio INTEGER,
    semestre CHAR(10),
    nro_secc CHAR(10),
    id_mat INTEGER,
    PRIMARY KEY (id_mat, anio, semestre, nro_secc),
    FOREIGN KEY (id_mat) REFERENCES materia(id_mat) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE estudiante (
    dni INTEGER,
    nombre_y_apellido CHAR(40),
    nro_legajo INTEGER,
    email CHAR(40),
    fecha_nacimiento DATE,
    PRIMARY KEY (dni)
)

CREATE TABLE examen (
    fecha DATE,
    nota REAL,
    tipo CHAR (20),
    id_exam INTEGER,
    dni INTEGER NOT NULL,
    anio INTEGER NOT NULL,
    semestre CHAR(10) NOT NULL,
    nro_secc CHAR(10) NOT NULL,
    PRIMARY KEY (id_exam),
    FOREIGN KEY (dni) REFERENCES estudiante(dni),
    FOREIGN KEY (anio) REFERENCES dictado(anio),
    FOREIGN KEY (semestre) REFERENCES dictado(semestre),
    FOREIGN KEY (nro_secc) REFERENCES dictado(nro_secc)
)

4.b
CREATE TABLE materia (
    id_mat INTEGER,
    nombre CHAR(30),
    nivel CHAR(20),
    PRIMARY KEY (id_mat)
)

CREATE TABLE dictado (
    aula CHAR(30),
    horario CHAR(20),
    nro_secc INTEGER,
    semestre INTEGER,
    anio INTEGER,
    id_mat INTEGER,
    PRIMARY KEY (nro_secc,  semestre, anio, id_mat),
    FOREIGN KEY (id_mat) REFERENCES materia(id_mat) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE examen (
    id_exam INTEGER,
    tipo CHAR(30),
    fecha DATE,
    nota  INTEGER,
    PRIMARY KEY (idexam)
)

CREATE TABLE estudiante (
    dni INTEGER,
    NyA CHAR(30),
    nro_lega INTEGER,
    email CHAR(20),
    fecha_na DATE NOT NULL,
    PRIMARY KEY (dni)
)

CREATE TABLE posee (
    dni INTEGER,
    anio INTEGER,
    semestre INTEGER,
    mro_secc INTEGER,
    PRIMARY KEY (dni, anio, semestre, nro_secc),
    FOREIGN KEY (dni) REFERENCES  estudiante(dni),
    FOREIGN KEY (anio) REFERENCES dictado (anio),
    FOREIGN KEY (semestre) REFERENCES dictado (semestre),
    FOREIGN KEY (nro_secc) REFERENCES dictado (nro_secc)
    
)

CREATE TABLE tiene (
    id_exam INTEGER,
    dni INTEGER,
    anio INTEGER,
    semestre INTEGER,
    mro_secc INTEGER,
    PRIMARY KEY (id_exam, dni, anio, semestre, nro_secc)
    FOREIGN KEY (id_exam) REFERENCES examen(id_exam)
    FOREIGN KEY (dni) REFERENCES posee(dni)
    FOREIGN KEY (anio) REFERENCES posee(anio)
    FOREIGN KEY (semestre) REFERENCES posee(semestre)
    FOREIGN KEY (nro_secc) REFERENCES posee(nro_secc)
)
----------
5.
CREATE TABLE jugador (
    id_jugador INTEGER,
    nombre_y_apellido CHAR(30),
    dorsal INTEGER,
    posicion INTEGER,
    faltas_totales INTEGER,
    goles_totales INTEGER, 
    minutos_totales INTEGER,
    asistencias_totales INTEGER,
    PRIMARY KEY (id_jugador),
)

CREATE TABLE partido(
    rival CHAR(30),
    id_partido INTEGER,
    duracion INTEGER,
    fecha DATE,
    hora INTEGER,
    estadio CHAR(30),
    resultado INTEGER,
    PRIMARY KEY (id_partido),
)

CREATE TABLE participa (
    minutos_jugador INTEGER,
    faltas INTEGER,
    goles INTEGER,
    asistenias INTEGER,
    id_jugador INTEGER,
    id_partido INTEGER,
    PRIMARY KEY (id_jugador, id_partido),
    FOREIGN KEY (id_jugador REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_partido) REFERENCES partido(id_partido)
)
----------
6.
CREATE TABLE equipo (
    id_equipo INTEGER,
    nombre CHAR(CHAR),
    puntos INTEGER,
    PRIMARY KEY (id_equipo)
)

CREATE TABLE juega_contra (
    id_equipo_local INTEGER, 
    id_equipo_visitante INTEGER,
    tiros_al_arco_local INTEGER,
    tiros_al_arco_visitante INTEGER,
    duracion INTEGER,
    goles_local INTEGER,
    goles_visitante INTEGER,
    pasos_dados_local INTEGER,
    pasos_dados_visitante INTEGER,
    posesion_local INTEGER,
    posesion_visitante INTEGER,
    PRIMARY KEY (id_equipo_local, id_equipo_visitante),
    FOREIGN KEY (id_equipo_local) REFERENCES equipo(id_equipo),
    FOREIGN KEY (id_equipo_visitante) REFERENCES equipo(id_equipo)
)

CREATE TABLE participa (
    goles INTEGER,
    faltas INTEGER,
    minutos_jugados INTEGER,
    asistencias INTEGER,
    id_equipo_local INTEGER,
    id_equipo_visitante INTEGER, 
    id_jugador INTEGER,
    PRIMARY KEY (id_jugador, id_equipo_local, id_equipo_visitante),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_equipo_local) REFERENCES equipo(id_equipo_local),
    FOREIGN KEY (id_equipo_visitante) REFERENCES equipo(id_equipo_visitante),

)

CREATE TABLE jugador (
    asistencias_totales INTEGER,
    minutos_totales INTEGER,
    faltas_totales INTEGER,
    goles_totales INTEGER,
    dorsal INTEGER,
    nombre_y_apellido CHAR(30),
    posicion INTEGER,
    id_jugador INTEGER,
    id_equipo INTEGER,
    PRIMARY KEY (id_jugador),
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
)
----------
7.
CREATE TABLE comision (
    id_materia INTEGER,
    id_comision INTEGER,
    matriculados INTEGER,
    PRIMARY KEY (id_materia, id_comision),
    FOREIGN KEY (id_materia) REFERENCES materia(id_comision) ON DELETE CASCADE
)

CREATE TABLE materia (
    anio_plan INTEGER,
    nombre CHAR(30),
    departamente CHAR(30),
    id_materia INTEGER,
    PRIMARY KEY (id_materia)
)

CREATE TABLE examen (
    id_materia INTEGER NOT NULL,
    id_aula INTEGER NOT NULL,
    id_examen INTEGER,
    nombre_alumno CHAR(30),
    hora INTEGER,
    fecha DATE,
    calificacion INTEGER,
    profesor_titular CHAR(30),
    PRIMARY KEY (id_examem),
    FOREIGN KEY (id_aula) REFERENCES aula(id_aula),
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
)

CREATE TABLE aula (
    id_aula INTEGER,
    capacidad  INTEGER,
    edificio INTEGER, 
    PRIMARY KEY (id_aula)
)
----------
8.
CREATE TABLE vendedor (
    id_vendedor INTEGER,
    PRIMARY KEY (id_vendedor)
)

CREATE TABLE vehiculo (
    marca CHAR(30),
    anio INTEGER,
    cilindrada REAL,
    modelo CHAR(30),
    color CHAR(20),
    kilometros REAL,
    transmision CHAR(20),
    id_vehiculo INTEGER,
    id_vendedor INTEGER,
    PRIMARY KEY (id_vehiculo),
    FOREIGN KEY (id_vendedor) REFERENCES evendedor(id_vendedor)
)

CREATE TABLE motocicleta (
    transmision_a_rueda INTEGER,
    tipo CHAR(30),
    carenado CHAR(20),
    id_vehiculo INTEGER,
    PRIMARY KEY (id_vehiculo),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE CASCADE
)

CREATE TABLE automovil (
    id_vehiculo INTEGER,
    segmento CHAR(30),
    carroceria CHAR(30),
    PRIMARY KEY (id_vehiculo),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE CASCADE
)

CREATE TABLE camiones (
    id_vehiculo INTEGER, 
    nro_de_ejes INTEGER,
    disposicion_del_motor CHAR(30),
    capacidad_del_remolque INTEGER,
    PRIMARY KEY (id_vehiculo),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE CASCADE
)

CREATE TABLE omnibus (
    id_vehiculo INTEGER,
    nro_de_asientos INTEGER,
    marca_de_la_carroceria CHAR(30),
    PRIMARY KEY (id_vehiculo),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE CASCADE
)
----------
10.b
CREATE TABLE autores(
    nombre_autor CHAR(30),
    direccion CHAR(30),
    url CHAR(30),
    PRIMARY KEY (nombre, direccion),
)

CREATE TABLE editores (
    nombre_editor CHAR(30)
    direcc CHAR(30),
    telefono INTEGER, 
    url CHAR(30),
    PRIMARY KEY (nomb),
)

CREATE TABLE libros (
    isbn CHAR(30),
    anio INTEGER,
    precio INTEGER,
    titulo CHAR(30),
    nombre_editor CHAR(30) NOT NULL,
    PRIMARY KEY (isbn, nombre_editor),
    FOREIGN KEY (nombre_editor) REFERENCES editores(nombre_editor),
)

CREATE TABLE almacenes (
    codigo CHAR(30),
    telefono INTEGER,
    direccion CHAR(30),
    PRIMARY KEY (codigo),
)

CREATE TABLE clientes (
    direccion_email CHAR(30),
    nombre CHAR(30),
    direccion_clientes CHAR(30),
    telefono_clientes INTEGER,
    PRIMARY KEY (direccion_email),
)

CREATE TABLE carro_compras (
    id_carro INTEGER,
    direccion_email CHAR(30) NOT NULL,
    PRIMARY KEY (id_carro, direccion_email),
    FOREIGN KEY (direccion_email) REFERENCES clientes(direccion_email),
)

CREATE TABLE albums (
    id_album INTEGER,
    genero CHAR(40),
    precio  INTEGER,
    artista CHAR(30),
    anio INTEGER,
    nombre_album CHAR(30),
    discografia CHAR(30),
    duracion INTEGER,
    PRIMARY KEY (id_album),
)

CREATE TABLE cds(
    id_album INTEGER,
    dvd_vivo CHAR(30),
    PRIMARY KEY (id_album),
    FOREIGN KEY (id_album) REFERENCES albums(id_album) ON DELETE CASCADE,
)

CREATE TABLE casettes(
    id_album INTEGER,
    id_casettes INTEGER,
    PRIMARY KEY (id_album),
    FOREIGN KEY (id_album) REFERENCES albums(id_album) ON DELETE CASCADE,
)


10.c
CREATE TABLE autores (
    nombre CHAR(30),
    direccion CHAR(30),
    url CHAR(100),
    PRIMARY KEY (nombre, dirección)
)

CREATE TABLE producto (
    id_producto INTEGER,
    genero CHAR(30),
    titulo CHAR(80),
    precio REAL,
    anio INTEGER,
    PRIMARY KEY (id_producto)
)

CREATE TABLE albums (
    id_producto INTEGER,
    discografica CHAR(40),
    duracion INTEGER,
    artista CHAR(40),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE
)

CREATE TABLE casettes (
    id_producto INTEGER,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_producto) REFERENCES albums(id_producto) ON DELETE CASCADE
)

CREATE TABLE cds (
    id_producto INTEGER,
    dvd_vivo CHAR(2),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_producto) REFERENCES albums(id_producto) ON DELETE CASCADE
)

CREATE TABLE libros (
    id_producto INTEGER,
    isbn CHAR(11),
    nombre CHAR(30) NOT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE,
    FOREIGN KEY (nombre) REFERENCES editores(nombre)
)

CREATE TABLE editores (
    nombre CHAR(30),
    direccion CHAR(30),
    telefono INTEGER,
    url CHAR(80),
    PRIMARY KEY (nombre)
)

CREATE TABLE almacenes (
    codigo INTEGER,
    telefono INTEGER,
    direccion CHAR(40),
    PRIMARY KEY (codigo)
)

CREATE TABLE almacena (
    numero INTEGER,
    id_producto INTEGER,
    codigo INTEGER,
    PRIMARY KEY (id_producto, codigo),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (codigo) REFERENCES almacenes(codigo)
)

CREATE TABLE clientes (
    nombre CHAR(30),
    direccion CHAR(30),
    telefono INTEGER,
    direccion_email CHAR(50),
    PRIMARY KEY (direccion_email)
)

CREATE TABLE carro_compras (
    id_carro INTEGER,
    direccion_email CHAR(30),
    PRIMARY KEY (id_carro),
    FOREIGN KEY (direccion_email) REFERENCES clientes(direccion_email)
)

CREATE TABLE contiene (
    numero INTEGER,
    id_carro INTEGER,
    id_producto INTEGER,
    PRIMARY KEY (id_carro, id_producto),
    FOREIGN KEY (id_carro) REFERENCES carro_compras(id_carro),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
)
----------



