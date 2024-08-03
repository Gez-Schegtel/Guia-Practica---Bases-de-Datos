
SELECT distinct sname
FROM proveedores (INNER JOIN catálogo on s.sid = c.sid) INNER JOIN partes on c.sid = p.pid
WHERE partes.color = "rojo"

/*
    Cuando trabajamos con cadenas de caracteres muchas veces resulta más conveniente utilzar "LIKE" antes que comparar con "=".

    Utilizar "alias" (esto es, renombrar la tabla), es una buena práctica.

    La diferencia entre NATURAL e INNER JOIN es que al INNER le tengo que dar la condición de igualdad.

    Si hacemos "FROM suppliers, catálogo, partes", estamos haciendo un producto cartesiano entre esas tablas.
*/

-- Opción 2: Utilizando una consulta anidada. No se necesita el DISTINCT porque cada proveedor será evaluado una única vez.

SELECT s.sname
FROM suppliers s 
WHERE s.sid IN

(SELECT c.sid
FROM catálogo c, partes p
WHERE c.pid = p.pid and p.color = "red")

-- Opción 3:

SELECT s.sname
FROM suppliers s, catálogo c, partes p
WHERE s.sid = c.sid AND c.pid = p.pid and p.color = "rojo"

-- Opción 4: Utilizando la cláusula `NATURAL JOIN`. 

