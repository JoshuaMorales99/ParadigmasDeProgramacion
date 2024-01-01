import Casa.*

/*================================================================
 CUIDADOR.
================================================================*/
object tom {
	// Tiene una cierta cantidad de energia.
	var energia = 0
	
	// Saber su velocidad (5 + energia / 10)
	method velocidad() = 5 + energia / 10
	// Saber si puede atrapar al quilombero (Su velocidad es superior al del quilombero)
	method puedeAtrapar(quilombero) = self.velocidad() > quilombero.velocidad()
	
	// Limpiar el lugar.
	method limpiar() {
		// Realizar limpieza con valor de 100.
		casa.limpiarSuciedad(100)
		// Pierde 40 de energia.
		self.gastarEnergia(40)
	}
	// Gastar cierta cantidad de energia.
	method gastarEnergia(valor) {
		energia = 0.max(energia - valor)
	}
	// Cargar cierta cantidad de energia.
	method cargarEnergia(valor) {
		energia += valor
	}
	// Dormir (Incrementa su energia en 50)
	method dormir() {
		self.cargarEnergia(50)
	}
	// Interrumpir suenio (Pierde 20 de energia)
	method interrumpirSuenio() {
		self.gastarEnergia(20)
	}
	
	// Para test ===========================================
	method energia(nuevaEnergia) {energia = nuevaEnergia}
	method energia() = energia
}

object robocat {
	// Siempre puede atrapar al quilombero.
	method puedeAtrapar(quilombero) = true
	// Al dormir, simplemente se apaga.
	method dormir() {}
	// Interrumpir suenio (No se puede interrumpir)
	method interrumpirSuenio() {}
	
	// Al limpiar la casa, la deja totalmente limpia.
	method limpiar() {
		casa.limpiezaCompleta()
	}
}
