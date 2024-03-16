import Casa.*

/*================================================================
🔸 Cuidadores.
================================================================*/
object tom {
	// Cantidad de energia (Property para test)
	var property energia = 0
	
	// Obtener su velocidad (5 + energia / 10)
	method velocidad() = 5 + energia / 10
	
	// Saber si puede atrapar al quilombero (Su velocidad es superior al del quilombero)
	method puedeAtrapar(quilombero) = self.velocidad() > quilombero.velocidad()
	
	// Limpiar la casa.
	method limpiar() {
		// Realizar limpieza en la casa (Reduce la suciedad en 100)
		casa.limpiarSuciedad(100)
		// Pierde 40 de energia.
		self.gastarEnergia(40)
	}
	
	// Gastar cierta cantidad de energia.
	method gastarEnergia(valor) {
		energia = 0.max(energia - valor)
	}
	
	// Dormir (Incrementa su energia en 50)
	method dormir() {
		self.cargarEnergia(50)
	}
	
	// Cargar cierta cantidad de energia.
	method cargarEnergia(valor) {
		energia += valor
	}
	
	// Interrumpir suenio (Pierde 20 de energia)
	method interrumpirSuenio() {
		self.gastarEnergia(20)
	}
}

object robocat {
	// Saber si puede atrapar a un quilombero dado (Siempre puede atraparlo)
	method puedeAtrapar(quilombero) = true
	
	// Dormir (Simplemente se apaga)
	method dormir() {
		
	}
	
	// Interrumpir suenio (No se puede interrumpir)
	method interrumpirSuenio() {
		
	}
	
	// Limpiar la casa totalemente.
	method limpiar() {
		casa.limpiezaCompleta()
	}
}

object spike {
	// Nivel de enfado.
	var enfado = 0
	
	// Obtener el nivel de enfado (Para test)
	method enfado() = enfado
	
	// Saber si puede atrapar a un quilombero dado (Si esta enfadado)
	method puedeAtrapar(quilombero) = self.estaEnfadado()
	// Saber si esta enfadado (Si tiene un nivel de enfado mayor a 10)
	method estaEnfadado() = enfado > 10
	
	// Enfadar (Aumenta su nivel de enfado en una cantidad dada)
	method enfadar(cantidad) {
		enfado = cantidad
	}
	
	// Dormir (Baja el nivel de enfado en 5 puntos)
	method dormir() {
		enfado = 0.max(enfado - 5)
	}
	
	// Interrumpir suenio (Sube su niver de enfado en 10 puntos)
	method interrumpirSuenio() {
		enfado = enfado + 10
	}
	
	// Limpiar la casa.
	method limpiar() {
		// Si esta enfadado, ensucia la casa, en caso contrario, limpia 100 puntos de suciedad.
		if(self.estaEnfadado()) self.ensuciar() else casa.limpiarSuciedad(100)
	}
	
	// Ensuciar la casa (10 * nivel de enfado)
	method ensuciar() {
		casa.ensuciar(10 * enfado)
	}
}

/*================================================================
🔸 PUNTO 8: Interfaz.
==================================================================
Excluyendo los metodos que son solamente para los test, las interfaces
serian las siguientes:

	+-------------------------------+
	| (O) tom						|
	+-------------------------------+
	|	energia						|
	+-------------------------------+
	|	velocidad()					|
	|	puedeAtrapar(quilombero)	|
	|	limpiar()					|
	|	gastarEnergia(valor)		|
	|	dormir()					|
	|	cargarEnergia(valor)		|
	|	interrumpirSuenio()			|
	+-------------------------------+
	
	+-------------------------------+
	| (O) robocat					|
	+-------------------------------+
	|								|
	+-------------------------------+
	|	puedeAtrapar(quilombero)	|
	|	dormir()					|
	|	interrumpirSuenio()			|
	|	limpiar()					|
	+-------------------------------+
	
	+-------------------------------+
	| (O) spike						|
	+-------------------------------+
	|	enfado						|
	+-------------------------------+
	|	puedeAtrapar(quilombero)	|
	|	estaEnfadado()				|
	|	enfadar(cantidad)			|
	|	dormir()					|
	|	interrumpirSuenio()			|
	|	limpiar()					|
	|	ensuciar()					|
	+-------------------------------+

================================================================*/