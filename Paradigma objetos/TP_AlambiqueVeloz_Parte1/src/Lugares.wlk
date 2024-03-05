import Vehiculos.*

/*================================================================
🔸 Lugares.
================================================================*/
object paris {
	// Obtener el recuerdo del lugar.
	method recuerdo() = "Llavero de la Torre Eiffel"
	
	// Saber si el vehiculo dado puede visitar el lugar (Debe poder desplazarse)
	method puedeVisitar(vehiculo) = vehiculo.puedeDesplazarse()
}

object buenosAires {
	// Presidente actual (Mafalda como presidente predeterminado)
	var presidente = "Mafalda"
	
	// Obtener el recuerdo del lugar (Dependiendo del presidente actual, incluye yerba o no)
	method recuerdo() = if(self.incluirYerba()) "Mate con yerba" else "Mate sin yerba"

	// Saber si el mate incluye yerba (Cantidad de letras impar en el nombre del presidente)
	method incluirYerba() = presidente.size().odd()
	// Saber si el vehiculo dado puede visitar el lugar (Debe ser rápido)
	method puedeVisitar(vehiculo) = vehiculo.rapido()
	
	// Establecer un nuevo presidente (Para test)
	method presidente(nuevoPresidente) {
		presidente = nuevoPresidente
	}
}

object bagdad {
	// Recuerdo del lugar (Una bomba nuclear como predeterminado)
	var property recuerdo = "Bomba nuclear"
	
	// Saber si el vehiculo dado puede visitar el lugar (No hay restricciones)
	method puedeVisitar(vehiculo) = true
	
	// Establecer el recuerdo del lugar.
	method recuerdo(nuevoRecuerdo) {
		recuerdo = nuevoRecuerdo
	}
}

object lasVegas {
	// Homenaje actual a otro pais (paris como homenaje predeterminado)
	var homenaje = paris
	
	// Obtener el recuerdo del lugar (El recuerdo sera el mismo que el del pais homenajeando)
	method recuerdo() = homenaje.recuerdo()
	
	// Saber si el vehiculo dado puede visitar el lugar (Misma restricción del lugar que se este homenajeando)
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
	
	// Saber si hay muchos dinosaurio (Cantidad de dinosaurios es mayor a 10)
	method hayMuchosDinosaurios() = cantDinosaurios > 10
	// Saber si el vehiculo dado puede visitar el lugar (Cantidad par de dinosaurios)
	method puedeVisitar(vehiculo) = cantDinosaurios.even()
	
	// Agregar un numero de dinosaurios al lugar (Para test)
	method agregarDinosaurios(nroDinosaurios) {
		cantDinosaurios = cantDinosaurios + nroDinosaurios
	}
}