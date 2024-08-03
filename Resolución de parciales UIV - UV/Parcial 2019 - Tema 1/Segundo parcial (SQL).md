---
title: "Bases de Datos. Parcial de las unidades IV y V"
author: "Juani"
date: "09/06/2024"
geometry: margin=1in
colorlinks: true
header-includes:
	- \usepackage{fvextra}
	- \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
	- \usepackage{amsmath}
---


# GESTIÓN DE DATOS

## 2° EXAMEN PARCIAL - Tema 1

Dado el siguiente esquema relacional referido a una liga de fútbol profesional:

### Esquema Relacional

- **Equipo** (`noEquipo`, `ciudad`, `nombre`)

- **Jugador** (`noJugador`, `nombre`, `edad`)

- **JugEn** (`noJugador`, `noEquipo`, `añoDesde`, `temporadas`)

  - Clave Foránea: `noEquipo` REFERENCIA `noEquipo` en TABLA `Equipo`
  - 
  - Clave Foránea: `noJugador` REFERENCIA `noJugador` en TABLA `Jugador`

- **Entrenador** (`nombre`, `teléfono`, `dirección`)

- **Dirigió** (`nombre`, `noEquipo`, `añoDesde`, `temporadas`)

  - Clave Foránea: `nombre` REFERENCIA `nombre` en TABLA `Entrenador`
  - 
  - Clave Foránea: `noEquipo` REFERENCIA `noEquipo` en TABLA `Equipo`

### Notas:
- `añoDesde` es tipo numérico de 4 dígitos para registrar el año.
- `temporadas` es tipo entero y vale NULL en los casos donde el jugador o entrenador se encuentra actualmente en el club. Cada temporada dura un año.

### Parte 1 (4 pts.)
Resolver los siguientes ejercicios mediante consultas en álgebra relacional. Si no es posible, justificar.

1. Nombre y teléfono de los entrenadores que están dirigiendo hace más de cinco (5) años a su equipo actual.

    > *No se puede hacer. ¿Cómo voy a saber la cantidad de años si la temporada figura como NULL en los equipos actuales o no tengo la fecha actual?*


2. Nombre de jugadores que han jugado (en el pasado o actualmente) en el Deportivo Cali, durante más de cuatro años.

    <!-- 
    ⍴(equipo_aux(nombre → nombre_equipo), Equipo)

    ⍴(jugador_aux(nombre → nombre_jugador), Jugador)

    aux ← jugador_aux ⋈ JugEn ⋈ equipo_aux

    π nombre_jugador (σ nombre_equipo = 'Deportivo Cali' ^ temporadas > 4 (aux))
    -->

    \begin{align*}
    &\rho(\text{equipo\_aux}(\text{nombre} \rightarrow \text{nombre\_equipo}), \text{Equipo}) \\
    &\rho(\text{jugador\_aux}(\text{nombre} \rightarrow \text{nombre\_jugador}), \text{Jugador}) \\
    &\text{aux} \leftarrow \text{jugador\_aux} \bowtie \text{JugEn} \bowtie \text{equipo\_aux} \\
    &\pi_{\text{nombre\_jugador}} (\sigma_{\text{nombre\_equipo} = \text{'Deportivo Cali'} \land \text{temporadas} > 4} (\text{aux}))
    \end{align*}

    > *Nuevamente, si no tengo la fecha actual no voy a poder sacar los jugadores que juegan hace más de cuatro años en el equipo y están en el mismo actualmente. Esta consulta funciona para aquellos que fueron jugadores durante más de cuatro años.*


3. Nombre de jugadores que hayan figurado en la nómina de un equipo que haya tenido un entrenador que haya dirigido algún equipo de la ciudad de Bogotá.

    <!--
    ⍴(equipo_aux(nombre → nombre_e), Equipo)

    ⍴(jugador_aux(nombre → nombre_j), Jugador)

    ⍴(jugó_en_aux(añoDesde → añoDesde_j, temporadas → temporadas_j), JugóEn)

    ⍴(entrenador_aux(nombre → nombre_e, temporadas → temporadas_e), Entrenador)

    ⍴(dirigió_aux(nombre → nombre_d, añoDesde → añoDesde_d, temporadas → temporadas_d), Dirigió)

    π nombre_j (σ ciudad = 'Bogotá' ^ temporadas_j <> 'NULL' ^ temporadas_e <> 'NULL' (jugador_aux ⋈ jugó_en_aux ⋈ equipo_aux ⋈ dirigió_aux ⋈ (nombre_d = nombre_e) entrenador_aux))
    -->

    \begin{align*}
    \begin{split}
    &\rho(\text{equipo\_aux}(\text{nombre} \rightarrow \text{nombre\_e}), \text{Equipo}) \\
    &\rho(\text{jugador\_aux}(\text{nombre} \rightarrow \text{nombre\_j}), \text{Jugador}) \\
    &\rho(\text{jugó\_en\_aux}(\text{añoDesde} \rightarrow \text{añoDesde\_j}, \text{temporadas} \rightarrow \text{temporadas\_j}), \text{JugóEn}) \\
    &\rho(\text{entrenador\_aux}(\text{nombre} \rightarrow \text{nombre\_e}, \text{temporadas} \rightarrow \text{temporadas\_e}), \text{Entrenador}) \\
    &\rho(\text{dirigió\_aux}(\text{nombre} \rightarrow \text{nombre\_d}, \text{añoDesde} \rightarrow \text{añoDesde\_d}, \text{temporadas} \rightarrow \text{temporadas\_d}), \text{Dirigió}) \\
    &\pi_{\text{nombre\_j}} \left( \sigma_{\text{ciudad} = 'Bogotá' \land \text{temporadas\_j} \neq \text{'NULL'} \land \text{temporadas\_e} \neq \text{'NULL'}} \left( \text{jugador\_aux} \bowtie \text{jugó\_en\_aux} \bowtie \text{equipo\_aux} \bowtie \text{dirigió\_aux} \bowtie (\text{nombre\_d} = \text{nombre\_e}) \text{entrenador\_aux} \right) \right)
    \end{split}
    \end{align*}

    > *Se me rompió la ecuación. Ver el archivo Markdown.*

4. Nombres de los entrenadores que hayan dirigido un club de fútbol donde juegue el futbolista de mayor edad.

    > *No se puede hacer.*

### Parte 2 (6 pts.)
Resolver los siguientes ejercicios mediante consultas en SQL. Si no es posible, justificar.

1. El nombre de los futbolistas que han jugado en más de cinco equipos.

    ```{.sql}
        SELECT j.nombre
        FROM Jugador AS j NATURAL JOIN JugEn AS je
        GROUP BY j.noJugador, j.nombre
        HAVING COUNT(je.noEquipo) > 3;

        -- Puse solamente mayor a tres porque no quería cargar muchos datos. 
    ```

2. Nombre de jugadores que no hayan jugado en el club América.

    ```{.sql}
        SELECT j.nombre
        FROM Jugador AS j
        WHERE NOT EXISTS (
            SELECT 1
            FROM JugEn AS je INNER JOIN Equipo AS e ON je.noEquipo = e.noEquipo 
            WHERE j.noJugador = je.noJugador AND (e.nombre LIKE 'América' AND je.temporadas IS NOT NULL)
        );
    ```

3. Nombre de los jugadores que pertenecen al club América.

    ```{.sql}
        SELECT j.nombre
        FROM Jugador AS j INNER JOIN JugEn AS je ON j.noJugador = je.noJugador INNER JOIN Equipo AS e ON je.noEquipo = e.noEquipo  
        WHERE e.nombre LIKE 'América' AND je.temporadas IS NULL;
    ```

4. Para aquellos entrenadores que posean una experiencia acumulada mayor a 10 años, obtener su nombre, y el mayor número de temporadas que dirigió a un mismo club.

    ```{.sql}
        /*
        * `newt1` tiene a los dt con más de diez años de experiencia. 
        * `newt2` discrimina a los dt por su temporada más larga.
        * Al juntar los dos, obtengo a los dt con más de diez años de experiencia junto a sus temporadas más largas.
        * 
        */

        WITH newt1 AS (
            SELECT d.nombre
            FROM Dirigio AS d
            GROUP BY d.nombre
            HAVING SUM(d.temporadas) > 10
        ),
        newt2 AS (
            SELECT d.nombre, MAX(d.temporadas) as temporada_más_larga
            FROM Dirigio AS d
            GROUP BY d.nombre
        )
        SELECT n1.nombre, n2.temporada_más_larga
        FROM newt1 AS n1 INNER JOIN newt2 AS n2 ON n1.nombre = n2.nombre;
    ```

5. Hallar el nombre de los entrenadores que han dirigido a todos los equipos de la ciudad de Costa Sur.

    **Opción 1:**

    ```{.sql}
        SELECT DISTINCT d.nombre
        FROM Dirigio AS d
        WHERE NOT EXISTS (
            SELECT eq.noEquipo
            FROM Equipo AS eq
            WHERE eq.ciudad LIKE 'Costa Sur'
            
            EXCEPT 
            
            SELECT d2.noEquipo
            FROM Dirigio AS d2
            WHERE d.nombre = d2.nombre
        );

        -- Esta es mi preferida.
    ```

    **Opción 2:**

    ```{.sql}
        SELECT e.nombre
        FROM Entrenador AS e
        WHERE NOT EXISTS (
            SELECT 1
            FROM Equipo AS eq
            WHERE eq.ciudad = 'Costa Sur' AND NOT EXISTS (
                SELECT 1
                FROM Dirigio AS d
                WHERE d.nombre = e.nombre AND d.noEquipo = eq.noEquipo
            )
        );
    ```

5. Indicar cuál es el club de fútbol que menos deportistas ha tenido (número de jugadores que han representado a ese club).

    ```{.sql}
        WITH newt AS (
            SELECT je.noEquipo, COUNT(je.noJugador) AS jugadores_pasados
            FROM JugEn AS je
            WHERE je.temporadas IS NOT NULL
            GROUP BY je.noEquipo
        )
        SELECT n.noEquipo, e.nombre
        FROM newt AS n NATURAL JOIN Equipo AS e
        WHERE n.jugadores_pasados = (
            SELECT MIN(n2.jugadores_pasados)
            FROM newt AS n2
        );
    ```