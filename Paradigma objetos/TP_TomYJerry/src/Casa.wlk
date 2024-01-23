import Cuidador.*
import Quilombero.*

/*================================================================
🔸 Casa de Tom y Jerry.
================================================================*/
object casa {
	// Cuidador de la caso (Siempre tiene uno)
	var cuidador = tom
	// Quilombero (A veces hay uno)
	var quilombero
	// Nivel de suciedad.
	var nivelSuciedad = 0
	
	// Obtener el nivel de suciedad (Para test)
	method nivelSuciedad() = nivelSuciedad
	// Obtener al quilombero (Para test)
	method quilombero() = quilombero
	
	// Saber si hay quilombero en el lugar.
	method hayQuilombero() = quilombero != null
	
	// Establecer cuidador.
	method cuidador(nuevoCuidador) {
		cuidador = nuevoCuidador
	}
	
	// Establecer quilombero.
	method quilombero(nuevoQuilombero) {
		quilombero = nuevoQuilombero
	}
	
	// Intentar sacar al quilombero.
	method intentarSacarQuilombero() {
		// Solo si lo puede atrapar (Si hay quilombero y el cuidador puede atraparlo)
		if(self.hayQuilombero() && cuidador.puedeAtrapar(quilombero)) quilombero = null
	}
	
	// Limpiar una cantidad dada de suciedad.
	method limpiarSuciedad(cantidad) {
		nivelSuciedad = 0.max(nivelSuciedad - cantidad)
	}
	
	// Limpieza completa (Reducir el valor de la suciedad a 0)
	method limpiezaCompleta() {
		nivelSuciedad = 0
	}
	
	// Ensuciar dado un nivel de sucidad.
	method ensuciar(suciedad) {
		nivelSuciedad = nivelSuciedad + suciedad
	}
	
	// Hacer ruido (Interrumpir suenio del cuidador)
	method hacerRuido() {
		cuidador.interrumpirSuenio()
	}
	
	// PUNTO 1: Pasar el dia.
	method pasarDia() {
		// El cuidador limpia la casa.
		cuidador.limpiar()
		// Intenta sacar al quilombero 
		self.intentarSacarQuilombero()
	}
	
	// PUNTO 2: Pasar las noches.
	method pasarNoche() {
		// El cuidador duerme.
		cuidador.dormir()
		// El quilombero hace quilombo.
		quilombero.hacerQuilombo()
	}
}

/*================================================================
🔸 PUNTO 8: Interfaz.
==================================================================
Excluyendo los metodos que son solamente para los test, la interfaz
seria la siguiente:

	+-------------------------------+
	| (O) casa						|
	+-------------------------------+
	|	cuidador					|
	|	quilombero					|
	|	nivelSuciedad				|
	+-------------------------------+
	|	hayQuilombero()				|
	|	cuidador(nuevoCuidador)		|
	|	quilombero(nuevoQuilombero)	|
	|	intentarSacarQuilombero()	|
	|	limpiarSuciedad(cantidad)	|
	|	limpiezaCompleta()			|
	|	ensuciar(suciedad)			|
	|	hacerRuido()				|
	|	pasarDia()					|
	|	pasarNoche()				|
	+-------------------------------+

================================================================*/