/* ==================================================
 🔸 PERSONAJES.
===================================================*/

object homero {
	// Tiene una cantidad de donas (Al principio no tiene)
	var cantDonas = 0
	
	// Saber si tiene donas.
	method tieneDonas() = cantDonas > 0
	// Saber la cantidad de donas que tiene.
	method cantDonas() = cantDonas
	// PUNTO 2.a: Saber si esta distraido (Tiene < 2 donas)
	method estaDistraido() = cantDonas < 2
	
	// PUNTO 1.a: Comprar donas (Comprar por docena)
	method comprarDonas() {
		cantDonas = cantDonas + 12
	}
	
	// PUNTO 1.a: Comer donas (Si tiene donas, se come una)
	method comerDona() {
		if(self.tieneDonas()) cantDonas = cantDonas - 1
	}
}

object patoBalancin {
	// Saber si esta distraido (Nunca se distrae)
	method estaDistrido() = false
}

object lenny {
	// Toma cervezas mientras trabaja (Al principio no tomo ninguna)
	var cervezasTomadas = 0
	
	// PUNTO 5: Saber si esta distraido (Tomo > 3 cervezas)
	method estaDistraido() = cervezasTomadas > 3
	// Saber la cantidad de cervezas tomadas.
	method cervezasTomadas() = cervezasTomadas
	
	// Tomar cervezas.
	method tomarCerveza() {
		cervezasTomadas = cervezasTomadas + 1
	}
}

object mrBurns {
	// Tiene suficiente capital (Al principio es millonario)
	var esMillonario = true
	
	// PUNTO 6.a: Saber si es pobre.
	method esPobre() = !esMillonario
	
	// PUNTO 6.b: Despojar de sus riquezas (Deja de ser millonario)
	method despojarRiquezas() {
		esMillonario = false
	}
}