/*
*   Aclaración:
*    
*   Para probar si los resultados de las consultas están bien, hay que agregar o modificar algunos datos de las tablas.
*
*/


-- a) Liste los nombres y el salario de cada empleado que trabaje/haya trabajado en el departamento de I+D y en el de Innovación Productiva.

-- Opción 1:
SELECT e.enombre, e.salario
FROM Departamentos AS d INNER JOIN TrabajanEn AS te ON d.idd = te.idd INNER JOIN Empleados AS e ON te.ide = e.ide
WHERE d.dnombre LIKE 'I+D' AND EXISTS (
	SELECT 1
	FROM TrabajanEn AS te2 INNER JOIN Departamentos AS d2 ON te2.idd = d2.idd
	WHERE e.ide = te2.ide AND d2.dnombre LIKE 'Inn%tiva%'
);

-- Opción 2:
SELECT e.enombre, e.salario
FROM Departamentos AS d INNER JOIN TrabajanEn AS te ON d.idd = te.idd INNER JOIN Empleados AS e ON te.ide = e.ide
WHERE d.dnombre LIKE 'I+D'

INTERSECT

SELECT e.enombre, e.salario
FROM Departamentos AS d INNER JOIN TrabajanEn AS te ON d.idd = te.idd INNER JOIN Empleados AS e ON te.ide = e.ide
WHERE d.dnombre LIKE 'Inn%tiva%'


-- b) Encuentre los idadm de los gerentes que administran sólo departamentos con presupuesto mayor a $10.000.000.

-- Opción 1:
SELECT d.idadm
FROM Departamentos AS d 

EXCEPT 

SELECT d.idadm
FROM Departamentos AS d
WHERE d.presupuesto < 10000000;

-- Opción 2:
SELECT d.idadm
FROM Departamentos AS d
GROUP BY d.idadm 
HAVING MIN(d.presupuesto) > 10000000;


-- c) Encuentre los nombres de los gerentes que administran los mayores presupuestos. Si un gerente administra más de un departamento se deben sumar sus presupuestos.

WITH newt AS (
	SELECT d.idadm, SUM(d.presupuesto) AS presupuesto_total
	FROM Departamentos AS d
	GROUP BY d.idadm
)
SELECT e.enombre
FROM newt AS n INNER JOIN Empleados AS e ON n.idadm = e.ide
WHERE n.presupuesto_total IN (
	SELECT MAX(n2.presupuesto_total)
	FROM newt AS n2
);


-- d) Liste los nombres y las edades de los administradores que controlan mas de $15.000.000 de presupuesto en total.

SELECT e.enombre, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM Empleados AS e INNER JOIN Departamentos AS d ON e.ide = d.idadm
GROUP BY d.idadm, e.enombre
HAVING SUM(d.presupuesto) > 15000000;


-- e) Busque empleados que trabajan/han trabajado en todos los departamentos y liste sus nombres y salarios.

SELECT e.enombre, e.salario
FROM Empleados AS e  
WHERE NOT EXISTS (
	SELECT d.idd
	FROM Departamentos AS d
	
	EXCEPT
	
	SELECT te.idd
	FROM TrabajanEn AS te
	WHERE e.ide = te.ide
);


-- f) Encuentre los nombres de los gerentes que administran sólo departamentos con presupuestos de más de $10.000.000, pero al menos uno de ellos con presupuesto menor a $15.000.000.

WITH newt AS (
	SELECT d.idadm
	FROM Departamentos AS d
	GROUP BY d.idadm
	HAVING MIN(d.presupuesto) > 10000000
)
SELECT e.enombre
FROM Empleados AS e INNER JOIN newt AS n ON e.ide = n.idadm INNER JOIN Departamentos AS d ON n.idadm = d.idadm
WHERE d.presupuesto < 15000000;  


-- g) Listar los nombres de los empleados que empezaron a trabajar en Ventas en el primer semestre de 2020.

SELECT e.enombre
FROM Empleados AS e INNER JOIN TrabajanEn AS te ON e.ide = te.ide INNER JOIN Departamentos AS d ON te.idd = d.idd
WHERE d.dnombre LIKE '%Ventas%' AND te.desde BETWEEN '2020-01-01' AND '2020-06-30';


-- h) Para los departamentos que no tienen administrador, listar el nombre, el presupuesto y el salario promedio de sus empleados actuales.

WITH newt AS (
	SELECT d.idd, AVG(e.salario) AS salario_promedio
	FROM Departamentos AS d INNER JOIN TrabajanEn AS te ON d.idd = te.idd INNER JOIN Empleados AS e ON te.ide = e.ide
	WHERE d.idadm IS NULL
	GROUP BY d.idd
)
SELECT d.dnombre, d.presupuesto, n.salario_promedio
FROM newt AS n INNER JOIN Departamentos AS d ON n.idd = d.idd INNER JOIN TrabajanEn AS te ON d.idd = te.idd INNER JOIN Empleados AS e ON te.ide = e.ide
WHERE te.hasta IS NULL;

