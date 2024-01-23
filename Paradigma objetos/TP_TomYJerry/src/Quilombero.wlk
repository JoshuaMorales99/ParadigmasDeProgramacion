import Casa.*

/*================================================================
🔸 Quilomberos.
=================================================================*/
object jerry {
	// Peso.
	var peso = 0
	
	// Obtener su velocidad (10 - su peso)
	method velocidad() = 0.max(10 - peso)
	// Obtener su peso (Para test)
	method peso() = peso
	
	// Hacer quilombo.
	method hacerQuilombo() {
		// Ensuciar casa con 110 puntos de suciedad.
		casa.ensuciar(110)
		// Robar comida
		self.robarComida()
	}
	// Robar comida (Aumenta su peso en 1)
	method robarComida() {
		peso = peso + 1
	}
	
	// Establecer su peso (Para test)
	method peso(nuevoPeso) {
		peso = nuevoPeso
	}
}

object tuffy {
	// Obtener su velocidad (Siempre es 10)
	method velocidad() = 10
	
	// Hacer quilombo.
	method hacerQuilombo() {
		// Hace ruido en la casa.
		casa.hacerRuido()
	}
}

object cerebro {
	// Nivel de inteligencia (Comienza con 10 puntos)
	var inteligencia = 10
	
	// Obtener su velocidad (Igual a su inteligencia)
	method velocidad() = inteligencia
	// Obtener su nivel de inteligencia (Para test)
	method inteligencia() = inteligencia
	
	// Hacer quilombo.
	method hacerQuilombo() {
		// Idear un plan malvado.
		self.idearPlan()
		// Ensuciar la casa en 100 puntos.
		casa.ensuciar(100)
	}
	
	// Idear plan malvado (Aumenta el doble de su inteligencia)
	method idearPlan() {
		inteligencia = inteligencia * 2
	}
}

/*================================================================
🔸 PUNTO 8: Interfaz.
==================================================================
Excluyendo los metodos que son solamente para los test, las interfaces
serian las siguientes:

	+-------------------------------+
	| (O) jerry						|
	+-------------------------------+
	|	peso						|
	+-------------------------------+
	|	velocidad()					|
	|	hacerQuilombo()				|
	|	robarComida()				|
	+-------------------------------+
	
	+-------------------------------+
	| (O) tuffy						|
	+-------------------------------+
	|								|
	+-------------------------------+
	|	velocidad()					|
	|	hacerQuilombo()				|
	+-------------------------------+
	
	+-------------------------------+
	| (O) cerebro					|
	+-------------------------------+
	|	inteligencia				|
	+-------------------------------+
	|	velocidad()					|
	|	hacerQuilombo()				|
	|	idearPlan()					|
	+-------------------------------+

================================================================*/