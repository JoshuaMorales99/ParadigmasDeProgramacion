/*================================================================
🔸 Personajes.
================================================================*/
object luke {
	// Recuerdo del ultimo visitado.
	var recuerdo = ""
	// Cantidad de lugares visitados.
	var cantLugaresVisitados = 0
	
	// Incrementar la cantidad de lugares visitados.
	method incrementarLugaresVisitados() {
		cantLugaresVisitados = cantLugaresVisitados + 1
	}
	
	// Guardar el recuerdo de un lugar dado.
	method guardarRecuerdoDe(lugar) {
		recuerdo = lugar.recuerdo()
	}
	
	// Ir a un lugar si puede visitarlo con un vehiculo dado.
	method irA(destino, vehiculo) {
		if(destino.puedeVisitar(vehiculo)) {
			// Viajar.
			vehiculo.viajar()
			// Incrementamos los lugares visitados.
			self.incrementarLugaresVisitados()
			// Guardar el recuerdo del lugar.
			self.guardarRecuerdoDe(destino)
		}
	}
	
	// Obtener el recuerdo que se trajo del ultimo viaje (Para test)
	method recuerdo() = recuerdo
	// Obtener la cantidad de lugares visitados (Para test)
	method cantLugaresVisitados() = cantLugaresVisitados
}