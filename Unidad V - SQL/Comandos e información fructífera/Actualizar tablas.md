Actualizar múltiples tuplas en una base de datos MariaDB se puede lograr utilizando varias estrategias, dependiendo de la cantidad de tuplas que necesites actualizar y de las condiciones que aplican para estas actualizaciones.

Aquí tienes algunos métodos comunes:

### 1. Usar una Tabla Temporal
Si tienes muchas actualizaciones con condiciones diversas, puedes insertar los valores a actualizar en una tabla temporal y luego realizar un `JOIN` para actualizar los valores.

```sql
-- Crear una tabla temporal
CREATE TEMPORARY TABLE temp_updates (
    id INT,
    nuevo_precio DECIMAL(10,2)
);

-- Insertar los nuevos valores
INSERT INTO temp_updates (id, nuevo_precio) VALUES
(1, 100),
(2, 200),
(3, 300);

-- Actualizar la tabla principal usando un JOIN con la tabla temporal
UPDATE productos p
JOIN temp_updates tu ON p.id = tu.id
SET p.precio = tu.nuevo_precio;

-- Eliminar la tabla temporal
DROP TEMPORARY TABLE temp_updates;
```

### 2. Varias Declaraciones `UPDATE`
Si las tuplas a actualizar no son muchas, podrías optar por escribir varias declaraciones `UPDATE`:

```sql
UPDATE productos SET precio = 100 WHERE id = 1;
UPDATE productos SET precio = 200 WHERE id = 2;
UPDATE productos SET precio = 300 WHERE id = 3;
```

### 3. Uso de una Subconsulta con `JOIN`
Otra técnica es usar una subconsulta con `JOIN` para realizar las actualizaciones:

```sql
UPDATE productos p
JOIN (
    SELECT 1 AS id, 100 AS nuevo_precio
    UNION ALL
    SELECT 2, 200
    UNION ALL
    SELECT 3, 300
) tu ON p.id = tu.id
SET p.precio = tu.nuevo_precio;
```

### Consideraciones Adicionales
- **Transacciones**: Si estás realizando múltiples actualizaciones, asegúrate de usarlas dentro de una transacción para mantener la consistencia de los datos.
- **Índices**: Asegúrate de que las columnas utilizadas en la cláusula `WHERE` estén indexadas para mejorar el rendimiento de la actualización.

Elige la técnica que mejor se adapte a tu situación específica en términos de número de registros a actualizar y la complejidad de las condiciones.
