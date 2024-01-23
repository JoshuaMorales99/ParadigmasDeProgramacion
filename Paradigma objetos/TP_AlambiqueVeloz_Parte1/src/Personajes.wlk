/*================================================================
🔸 Personajes.
================================================================*/
object luke {
	// Cuando viaja, se trae un recuerdo tipico del lugar visitado.
	var property recuerdo = ""
	// Cantidad de lugares visitados.
	var cantLugaresVisitados = 0
	
	// Obtener la cantidad de lugares visitados.
	method cantLugaresVisitados() = cantLugaresVisitados
	
	// Incrementar la cantidad de lugares visitados.
	method incrementarLugaresVisitados() {
		cantLugaresVisitados += 1
	}
	
	// Ir a un lugar si el vehiculo cumple con las restricciones.
	method irA(destino, vehiculo) {
		if(destino.puedeVisitar(vehiculo)) {
			// El vehiculo utilizado para el viaje, sufre consecuencias.
			vehiculo.viajar()
			// Incrementamos los lugares visitados.
			self.incrementarLugaresVisitados()
			// Obtener el recuerdo del lugar.
			recuerdo = destino.recuerdo()
		}
	}
}