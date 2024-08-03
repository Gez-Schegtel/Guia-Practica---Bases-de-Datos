# Ejemplos de práctica extraídos del apunte teórico de la unidad IV

### Las tablas a utilizar para realizar los ejercicios son las siguientes: 

![](/home/juani/OneDrive/Facultad/3%C2%B0%20a%C3%B1o/Bases%20de%20Datos/Pr%C3%A1ctica/Unidad%20IV/Ejemplos/tablas.png)

\

1. Averiguar el nombre de los marineros que han reservado el barco 103.

    Opción 1:

        π nombrem (σ idb == 103 (r2 ⋈ m3))

    Opción 2:

        π nombrem (σ idb == 103 (r2) ⋈ m3)
    
    _La opción 2 al hacer la selección primero, es menos costosa de calcular._

---

2. Averiguar el nombre de los marineros que han reservado barcos rojos.

    	π nombrem (m3 ⋈ (σ color == 'Rojo' (b1) ⋈ r2))

---

3. Averiguar el color de los barcos reservados por López.

		π color (b1 ⋈ r2 ⋈ σ nombrem == 'López' (m3))

---

4. Averiguar el nombre de los marineros que han reservado, como mínimo, un barco.

		π nombrem (m3 ⋈ r2)

---

5. Averiguar el nombre de los marineros que han reservado barcos rojos o verdes.

	Opción 1:
		
		π nombrem (σ color == 'Rojo' or color == 'Verde' (b1) ⋈ (m3 ⋈ r2))


	Opción 2:

		aux = σ color == 'Verde' (b1) ∪ σ color == 'Rojo' (b1)
π nombrem (aux ⋈ r2 ⋈ m3)

	Opción 3:

		rojo_temp = π idm (σ color == 'Rojo' (b1) ⋈ r2)

		verde_temp = π idm (σ color == 'Verde' (b1) ⋈ r2)

		π nombrem ((rojo_temp ∪ verde_temp) ⋈ m3)

	_Yo prefiero la primer opción, aunque la tercera es fácilmente "convertible" a cuando te piden barcos rojos y verdes al mismo tiempo._

---

6. Averiguar el nombre de los marineros que han reservado barcos rojos y verdes.

		rojo_temp = π idm (σ color == 'Rojo' (b1) ⋈ r2)

		verde_temp = π idm (σ color == 'Verde' (b1) ⋈ r2)

		π nombrem ((rojo_temp ∩ verde_temp) ⋈ m3)
		

---

7. Averiguar el nombre de los marineros que han reservado, como mínimo, dos barcos.

		reservas_1 = ρ idm ➡ idm1, nombrem ➡ nom1, idb ➡ idb1 (π idm, nombrem, idb (r2 ⋈ m3))

		reservas_2 = ρ idm1 ➡ idm2, nom1 ➡ nom2, idb1 ➡ idb2 (reservas_1)

		π nom1 (σ idm1 == idm2 and idb1 != idb2 (reservas_1 * reservas_2))

---

8. Averiguar el idm de los marineros con edad superior a 20 que no hayan reservado ningún barco rojo.

		π idm (σ edad > 20 (m3)) - π idm (σ color == 'Rojo' (b1) ⋈ r2 ⋈ m3)

---

9. Averiguar el nombre de los marineros que han reservado todos los barcos.

		π nombrem (m3 ⋈ π idm, idb (r2) ÷ π idb (b1))

	_El empleo de la palabra todos (o cada) es una buena indicación de que se podría aplicar la operación división._

---

10. Averiguar el nombre de los marineros que han reservado todos los barcos llamados "Intrépido".

		π nombrem (m3 ⋈ π idm, idb (r2) ÷ π idb (σ nombreb == 'Intrépido' (b1)))




