% Ejercicios - Unidad IV

# Grupo 8

[Integrantes]{.underline}: 

* Leonor Albornoz
* Maximiliano Cocito
* Fabricio Víctor Kinweiler
* Mauricio Nicolás Schefer
* Yamil Apas Moselli
* Juan Ignacio Velazco Gez Schegtel

## Ejercicio 1

Explique la afirmación de que los operadores de álgebra relacional pueden "componerse". ¿Por qué es importante la capacidad de componer operadores?

Los operadores se pueden componer para combinar operaciones y condiciones que nos permitan obtener la información que necesitamos.

_También podemos decir..._

> En el álgebra relacional, la afirmación de que los operadores pueden "componerse" se refiere a la capacidad de encadenar o combinar varios operadores para formar una sola expresión o consulta. Esto significa que el resultado de un operador puede ser la entrada de otro.
>
> Por ejemplo, si tienes dos operadores, **selección (σ)** y **proyección (π)**, puedes "componerlos" de la siguiente manera:
>
> $$
> \pi_{\text{atributo}} (\sigma_{\text{condición}} (\text{Relación}))
> $$
>
> En este caso, primero se aplica el operador de selección a una relación para filtrar las tuplas que cumplen con una cierta condición. Luego, el operador de proyección se aplica al resultado para seleccionar solo ciertos atributos.


## Ejercicio 2

Dadas dos relaciones R1 y R2, donde R1 contiene N1 tuplas, R2 contiene N2 tuplas, y N2 > N1 > 0, encuentre los tamaños mínimo y máximo posible (en tuplas) para la relación resultante al aplicar cada una de las siguientes expresiones de álgebra relacional. En cada caso, establezca los supuestos necesarios sobre los esquemas de R1 y R2 para que la expresión tenga sentido.

a. R1 ∪ R2

	Para poder ser compatible con la unión, las tablas tienen que tener los mismos atributos o campos. También se puede "forzar" esta compatibilidad haciendo una proyección de los campos correspondientes. 

	El tamaño mínimo será el de R2 (o sea, N2) si R1 no tiene tuplas cargadas. El tamaño máximo, N1+N2.

b. R1 ∩ R2

	El tamaño mínimo será 0, una tabla sin tuplas, porque puede pasar que no se encuentre tuplas "en común". El tamaño máximo será N1.

	La intersección también debe ser compatible con la unión.

c. R1 - R2

	El tamaño mínimo será 0. Lo que significa que se "sacó" todos las tuplas en N2 que aparecían también en N1. El máximo, N1, ergo, no se pudo restar nada.

	La diferencia de conjuntos o resta debe ser compatible con la unión.

d. R1 × R2

	En el producto cartesiano hay que tomar la precaución de cambiar el nombre de los campos de ser necesario. De otra manera, se prohibiría la operación al no poder tener una tabla con nombres de campos repetidos, o, en el mejor de los casos, los nombres que sean iguales quedarían indefinidos en la tabla resultante. 

	El tamaño mínimo será el de N2. Este es el caso en que la tabla R1, de tamaño N1, tenga una cardinalidad de 1. El tamaño máximo está dado por el producto N1×N2.

e. σ a == 5 (R1)

	El tamaño mínimo será 0. Esto pasaría si en la tabla R1 no hay ningún campo "a" con el valor 5. El tamaño máximo será equivalente a la cantidad de veces que aparezca este valor en la tabla o relación.

f. π a (R1)

	Para este ejemplo el tamaño máximo es N1. El tamaño mínimo podría ser 1 si el valor del campo "a" es el mismo para toda la relación.  

g. R1/R2

	En el álgebra relacional, la operación R1/R2 es una operación de división. Esta operación se utiliza para responder a consultas que incluyen la frase “para todos”. 

	"Dividir" R1/R2 devuelve una relación con todos los registros en R1 que están asociados en R2 con **todos** los registros de R2. En cuanto a los campos de la relación resultante, la operación de produce una tabla que consta de aquellos campos de R1 que no están en R2. Es decir, si R1 tiene los campos {A, B, C} y R2 tiene los campos {B}, entonces la relación resultante tendrá los campos {A, C}.

	Antes de analizar el resultado de la operación, analicemos lo que tiene que suceder para que la misma pueda llevarse a cabo: El grado de la relación R1 tiene que ser mayor que el de la relación R2; además R2 debe tener al menos un campo que coincida en denominación y dominio con algún campo de R1.

	Ahora bien, si respetamos la cardinalidad establecida en la consigna donde N2>N1, el tamaño será siempre 0, ya que no resultará nada de la operación. Por ello, analizaremos la operación **R1/R2 cuando N1>N2**:

	El tamaño máximo de la relación resultante será N1. Esto sucederá si cada registro en R1 está asociado con todos los registros en R2.

	El tamaño mínimo de la relación resultante será 0. Esto sucederá si no hay ningún registro en R1 que esté asociado con todos los registros en R2.

## Ejercicio 3

Considere el siguiente esquema: 

* Proveedores([idp: integer]{.underline}, nombrep: string, direccionp: string)

* Partes([idpa:integer]{.underline}, nombrepa: string, color: string)

* Catalogo([idp: integer, idpa: integer]{.underline}, precio: real)

Los campos clave están subrayados y el dominio de cada campo se especifica después del nombre. La relación "Catalogo" lista los precios a los que cada proveedor vende cada parte. Escriba las siguientes consultas en álgebra relacional: 

1. Encontrar los nombres de los proveedores que proveen alguna parte roja.

		π nombrep (proveedores ⋈ σ color == 'Red' (partes) ⋈ catalogo)

2. Encontrar los idps de los proveedores que proveen alguna parte roja o verde.
	
	Opción 1:

		π idp (proveedores ⋈ σ color == 'Red' or color == 'Green' (partes) ⋈ catalogo)

	Opción 2:
		
		pRojas = proveedores ⋈ catalogo ⋈ σ color == 'Red' (partes)

		pVerdes = proveedores ⋈ catalogo ⋈ σ color == 'Green' (partes)

		π idp (pRojas) ∪ π idp (pVerdes)

3. Encontrar los idps de los proveedores que proveen alguna parte roja o están en Av. 9 de Julio 2222.

		π idp (σ direccionp == 'Av. 9 de Julio 2222' (proveedores)) ∪ π idp (σ color == 'Red' (partes) ⋈ catalogo)

4. Encontrar los idps de los proveedores que proveen alguna parte roja y alguna parte verde.

		pRojas = proveedores ⋈ catalogo ⋈ σ color == 'Red' (partes)

		pVerdes = proveedores ⋈ catalogo ⋈ σ color == 'Green' (partes)

		π idp (pRojas) ∩ π idp (pVerdes)

5. Encontrar los idps de los proveedores que proveen todas las partes.

		π idp, idpa (catalogo) ÷ π idpa (partes)

	*Recordar que cuando se nos indica que encontremos "todo" de algo, se suele ocupar la división.*

6. Encontrar los idps de los proveedores que proveen todas las partes rojas.

		π idp, idpa (catalogo) ÷ π idpa (σ color == 'Red' (partes))

7. Encontrar los idps de los proveedores que proveen todas las partes rojas o verdes.

		π idp, idpa(catalogo) ÷ π idpa (σ color == 'Red'(partes)) ∪ π idp (catalogo ⋈ σ color == 'Green'(partes))

8. Encontrar los idps de los proveedores que proveen todas las partes rojas o todas las partes verdes.

		todosRojos = π idp, idpa (catalogo) ÷ π idpa (σ color == 'Red' (partes))

		todosVerdes = π idp, idpa (catalogo) ÷ π idpa (σ color == 'Green' (partes))

		todosRojos ∪ todosVerdes

9. Encontrar pares de idps tales que el proveedor con el primer idp vende más caro alguna parte que el proveedor con el segundo idp.

		aux = ρ idp ➡ idp_aux, idpa ➡ idpa_aux, precio ➡ precio_aux (catalogo)

		π idp, idp_aux, idpa, idpa_aux, precio, precio_aux (σ idp != idp_aux and idpa == idpa_aux and precio > precio_aux (catalogo * aux))

	_Proyecté más campos que los solicitados en la consigna para poder comprobar los resultados rápidamente._

10. Encontrar los idpas de las partes que son provistas por al menos dos proveedores diferentes.

		aux = ρ idp ➡ idp_aux, idpa ➡ idpa_aux, precio ➡ precio_aux (catalogo)

		π idp, idp_aux, idpa, idpa_aux (σ idp != idp_aux and idpa == idpa_aux (catalogo * aux))

11. Encontrar los idpas de las partes que son provistas por el proveedor llamado ["Big Red Tool and Die" ](https://youtu.be/X8OeBZQn3_w?si=lRIx3fkRbKop2dLS&t=218)).

		π nombrep, idpa(σ nombrep == "Big Red Tool and Die" (proveedores) ⋈ catalogo ⋈ partes)

12. Encontrar los idpas de las partes provistas por todos los proveedores a menos de $200 (si algún proveedor no provee la parte o la cobra más de $200, ésta no se selecciona).

		π idpa, idp (σ precio < 200 (catalogo)) ÷ π idp (proveedores)

	_Recordar que para obtener proveedores que provean todas las partes (ergo, un idp que "tenga" todas las idpa's), la consulta es:_
	
		π idp, idpa (catalogo) ÷ π idpa (partes)

	_En este punto nos piden los mismo pero al revés: un idpa que "tenga" todos los idp's._

## Ejercicio 4

Considere el esquema Proveedores-Partes-Catálogo del punto anterior. Establezca cuál es el resultado de las siguientes consultas:

a. **π nombrep (π idpa (σ color == 'Red' (partes)) ⋈ σ precio < 100 (catalogo) ⋈ proveedores)**

	Arroja el nombre de los proveedores que proveen partes rojas a menos de $100.

	El resultado de la consulta fue:
	
	|nombrep         |
	|:--------------------:|
	|Acme Widget Suppliers|
	|Big Red Tool and Die|
	|Alien Aircraft Inc.|
	|Perfunctory Parts|


b. **π nombrep (π idpa (σ color == 'Red' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores))**

	Primero, dentro del paréntesis donde se hacen los _«natural joins»_ toma las partes rojas que son vendidas a menos de $100. Para dar esta información no haría falta hacer el _«natural join»_ con la relación de proveedores. Este resultado intermedio es el siguiente:

	|idpa|
	|:----------:|
	|1|
	|8|
	|3|

	Luego, trata de hacer la proyección del campo "nombrep" y falla, ya que el mismo no es parte de la relación.
	
c. **π nombrep (σ color == 'Red' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores) ∩ π nombrep (σ color == 'Green' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores)**

	Devuelve los nombres de los proveedores que tienen tanto partes rojas como verdes a menos de $100.

	El resultado de la consulta fue:

	|nombrep|
	|:-------:|
	|Acme Widget Suppliers|
	|Perfunctory Parts|
	
d. **π idp (σ color == 'Red' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores) ∩ π idp (σ color == 'Green' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores)**

	Ídem al punto anterior. El _«natural join»_ con la relación o tabla de proveedores está de más ya que esta vez se proyectará el idp, dato que se encuentra en la tabla de catálogos.
	
e. **π nombrep (π idp, nombrep (σ color == 'Red' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores) ∩ π idp, nombrep (σ color == 'Green' (partes) ⋈ σ precio < 100 (catalogo) ⋈ proveedores))**

	La consulta devuelve lo mismo que la consulta del punto **c**. La diferencia es que primero hace una intersección entre una tabla con proveedores que tienen partes rojas a menos de $100 con otra que tiene lo mismo pero con partes verdes. Este resultado "intermedio" es: 

	|idp|nombrep|
	|:---:|:-------:|
	|1|Acme Widget Suppliers|
	|3|Perfunctory Parts|

	Finalmente, sobre esta tabla proyecta el campo "idp", obteniendo así el mismo resultado que en el punto **c**.

## Ejercicio 5

Dado el siguiente esquema relacional:

* flights(flno: integer, origin: string, to: string, distance: integer, departs: time, arrives: time, cost: real)
* certified(aid: integer, aname: string, cruisinrange: integer)
* employees(eid: integer, aid: integer)
* flights(eid: integer, ename: string, salary: real)

Tener en cuenta que la relación _employees_ describe tanto pilotos como otras clases de empleados; cada piloto está calificado para algún avión (de otra manera no podría calificar como piloto), y sólo los pilotos están calificados para volar.

Escribir las siguientes consultas en álgebra relacional. Tener en cuenta que no todas pueden ser contestadas. En tales casos explicar por qué.

1. Encuentre los eids de pilotos certificados para algún avión Boeing.

	Opción 1:

		π eid (σ aname == 'Boeing 727' (aircraft) ⋈ certified)
	
	_Sin embargo, esta opción sólo toma los pilotos que están certificados para volar un Boeing 727._
	_Para hacer más general la consulta, en Relational podemos hacer lo siguiente: _ 
	 
	Opción 2:

		π eid (σ (aname.startswith("Boeing")) (aircraft) ⋈ certified)

	_Esta consulta encuentra el eid de todos los pilotos que pueden volar aviones Boeing._

2. Encuentre los nombres de pilotos certificados para algún avión Boeing.

		π eid, ename (σ (aname.startswith("Boeing")) (aircraft) ⋈ certified ⋈ employees)

3. Encuentre los aids de todos los aviones que pueden ser usados para vuelos sin paradas desde Los Ángeles hasta Sydney.

	_Voy a proyectar también el nombre del avión para que sea más fácil de controlar el ejercicio._

		π aid, aname(σ cruisingrange > distance (aircraft * σ origin == 'Los Angeles' and to == 'Sydney' (flights)))

4. Identifique los vuelos que pueden ser piloteados por cada piloto cuyo salario sea mayor a $260.000.

		aux1 = (σ salary > 260000 (employees) ⋈ certified ⋈ aircraft)

		π flno, ename (σ cruisingrange > distance (flights * aux1))

5. Encuentre los nombres de pilotos que pueden operar aviones con un rango mayor a 3.000 km pero que NO esten certificados para los aviones Boeing.

		aux1 = employees ⋈ certified ⋈ σ cruisingrange > 3000 (aircraft)

		aux2 = employees ⋈ certified ⋈ σ (aname.startswith("Boeing")) (aircraft)

		π ename (aux1) - π ename (aux2)

	_En **aux1** obtenemos una relación con todos los pilotos que pueden volar aviones con una autonomía mayor a los 3000km, incluídos los Boeing; **aux2** es una tabla con pilotos que están certificados para volar aviones Boeing._

	_Al hacer una diferencia entre estas dos tablas, obtenemos una nueva tabla con pilotos que no están certificados para pilotar aviones Boeing pero sí pueden volar más de 3000km._

6. Encuentre los eids de empleados que ganan el mayor salario.

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (employees)

		aux1 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (employees * aux))

		π ename, eid (employees - aux1)

	_Primero, hacemos la tabla **aux** para poder hacer el producto cartesiano "entre sí" de la tabla **employees**. Luego, en **aux1** obtenemos una tabla donde se excluyó al empleado que gana el mayor salario. De esta manera, al hacer la diferencia con la tabla original, obtenemos el empleado que más gana al estar "eliminando" a todos los demás._
	
	_El nombre lo proyectamos para que sea más fácil comprobar el ejercicio._

7. Encuentre los eids de empleados que ganen el segundo mayor salario.

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (employees)

		aux1 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (employees * aux))

		aux = ρ eid ➡ eid_aux, ename ➡ ename_aux, salary ➡ salary_aux (aux1)

		aux2 = π eid, ename, salary (σ eid != eid_aux and salary < salary_aux (aux1 * aux))

		π ename, eid (aux1 - aux2)

	_Este ejercicio sigue la misma lógica que el punto anterior, pero repitiendo el proceso una vez más: Digamos que de una tabla **"A"**, obtengo una tabla **"B"** que excluye a la persona que gane el mayor salario de la tabla **"A"**. Repito el proceso, pero esta vez de la tabla **"B"** obtengo una tabla **"C"** que excluye a la persona que gane el mayor salario de la tabla **"B"**._ 

	_Finalmente, la diferencia entre la tabla **"B"** con la **"C"**, nos devuelve la persona con el mayor salario de la tabla **"B"**, que a su vez es la persona con el segundo mejor salario en la tabla **"A"**, que es lo que se nos pide en el enunciado._

8. Encuentre los eids de empleados que están certificados para la mayor cantidad de aviones.

	Este ejercicio no se puede resolver con las herramientas que nos brinda el álgebra relacional. Aunque el ejercicio pareciera ser similar al anterior, ahora tendríamos que comparar si el resultado de contar algo (la cantidad de aviones que un piloto puede pilotar) es mayor al resultado de contar otra cosa. **Acumular o contar valores no lo podemos hacer**. Nótese que en el ejercicio anterior podíamos comparar si un salario era mayor a otro porque era simplemente una cuestión de comparar dos valores numéricos "absolutos" almacenados de antemano en un campo de la tabla.

9. Encuentre los eids de los empleados que están certificados para exactamente 3 (tres) aviones.

		aux1 = ρ eid ➡ eid_aux1, aid ➡ aid_aux1 (certified)

		aux2 = ρ eid ➡ eid_aux2, aid ➡ aid_aux2 (certified)

		aux3 = ρ eid ➡ eid_aux3, aid ➡ aid_aux3 (certified)

		vuelan3_o_mas = σ eid == eid_aux1 == eid_aux2 and aid != aid_aux1 and aid != aid_aux2 and aid_aux1 != aid_aux2 (certified * aux1 * aux2)

		vuelan4_o_mas = σ eid == eid_aux1 == eid_aux2 == eid_aux3 and aid != aid_aux1 and aid != aid_aux2 and aid != aid_aux3 and aid_aux1 != aid_aux2 and aid_aux1 != aid_aux3 and aid_aux2 != aid_aux3 (certified * aux1 * aux2 * aux3)

		π eid (vuelan3_o_mas) - π eid (vuelan4_o_mas)

10. Encuentre la cantidad total de dinero pagado en concepto de salario.

	Para resolver este ejercicio tendríamos que sumar todos los salarios que aparecen en la tabla **employees**. Como sucedía en el ejericio 8, **al no poder contar o acumular valores** en el álgebra relacional, este ejercicio **no se puede resolver**.

11. ¿Existe alguna secuencia de vuelos de Buenos Aires a Berlín Cada vuelo en la secuencia debe partir de la ciudad que es destino del vuelo anterior; el primer vuelo debe partir de Buenos Aires, el último debe llegar a Berlín y no hay restricción en la cantidad de vuelos intermedios. Su consulta debe determinar cuándo existe alguna secuencia de vuelos desde Buenos Aires a Berlín para alguna instancia de la relación Vuelos.

	   Al no estar determinada la cantidad de vuelos intermedios o escalas que tiene el vuelo este ejercicio **no se puede resolver**. 

	El en caso hipotético de que sí estuviese determinado este factor, al ejercicio se lo podría resolver haciendo muchas comparaciones (aunque pueda parecer tedioso). Sin estar determinado el número de paradas, no se puede hacer con las herramientas que tenemos de álgebra relacional.
