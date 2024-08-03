
-- Resolver los siguientes ejercicios mediante consultas en SQL. Si no es posible, justificar.


-- 1. El nombre de los futbolistas que han jugado en más de cinco equipos.

SELECT j.nombre
FROM Jugador AS j NATURAL JOIN JugEn AS je
GROUP BY j.noJugador, j.nombre
HAVING COUNT(je.noEquipo) > 3;

-- Puse solamente mayor a tres porque no quería cargar muchos datos. 


-- 2. Nombre de jugadores que no hayan jugado en el club América.

SELECT j.nombre
FROM Jugador AS j
WHERE NOT EXISTS (
	SELECT 1
	FROM JugEn AS je INNER JOIN Equipo AS e ON je.noEquipo = e.noEquipo 
	WHERE j.noJugador = je.noJugador AND (e.nombre LIKE 'América' AND je.temporadas IS NOT NULL)
);


-- 3. Nombre de los jugadores que pertenecen al club América.

SELECT j.nombre
FROM Jugador AS j INNER JOIN JugEn AS je ON j.noJugador = je.noJugador INNER JOIN Equipo AS e ON je.noEquipo = e.noEquipo  
WHERE e.nombre LIKE 'América' AND je.temporadas IS NULL;


-- 4. Para aquellos entrenadores que posean una experiencia acumulada mayor a 10 años, obtener su nombre, y el mayor número de temporadas que dirigió a un mismo club.

-- newt1 tiene a los dt con más de diez años de experiencia. 
-- newt2 discrimina a los dt por su temporada más larga.
-- Al juntar los dos, obtengo a los dt con más de diez años de experiencia junto a sus temporadas más largas.
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


-- 5. El nombre de los entrenadores que han dirigido a todos los equipos de la ciudad de Costa Sur.

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


-- 6. Indicar cuál es el club de fútbol que menos deportistas ha tenido (número de jugadores que han representado a ese club).

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






