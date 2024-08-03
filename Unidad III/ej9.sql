1.
```
automoviles(patente: CHAR(10), modelo: CHAR(20), marca: CHAR(30), nrochasis: INTEGER, nroacci: INTEGER, dni: INTEGER)
CP: (patente)
CF: dni -> clientes(dni)
CNN: dni

clientes(dni: INTEGER, nombre_y_apellido: CHAR(40), tel: INTEGER, email: CHAR(40))
CP: (dni)
CF: -
CNN: -
```
2.
```
pacientes(dni: INTEGER, nya: CHAR(30), tel: INTEGER, direc: CHAR(30))
CP: (dni)
CF: -
CNN: -

medicos(dni: INTEGER, nro_mat: CHAR(30), nombre_y_apellido: CHAR(40), especialidad: CHAR(20))
CP: (dni)
CF: -
CNN: -

examenes_medicos(nro_exam: INTEGER, fecha_exam: DATE, tipo_exam: CHAR(30), dni: INTEGER, nro_mat: CHAR(30))
CP: (nro_exam)
CF: dni -> pacientes(dni), nro_mat -> medicos(nro_mat)
CNN: dni, nro_mat
```
3.
```
materias(id_mat: INTEGER, programa: CHAR(200), titulo: CHAR(200))
CP: (id_mat)
CF: -
CNN: -

requiere(idmat_requerida: CHAR(30), idmat_requirente: CHAR(30))
CP: (idmat_requerida, idmat_requirente)
CF: idmat_requerida -> materias(id_mat), idmat_requirente -> materias(id_mat)
CNN: -

dictado_de_materias(anio: INTEGER, semestre: CHAR(10), nro_secc: CHAR(10), horarios: CHAR(20), aulas: CHAR(10), id_mat: INTEGER)
CP: (id_mat, anio, semestre, nro_secc)
CF: id_mat -> materias(id_mat) EN BORRADO CASCADA EN ACTUALIZACIÓN CASCADA
CNN: -

profesores(titulo: CHAR(50), depto: CHAR(30), nomyape: CHAR(30), nro_ident: INTEGER)
CP: (nro_ident)
CF: -
CNN: -

estudiantes(dni: INTEGER, nombre_y_apellido: CHAR(40), nro_legajo: INTEGER, tel: INTEGER, email: CHAR(50))
CP: (dni)
CF: -
CNN: -

realiza(nro_ident: INTEGER, anio: INTEGER, semestre: CHAR(10), nro_secc: CHAR(10), id_mat: INTEGER)
CP: (id_mat, nro_ident, anio, semestre, nro_secc)
CF: id_mat -> materias(id_mat), anio -> dictado_de_materias(anio), nro_secc -> dictado_de_materias(nro_secc), semestre -> dictado_de_materias(semestre), nro_ident -> profesores(nro_ident)
CNN: -

asiste(nro_mat: INTEGER, nota: REAL, dni: INTEGER, anio: INTEGER, semestre: CHAR(10), nro_secc: CHAR(10))
CP: (dni, anio, semestre, nro_secc)
CF: dni -> estudiantes(dni), anio -> dictado_de_materias(anio), semestre -> dictado_de_materias(semestre), nro_secc -> dictado_de_materias(nro_secc)
CNN: -
```
4.a
```
materia(id_mat: INTEGER, nombre: CHAR(30), nivel: CHAR(2))
CP: (id_mat)
CF: -
CNN: -

dictado(aula: CHAR(2), horario: CHAR(10), anio: INTEGER, semestre: CHAR(10), nro_secc: CHAR(10), id_mat: INTEGER)
CP: (id_mat, anio, semestre, nro_secc)
CF: id_mat -> materia(id_mat) EN BORRADO CASCADA EN ACTUALIZACIÓN CASCADA
CNN: -

estudiante(dni: INTEGER, nombre_y_apellido: CHAR(40), nro_legajo: INTEGER, email: CHAR(40), fecha_nacimiento: DATE)
CP: (dni)
CF: -
CNN: -

examen(fecha: DATE, nota: REAL, tipo: CHAR(20), id_exam: INTEGER, dni: INTEGER, anio: INTEGER, semestre: CHAR(10), nro_secc: CHAR(10))
CP: (id_exam)
CF: dni -> estudiante(dni), anio -> dictado(anio), semestre -> dictado(semestre), nro_secc -> dictado(nro_secc)
CNN: dni, anio, semestre, nro_secc
```
4.b
```
materia(id_mat: INTEGER, nombre: CHAR(30), nivel: CHAR(20))
CP: (id_mat)
CF: -
CNN: -

dictado(aula: CHAR(30), horario: CHAR(20), nro_secc: INTEGER, semestre: INTEGER, anio: INTEGER, id_mat: INTEGER)
CP: (nro_secc, semestre, anio, id_mat)
CF: id_mat -> materia(id_mat) EN BORRADO CASCADA EN ACTUALIZACIÓN CASCADA
CNN: -

examen(id_exam: INTEGER, tipo: CHAR(30), fecha: DATE, nota: INTEGER)
CP: (id_exam)
CF: -
CNN: -

estudiante(dni: INTEGER, NyA: CHAR(30), nro_lega: INTEGER, email: CHAR(20), fecha_na: DATE)
CP: (dni)
CF: -
CNN: fecha_na

posee(dni: INTEGER, anio: INTEGER, semestre: INTEGER, nro_secc: INTEGER)
CP: (dni, anio, semestre, nro_secc)
CF: dni -> estudiante(dni), anio -> dictado(anio), semestre -> dictado(semestre), nro_secc -> dictado(nro_secc)
CNN: -

tiene(id_exam: INTEGER, dni: INTEGER, anio: INTEGER, semestre: INTEGER, nro_secc: INTEGER)
CP: (id_exam, dni, anio, semestre, nro_secc)
CF: id_exam -> examen(id_exam), dni -> posee(dni), anio -> posee(anio), semestre -> posee(semestre), nro_secc -> posee(nro_secc)
CNN: -
```
5.
```
jugador(id_jugador: INTEGER, nombre_y_apellido: CHAR(30), dorsal: INTEGER, posicion: INTEGER, faltas_totales: INTEGER, goles_totales: INTEGER, minutos_totales: INTEGER, asistencias_totales: INTEGER)
CP: (id_jugador)
CF: -
CNN: -

partido(rival: CHAR(30), id_partido: INTEGER, duracion: INTEGER, fecha: DATE, hora: INTEGER, estadio: CHAR(30), resultado: INTEGER)
CP: (id_partido)
CF: -
CNN: -

participa(minutos_jugador: INTEGER, faltas: INTEGER, goles: INTEGER, asistencias: INTEGER, id_jugador: INTEGER, id_partido: INTEGER)
CP: (id_jugador, id_partido)
CF: id_jugador -> jugador(id_jugador), id_partido -> partido(id_partido)
CNN: -
```
6.
```
equipo(id_equipo: INTEGER, nombre: CHAR(CHAR), puntos: INTEGER)
CP: (id_equipo)
CF: -
CNN: -

juega_contra(id_equipo_local: INTEGER, id_equipo_visitante: INTEGER, tiros_al_arco_local: INTEGER, tiros_al_arco_visitante: INTEGER, duracion: INTEGER, goles_local: INTEGER, goles_visitante: INTEGER, pasos_dados_local: INTEGER, pasos_dados_visitante: INTEGER, posesion_local: INTEGER, posesion_visitante: INTEGER)
CP: (id_equipo_local, id_equipo_visitante)
CF: id_equipo_local -> equipo(id_equipo), id_equipo_visitante -> equipo(id_equipo)
CNN: -

participa(goles: INTEGER, faltas: INTEGER, minutos_jugados: INTEGER, asistencias: INTEGER, id_equipo_local: INTEGER, id_equipo_visitante: INTEGER, id_jugador: INTEGER)
CP: (id_jugador, id_equipo_local, id_equipo_visitante)
CF: id_jugador -> jugador(id_jugador), id_equipo_local -> equipo(id_equipo), id_equipo_visitante -> equipo(id_equipo)
CNN: -

jugador(asistencias_totales: INTEGER, minutos_totales: INTEGER, faltas_totales: INTEGER, goles_totales: INTEGER, dorsal: INTEGER, nombre_y_apellido: CHAR(30), posicion: INTEGER, id_jugador: INTEGER, id_equipo: INTEGER)
CP: (id_jugador)
CF: id_equipo -> equipo(id_equipo)
CNN: -
```
7.
```
comision(id_materia: INTEGER, id_comision: INTEGER, matriculados: INTEGER)
CP: (id_materia, id_comision)
CF: id_materia -> materia(id_comision) EN BORRADO CASCADA
CNN: -

materia(anio_plan: INTEGER, nombre: CHAR(30), departamente: CHAR(30), id_materia: INTEGER)
CP: (id_materia)
CF: -
CNN: -

examen(id_materia: INTEGER, id_aula: INTEGER, id_examen: INTEGER, nombre_alumno: CHAR(30), hora: INTEGER, fecha: DATE, calificacion: INTEGER, profesor_titular: CHAR(30))
CP: (id_examen)
CF: id_aula -> aula(id_aula), id_materia -> materia(id_materia)
CNN: id_materia, id_aula

aula(id_aula: INTEGER, capacidad: INTEGER, edificio: INTEGER)
CP: (id_aula)
CF: -
CNN: -
```
8.
```
vendedor(id_vendedor: INTEGER)
CP: (id_vendedor)
CF: -
CNN: -

vehiculo(marca: CHAR(30), anio: INTEGER, cilindrada: REAL, modelo: CHAR(30), color: CHAR(20), kilometros: REAL, transmision: CHAR(20), id_vehiculo: INTEGER, id_vendedor: INTEGER)
CP: (id_vehiculo)
CF: id_vendedor -> vendedor(id_vendedor)
CNN: -

motocicleta(transmision_a_rueda: INTEGER, tipo: CHAR(30), carenado: CHAR(20), id_vehiculo: INTEGER)
CP: (id_vehiculo)
CF: id_vehiculo -> vehiculo(id_vehiculo) EN BORRADO CASCADA
CNN: -

automovil(id_vehiculo: INTEGER, segmento: CHAR(30), carroceria: CHAR(30))
CP: (id_vehiculo)
CF: id_vehiculo -> vehiculo(id_vehiculo) EN BORRADO CASCADA
CNN: -

camiones(id_vehiculo: INTEGER, nro_de_ejes: INTEGER, disposicion_del_motor: CHAR(30), capacidad_del_remolque: INTEGER)
CP: (id_vehiculo)
CF: id_vehiculo -> vehiculo(id_vehiculo) EN BORRADO CASCADA
CNN: -

omnibus(id_vehiculo: INTEGER, nro_de_asientos: INTEGER, marca_de_la_carroceria: CHAR(30))
CP: (id_vehiculo)
CF: id_vehiculo -> vehiculo(id_vehiculo) EN BORRADO CASCADA
CNN: -
```
10.b
```
autores(nombre_autor: CHAR(30), direccion: CHAR(30), url: CHAR(30))
CP: (nombre, direccion)
CF: -
CNN: -

editores(nombre_editor: CHAR(30), direcc: CHAR(30), telefono: INTEGER, url: CHAR(30))
CP: (nombre)
CF: -
CNN: -

libros(isbn: CHAR(30), anio: INTEGER, precio: INTEGER, titulo: CHAR(30), nombre_editor: CHAR(30))
CP: (isbn, nombre_editor)
CF: nombre_editor -> editores(nombre_editor)
CNN: nombre_editor

almacenes(codigo: CHAR(30), telefono: INTEGER, direccion: CHAR(30))
CP: (codigo)
CF: -
CNN: -

clientes(direccion_email: CHAR(30), nombre: CHAR(30), direccion_clientes: CHAR(30), telefono_clientes: INTEGER)
CP: (direccion_email)
CF: -
CNN: -

carro_compras(id_carro: INTEGER, direccion_email: CHAR(30))
CP: (id_carro, direccion_email)
CF: direccion_email -> clientes(direccion_email)
CNN: direccion_email

albums(id_album: INTEGER, genero: CHAR(40), precio: INTEGER, artista: CHAR(30), anio: INTEGER, nombre_album: CHAR(30), discografia: CHAR(30), duracion: INTEGER)
CP: (id_album)
CF: -
CNN: -

cds(id_album: INTEGER, dvd_vivo: CHAR(30))
CP: (id_album)
CF: id_album -> albums(id_album) EN BORRADO CASCADA
CNN: -

casettes(id_album: INTEGER, id_casettes: INTEGER)
CP: (id_album)
CF: id_album -> albums(id_album) EN BORRADO CASCADA
CNN: -
```
10.c
```
autores(nombre: CHAR(30), direccion: CHAR(30), url: CHAR(100))
CP: (nombre, dirección)
CF: -
CNN: -

producto(id_producto: INTEGER, genero: CHAR(30), titulo: CHAR(80), precio: REAL, anio: INTEGER)
CP: (id_producto)
CF: -
CNN: -

albums(id_producto: INTEGER, discografica: CHAR(40), duracion: INTEGER, artista: CHAR(40))
CP: (id_producto)
CF: id_producto -> producto(id_producto) EN BORRADO CASCADA
CNN: -

casettes(id_producto: INTEGER)
CP: (id_producto)
CF: id_producto -> albums(id_producto) EN BORRADO CASCADA
CNN: -

cds(id_producto: INTEGER, dvd_vivo: CHAR(2))
CP: (id_producto)
CF: id_producto -> albums(id_producto) EN BORRADO CASCADA
CNN: -

libros(id_producto: INTEGER, isbn: CHAR(11), nombre: CHAR(30))
CP: (id_producto)
CF: id_producto -> producto(id_producto) EN BORRADO CASCADA, nombre -> editores(nombre)
CNN: nombre

editores(nombre: CHAR(30), direccion: CHAR(30), telefono: INTEGER, url: CHAR(80))
CP: (nombre)
CF: -
CNN: -

almacenes(codigo: INTEGER, telefono: INTEGER, direccion: CHAR(40))
CP: (codigo)
CF: -
CNN: -

almacena(numero: INTEGER, id_producto: INTEGER, codigo: INTEGER)
CP: (id_producto, codigo)
CF: id_producto -> producto(id_producto), codigo -> almacenes(codigo)
CNN: -

clientes(nombre: CHAR(30), direccion: CHAR(30), telefono: INTEGER, direccion_email: CHAR(50))
CP: (direccion_email)
CF: -
CNN: -

carro_compras(id_carro: INTEGER, direccion_email: CHAR(30))
CP: (id_carro)
CF: direccion_email -> clientes(direccion_email)
CNN: direccion_email

contiene(numero: INTEGER, id_carro: INTEGER, id_producto: INTEGER)
CP: (id_carro, id_producto)
CF: id_carro -> carro_compras(id_carro), id_producto -> producto(id_producto)
CNN: -
```