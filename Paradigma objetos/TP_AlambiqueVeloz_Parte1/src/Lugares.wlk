import Vehiculos.*

/*================================================================
🔸 Lugares.
================================================================*/
object paris {
	// Recuerdo del lugar.
	method recuerdo() = "Llavero de la Torre Eiffel"
	// Requisito para visita (El vehiculo debe poder desplazarse)
	method puedeVisitar(vehiculo) = vehiculo.puedeDesplazarse()
}

object buenosAires {
	// Presidente actual.
	var presidente = "Peron" // Peron como presidente por default.
	
	// Requisito para visita (El vehículo tiene que ser rápido)
	method puedeVisitar(vehiculo) = vehiculo.rapido()
	// Saber si el mate lleva yerba.
	method incluirYerba() = presidente.size().odd() // Cant. impar de letras en el nombre del presidente por default.
	
	// Establecer un nuevo presidente.
	method presidente(nuevoPresidente) {
		presidente = nuevoPresidente
	}
	
	// Recuerdo del lugar (Dependiendo del presidente actual, incluye yerba o no)
	method recuerdo() {
		// Si se cumple la condicion, el mate incluye yerba.
		if(self.incluirYerba()) return "Mate con yerba"
		// Si no se cumple la condicion, el mate no incluye yerba.
		return "Mate sin yerba"
	}
}

object bagdad {
	// Recuerdo del lugar (Cambia con los años)
	var property recuerdo = "Bomba nuclear" // "Bomba nuclear" como recuerdo por default.
	
	// Requisito para visita (No hay restricciones)
	method puedeVisitar(vehiculo) = true
}

object lasVegas {
	// Homenaje actual a otro pais.
	var homenaje = paris // paris como homenaje por default.
	
	// Recuerdo del lugar (El recuerdo sera el mismo que el del pais homenajeando)
	method recuerdo() = homenaje.recuerdo()
	// Requisito para visita (Misma restricción del lugar que se este homenajeando)
	method puedeVisitar(vehiculo) = homenaje.puedeVisitar(vehiculo)
	
	// Establecer el homenaje del lugar.
	method homenaje(nuevoHomenaje) {
		homenaje = nuevoHomenaje
	}
}

object jurassicPark {
	// Cantidad de dinosaurios en el lugar.
	var cantDinosaurios = 10
	
	// Requisito para visita (Cantidad par de dinosaurios)
	method puedeVisitar(vehiculo) = cantDinosaurios.even()
	// Saber si hay como minimo una cantidad determinada de dinosaurios.
	method hayDinosaurios(nroDinosaurios) = cantDinosaurios >= nroDinosaurios
	// Saber si se puede entregar un dinosaurio (Si hay mas de 50 dinosaurios en el lugar)
	method darDinosaurio() = self.hayDinosaurios(51)
	
	// Agregar un numero de dinosaurios al lugar.
	method agregarDinosaurios(nroDinosaurios) {
		cantDinosaurios += nroDinosaurios
	}
	// Quitar un numero de dinosaurios del lugar.
	method quitarDinosaurio(nroDinosaurios) {
		cantDinosaurios -= nroDinosaurios
	}
	
	// Recuerdo del lugar (Dependiendo de la cant. de dinosaurios, se entrega uno de recuerdo o una foto recuerdo)
	method recuerdo() {
		// Si se cumple la condicion, se lleva un dinosaurio.
		if(self.darDinosaurio()) {
			// Dar dinosaurio como recuerdo.
			self.quitarDinosaurio(1)
			return "Dinosaurio"
		}
		// Si no se cumple la condicion, se lleva una foto recuerdo.
		return "Foto recuerdo"
	}
}