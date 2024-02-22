import Vehiculos.*

/*================================================================
🔸 Lugares.
================================================================*/
object paris {
	// Obtener el recuerdo del lugar.
	method recuerdo() = "Llavero de la Torre Eiffel"
	// Requisito para visita (El vehiculo debe poder desplazarse) TODO test
	method puedeVisitar(vehiculo) = vehiculo.puedeDesplazarse()
}

object buenosAires {
	// Presidente actual (Mafalda como presidente predeterminado)
	var presidente = "Mafalda"
	
	// Obtener el recuerdo del lugar (Dependiendo del presidente actual, incluye yerba o no)
	method recuerdo() = if(self.incluirYerba()) "Mate con yerba" else "Mate sin yerba"

	// Saber si el mate incluye yerba (Cantidad de letras impar en el nombre del presidente)
	method incluirYerba() = presidente.size().odd()
	// Requisito para visita (El vehículo tiene que ser rápido) TODO test
	method puedeVisitar(vehiculo) = vehiculo.rapido()
	
	// Establecer un nuevo presidente (Para test)
	method presidente(nuevoPresidente) {
		presidente = nuevoPresidente
	}
}

object bagdad {
	// Recuerdo del lugar (Una bomba nuclear como predeterminado)
	var property recuerdo = "Bomba nuclear"
	
	// Requisito para visita (No hay restricciones) TODO test
	method puedeVisitar(vehiculo) = true
}

object lasVegas {
	// Homenaje actual a otro pais (paris como homenaje predeterminado)
	var homenaje = paris
	
	// Obtener el recuerdo del lugar (El recuerdo sera el mismo que el del pais homenajeando)
	method recuerdo() = homenaje.recuerdo()
	
	// Requisito para visita (Misma restricción del lugar que se este homenajeando) TODO test
	method puedeVisitar(vehiculo) = homenaje.puedeVisitar(vehiculo)
	
	// Establecer el homenaje del lugar (Para test)
	method homenaje(nuevoHomenaje) {
		homenaje = nuevoHomenaje
	}
}

object jurassicPark {
	// Cantidad de dinosaurios en el lugar.
	var cantDinosaurios = 10
	
	// Obtener el recuerdo del lugar (Si hay muchos dinosaurios, se lleva una pluma de raptor, sino, una foto recuerdo)
	method recuerdo() = if(self.hayMuchosDinosaurios()) "Pluma de velociraptor" else "Foto recuerdo"
	
	// Saber si hay muchos dinosaurio (Cantidad de dinosaurios es mayor a 10) TODO test
	method hayMuchosDinosaurios() = cantDinosaurios > 10
	// Requisito para visita (Cantidad par de dinosaurios) TODO test
	method puedeVisitar(vehiculo) = cantDinosaurios.even()
	
	// Agregar un numero de dinosaurios al lugar (Para test)
	method agregarDinosaurios(nroDinosaurios) {
		cantDinosaurios = cantDinosaurios + nroDinosaurios
	}
}