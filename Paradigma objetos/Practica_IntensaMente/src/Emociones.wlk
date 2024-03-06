// -----------------------------------------------------------------------
// 🔸 Emociones simples.
// -----------------------------------------------------------------------
// Clase abstracta para las emociones.
class Emocion {
	// Saber si se trata de una emocion alegre.
	method esAlegre() = false
	// Saber si se niega un recuerdo dado.
	method niega(unRecuerdo) = false
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	method aplicarConcecuencias(unaChica, unRecuerdo) {
		// No hace nada.
	}
}

object alegria inherits Emocion {
	// Saber si se trata de una emocion alegre.
	override method esAlegre() = true
	// Saber si se niega un recuerdo dado.
	override method niega(unRecuerdo) = not unRecuerdo.emocion().esAlegre()
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	override method aplicarConcecuencias(unaChica, unRecuerdo) {
		// Si la felicidad de la chica es mayor a 500, convetir el recuerdo en un pensamiento central.
		if(unaChica.felicidad() > 500) unaChica.agregarPensamientoCentral(unRecuerdo)
	}
}

object tristeza inherits Emocion {
	// Saber si se niega un recuerdo dado.
	override method niega(unRecuerdo) = unRecuerdo.emocion().esAlegre()
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	override method aplicarConcecuencias(unaChica, unRecuerdo) {
		// Disminuir un 10% (0.1) el nivel de felicidad de la chica.
		unaChica.disminuirFelicidad(0.1)
		// Convertir el recuerdo en un pensamiento central.
		unaChica.agregarPensamientoCentral(unRecuerdo)
	}
}

// Demas emociones.
const disgusto = new Emocion()
const furia = new Emocion()
const temor = new Emocion()

// -----------------------------------------------------------------------
// 🔸 Emociones compuestas.
// -----------------------------------------------------------------------
// Molde para las emociones compuestas.
class EmocionCombinada {
	// Emociones simples que conforman a la emocion compuesta.
	const emociones = []
	
	// Saber si se trata de una emocion alegre.
	method esAlegre() = emociones.any{emocion => emocion.esAlegre()}
	// Saber si se niega un recuerdo dado.
	method niega(unRecuerdo) = emociones.all{emocion => emocion.niega(unRecuerdo)}
	
	// Aplicar las consecuencias de un recuerdo dado a una persona determinada.
	method aplicarConcecuencias(unaChica, unRecuerdo) {
		// Asienta un recuerdo aplicando las consecuencias de todas sus emociones.
		emociones.forEach{emocion => emocion.aplicarConcecuencias(unaChica, unRecuerdo)}
	}
}