// -----------------------------------------------------------------------
// 🔸 Emociones.
// -----------------------------------------------------------------------
// Clase abstracta para las emociones.
class Emocion {
	// Saber si se trata de una emocion alegre.
	method esAlegre() = false
	
	// Saber si se niega un recuerdo dado.
	method niega(recuerdo) = false
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	method aplicarConcecuencias(chica, recuerdo) {
		// No hace nada.
	}
}

object alegria inherits Emocion {
	// Saber si se trata de una emocion alegre.
	override method esAlegre() = true

	// Saber si se niega un recuerdo dado.
	override method niega(recuerdo) = not recuerdo.emocion().esAlegre()
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	override method aplicarConcecuencias(chica, recuerdo) {
		// Si la felicidad de la chica es mayor a 500.
		if(chica.felicidad() > 500) {
			// Convetir el recuerdo en un pensamiento central.
			chica.agregarPensamientoCentral(recuerdo)
		}
	}
}

object tristeza inherits Emocion {
	// Saber si se niega un recuerdo dado.
	override method niega(recuerdo) = recuerdo.emocion().esAlegre()
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	override method aplicarConcecuencias(chica, recuerdo) {
		// Disminuir un 10% (0.1) el nivel de felicidad de la chica.
		chica.disminuirFelicidad(0.1)
		// Convertir el recuerdo en un pensamiento central.
		chica.agregarPensamientoCentral(recuerdo)
	}
}

object disgusto inherits Emocion {
	
}

object furia inherits Emocion {
	
}

object temor inherits Emocion {
	
}