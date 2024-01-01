import Casa.*

/*================================================================
 QUILOMBERO.
=================================================================*/
object jerry {
	// Tiene un cierto peso.
	var peso = 0
	
	// Saber su velocidad (10 - su peso)
	method velocidad() = 0.max(10 - peso)
	
	// Hacer quilombo.
	method hacerQuilombo() {
		// Ensuciar casa.
		casa.ensuciar(110)
		// Robar comida (Aumenta su peso en 1)
		self.aumentarPeso(1)
	}
	// Aumentar en cierta cantidad el peso.
	method aumentarPeso(valor) {
		peso += valor
	}
	
	// Para test ===========================================
	method peso(nuevoPeso) {peso = nuevoPeso}
	method peso() = peso
}

object tuffy {
	// Saber su velocidad (Siempre es 10)
	method velocidad() = 10
	
	// Hacer quilombo.
	method hacerQuilombo() {
		// Hace ruido en la casa.
		casa.hacerRuido()
	}
}
