import Lugares.*

/*================================================================
🔸 Carrera.
================================================================*/
object carrera {
	// Vehiculos aceptados.
	const aceptados = []
	// Vehiculos rechazados.
	const rechazados = []
	// Lugar de la carrera.
	var property lugar = paris
	
	// Obtener el ganador de la carrera.
	method ganador() = aceptados.min{vehiculo => vehiculo.tiempo()}
	
	// Agregar competidor aceptado.
	method agregarAceptado(vehiculo) {
		aceptados.add(vehiculo)
	}
	
	// Agregar competidor rechazado.
	method agregarRechazado(vehiculo) {
		rechazados.add(vehiculo)
	}
	
	// Limpiar listas de aceptados y rechazados.
	method limpiarInscripciones() {
		aceptados.clear()
		rechazados.clear()
	}
	
	// Iniciar carrera (Los vehiculos aceptados viajan hasta el lugar de la carrera)
	method iniciarCarrera() {
		aceptados.forEach{vehiculo => vehiculo.viajar()}
	}
	
	// Obtener los corredores aceptados (Para test)
	method aceptados() = aceptados
	// Obtener los corredores rechazados (Para test)
	method rechazados() = rechazados
}

/*================================================================
🔸 Centro de inscripcion.
================================================================*/
object centroInscripcion {
	// Obtener todos los vehiculos anotados (aceptados y rechazados)
	method vehiculosAnotados() = carrera.aceptados() + carrera.rechazados()
	
	// Saber si un vehiculo dado puede competir (Puede visitar el lugar de la carrera)
	method puedeCompetir(vehiculo) = carrera.lugar().puedeVisitar(vehiculo)
	
	// Inscribir un vehiculo dado a la carrera (Si puede competir, se inscribe en aceptados. En contra parte, en rechazados)
	method inscribir(vehiculo) {
		if(self.puedeCompetir(vehiculo)) carrera.agregarAceptado(vehiculo) else carrera.agregarRechazado(vehiculo)
	}
	
	// Reinscribir los vehiculos anotados en la antigua carrera.
	method reinscribir(vehiculos) {
		// Limpiar la antigua inscripcion.
		carrera.limpiarInscripciones()
		// Reinscribir a todos los anotados (aceptados y rechazados) a la nueva carrera en el nuevo lugar.
		vehiculos.forEach{vehiculo => self.inscribir(vehiculo)}
	}
	
	// Replanificar carrera.
	method replanificarCarrera(nuevoLugar) {
		// Cambiar lugar de la carrera.
		carrera.lugar(nuevoLugar)
		// Reinscribir los vehiculos inscriptos en la antigua carrera.
		self.reinscribir(self.vehiculosAnotados())
	}
}