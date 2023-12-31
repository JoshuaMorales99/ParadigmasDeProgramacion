/* ==================================================
 PERSONAJES.
===================================================*/
object homero {
	// Tiene una cantidad de donas (Al principio no tiene)
	var cantDonas = 0
	
	// Saber si tiene donas.
	method tieneDonas() = cantDonas > 0
	// Saber la cantidad de donas que tiene.
	method cantDonas() = cantDonas
	// Saber si esta distraido (tiene < 2 donas)
	method estaDistraido() = cantDonas < 2
	
	// Puede comprar donas.
	method comprarDonas() {
		// Compra por docena.
		cantDonas += 12
	}
	// Puede comer donas.
	method comerDonas() {
		// Si tiene donas, se come una.
		if(self.tieneDonas()) cantDonas -= 1
	}
}

object patoBalancin {
	// Nunca se distrae.
	method estaDistrido() = false
}

object lenny {
	// Toma cervezas mientras trabaja (Al principio no tomo ninguna)
	var cervezasTomadas = 0
	
	// Saber si esta distraido (tomo > 3 cervezas)
	method estaDistraido() = cervezasTomadas > 3
	// Saber la cantidad de cervezas tomadas.
	method cervezasTomadas() = cervezasTomadas
	
	// Tomar cervezas.
	method tomarCerveza() {
		cervezasTomadas += 1
	}
}

object mrBurns {
	// Tiene suficiente capital (Al principio es millonario)
	var esMillonario = true
	
	// Saber si es pobre.
	method esPobre() = !esMillonario
	
	// Despojar de sus riquezas.
	method despojarRiquezas() {
		esMillonario = false
	}
}