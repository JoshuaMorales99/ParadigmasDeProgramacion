import Cuidador.*
import Quilombero.*

/*================================================================
 CASA.
================================================================*/
object casa {
	// Siempre tiene un cuidador.
	var cuidador = tom
	// A veces hay un quilombero.
	var quilombero
	// Nivel de suciedad.
	var nivelSuciedad = 0
	
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
	// Intentar sacar al quilombero (Solo si hay quilombero y el cuidador puede atraparlo)
	method intentarSacarQuilombero() {
		// Solo si lo puede atrapar.
		if(self.hayQuilombero() && cuidador.puedeAtrapar(quilombero)) quilombero = null
	}
	// Limpiar la suciedad (Reducir el valor de la suciedad)
	method limpiarSuciedad(valor) {
		nivelSuciedad = 0.max(nivelSuciedad - valor)
	}
	// Limpieza completa (Reducir el valor de la suciedad a 0)
	method limpiezaCompleta() {
		self.limpiarSuciedad(nivelSuciedad)
	}
	// Ensuciar casa (Aumentar el valor de la suciedad)
	method ensuciar(valor) {
		nivelSuciedad += valor
	}
	// Hacer ruido (Interrumpir suenio del cuidador)
	method hacerRuido() {
		cuidador.interrumpirSuenio()
	}
	// Pasar los dias. // TODO Falta test
	method pasarDia() {
		// El cuidador limpia la casa.
		cuidador.limpiar()
		// Intenta sacar al quilombero 
		self.intentarSacarQuilombero()
	}
	// Pasar las noches. // TODO Falta test
	method pasarNoche() {
		// El cuidador duerme.
		cuidador.dormir()
		// El quilombero hace quilombo.
		quilombero.hacerQuilombo()
	}
	
	// Para test ===========================================
	method nivelSuciedad() = nivelSuciedad
	method quilombero() = quilombero
}