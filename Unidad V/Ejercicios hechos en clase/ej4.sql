/*Opción 1*/

SELECT sid
FROM catalogo INNER JOIN partes
WHERE partes.color = 'rojo'

INTERSECT

SELECT sid
FROM catalogo INNER JOIN partes
WHERE partes.color = 'verdes'

/*Opción 2*/

SELECT sid
FROM catalogo INNER JOIN partes
WHERE partes.color = 'rojo' AND partes.color = 'verde'
