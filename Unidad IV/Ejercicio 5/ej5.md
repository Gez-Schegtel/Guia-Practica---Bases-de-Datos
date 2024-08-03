% Ejercicios de la Unidad IV

## Ejercicio 5

Dado el siguiente esquema relacional:

* flights(flno: integer, origin: string, to: string, distance: integer, departs: time, arrives: time, cost: real)
* certified(aid: integer, aname: string, cruisinrange: integer)
* employees(eid: integer, aid: integer)
* flights(eid: integer, ename: string, salary: real)

Tener en cuenta que la relación _employees_ describe tanto pilotos como otras clases de empleados; cada piloto está calificado para algún avión (de otra manera no podría calificar como piloto), y sólo los pilotos están calificados para volar.

Escribir las siguientes consultas en álgebra relacional. Tener en cuenta que no todas pueden ser contestadas. En tales casos explicar por qué.

---

1. Encuentre los eids de pilotos certificados para algún avión Boeing.

	Opción 1:

		π eid (σ aname == 'Boeing 727' (aircraft) ⋈ certified)
	
	_Sin embargo, esta opción sólo toma los pilotos que están certificados para volar un Boeing 727._
	_Para hacer más general la consulta, en Relational podemos hacer lo siguiente: _ 
	 
	Opción 2:

		π eid (σ (aname.startswith("Boeing")) (aircraft) ⋈ certified)

	_Esta consulta encuentra el eid de todos los pilotos que pueden volar aviones Boeing._

---

2. Encuentre los nombres de pilotos certificados para algún avión Boeing.

		π eid, ename (σ (aname.startswith("Boeing")) (aircraft) ⋈ certified ⋈ employees)

---

3. Encuentre los aids de todos los aviones que pueden ser usados para vuelos sin paradas desde Los Ángeles hasta Sydney.

	_Voy a proyectar también el nombre del avión para que sea más fácil de controlar el ejercicio._

		π aid, aname(σ cruisingrange > distance (aircraft * σ origin == 'Los Angeles' and to == 'Sydney' (flights)))

---

4. Identifique los vuelos que pueden ser piloteados por cada piloto cuyo salario sea mayor a $260.000.

		aux1 = (σ salary > 260000 (employees) ⋈ certified ⋈ aircraft)

		π flno, ename (σ cruisingrange > distance (flights * aux1))

---

5. Encuentre los nombres de pilotos que pueden operar aviones con un rango mayor a 3.000 km pero que NO esten certificados para los aviones Boeing.

		aux1 = employees ⋈ certified ⋈ σ cruisingrange > 3000 (aircraft)

		aux2 = employees ⋈ certified ⋈ σ (aname.startswith("Boeing")) (aircraft)

		π ename (aux1) - π ename (aux2)

	_En **aux1** obtenemos una relación con todos los pilotos que pueden volar aviones con una autonomía mayor a los 3000km, incluídos los Boeing; **aux2** es una tabla con pilotos que están certificados para volar aviones Boeing._

	_Al hacer una diferencia entre estas dos tablas, obtenemos una nueva tabla con pilotos que no están certificados para pilotar aviones Boeing pero sí pueden volar más de 3000km._

---

6. Encuentre los eids de empleados que ganan el mayor salario.

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (employees)

		aux1 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (employees * aux))

		π ename, eid (employees - aux1)

	_Primero, hacemos la tabla **aux** para poder hacer el producto cartesiano "entre sí" de la tabla **employees**. Luego, en **aux1** obtenemos una tabla donde se excluyó al empleado que gana el mayor salario. De esta manera, al hacer la diferencia con la tabla original, obtenemos el empleado que más gana al estar "eliminando" a todos los demás._
	
	_El nombre lo proyectamos para que sea más fácil comprobar el ejercicio._

---

7. Encuentre los eids de empleados que ganen el segundo mayor salario.

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (employees)

		aux1 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (employees * aux))

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (aux1)

		aux2 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (aux1 * aux))

		π ename, eid (aux1 - aux2)

	_Este ejercicio sigue la misma lógica que el punto anterior, pero repitiendo el proceso una vez más: Digamos que de una tabla **"A"**, obtengo una tabla **"B"** que excluye a la persona que gane el mayor salario de la tabla **"A"**. Repito el proceso, pero esta vez de la tabla **"B"** obtengo una tabla **"C"** que excluye a la persona que gane el mayor salario de la tabla **"B"**._ 

	_Finalmente, la diferencia entre la tabla **"B"** con la **"C"**, nos devuelve la persona con el mayor salario de la tabla **"B"**, que a su vez es la persona con el segundo mejor salario en la tabla **"A"**, que es lo que se nos pide en el enunciado._

---

8. Encuentre los eids de empleados que están certificados para la mayor cantidad de aviones.

	Este ejercicio no se puede resolver con las herramientas que nos brinda el álgebra relacional. Aunque el ejercicio pareciera ser similar al anterior, ahora tendríamos que comparar si el resultado de contar algo (la cantidad de aviones que un piloto puede pilotar) es mayor al resultado de contar otra cosa. **Acumular o contar valores no lo podemos hacer**. Nótese que en el ejercicio anterior podíamos comparar si un salario era mayor a otro porque era simplemente una cuestión de comparar dos valores numéricos "absolutos" almacenados de antemano en un campo de la tabla.

---

9. Encuentre los eids de los empleados que están certificados para exactamente 3 (tres) aviones.

		aux1 = ρ eid ➡ eid_aux1, aid ➡ aid_aux1 (certified)

		aux2 = ρ eid ➡ eid_aux2, aid ➡ aid_aux2 (certified)

		aux3 = ρ eid ➡ eid_aux3, aid ➡ aid_aux3 (certified)

		vuelan3_o_mas = σ eid == eid_aux1 == eid_aux2 and aid != aid_aux1 and aid != aid_aux2 and aid_aux1 != aid_aux2 (certified * aux1 * aux2)

		vuelan4_o_mas = σ eid == eid_aux1 == eid_aux2 == eid_aux3 and aid != aid_aux1 and aid != aid_aux2 and aid != aid_aux3 and aid_aux1 != aid_aux2 and aid_aux1 != aid_aux3 and aid_aux2 != aid_aux3 (certified * aux1 * aux2 * aux3)

		π eid (vuelan3_o_mas) - π eid (vuelan4_o_mas)

---

10. Encuentre la cantidad total de dinero pagado en concepto de salario.

	Para resolver este ejercicio tendríamos que sumar todos los salarios que aparecen en la tabla **employees**. Como sucedía en el ejericio 8, **al no poder contar o acumular valores** en el álgebra relacional, este ejercicio **no se puede resolver**.

---

11. ¿Existe alguna secuencia de vuelos de Buenos Aires a Berlín Cada vuelo en la secuencia debe partir de la ciudad que es destino del vuelo anterior; el primer vuelo debe partir de Buenos Aires, el último debe llegar a Berlín y no hay restricción en la cantidad de vuelos intermedios. Su consulta debe determinar cuándo existe alguna secuencia de vuelos desde Buenos Aires a Berlín para alguna instancia de la relación Vuelos.

	   Al no estar determinada la cantidad de vuelos intermedios o escalas que tiene el vuelo este ejercicio **no se puede resolver**. 

	El en caso hipotético de que sí estuviese determinado este factor, al ejercicio se lo podría resolver haciendo muchas comparaciones (aunque pueda parecer tedioso). Sin estar determinado el número de paradas, no se puede hacer con las herramientas que tenemos de álgebra relacional.

---
