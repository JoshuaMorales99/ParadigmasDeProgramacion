// ----------------------------------------------------------------
// 🔸 Lineas Telefonicas.
// ----------------------------------------------------------------
// Molde para las lineas telefonicas (Celulares).
class LineaTelefonica {
	// Numero de telefono.
	const property telefono
	// Historial de packs activos (Property para test)
	const property packs = []
	// Historial de consumos realizados (Property para test)
	const property consumos = []
	// Tipo de linea telefonica (comun, black o platinum)
	var tipoLinea
	// Deuda.
	var deuda = 0
	
	// Obtener la cantidad de consumos realizados.
	method cantConsumos() = consumos.size()
	// Obtener los consumos realizados entre dos fechas dadas.
	method consumosEntre(fechaMin, fechaMax) = consumos.filter{consumo => consumo.entreFechas(fechaMin, fechaMax)}
	// Obtener el costo total de los consumos realizados entre dos fechas dadas.
	method costoTotalEntre(fechaMin, fechaMax) = self.consumosEntre(fechaMin, fechaMax).sum{consumo => consumo.costo()}
	// Obtener el ultimo pack agregado a la linea que satisface un consumo dado.
	method ultimoPackQueSatisface(consumo) = packs.reverse().find{pack => pack.satisface(consumo)}
	// Obtener la deuda (Para test)
	method deuda() = deuda
	
	// Consumir el ultimo pack agregado que satisface un consumo dado.
	method consumirPack(consumo) {
		self.ultimoPackQueSatisface(consumo).gastar(consumo)
	}
	
	// Accion al poder realizar un consumo.
	method puedeRealizarConsumo(consumo) {
		// Consumir el ultimo pack agregado que satisface un consumo dado.
		self.consumirPack(consumo)
		// Agregar el consumo al historial.
		self.agregarConsumo(consumo)
	}
	
	// Agregar un pack a la linea telefonica.
	method agregarPack(pack) {
		packs.add(pack)
	}
	
	// Agregar un consumo a la linea telefonica.
	method agregarConsumo(consumo) {
		consumos.add(consumo)
	}
	
	// Sumar una cantidad a la deuda.
	method sumarDeuda(cantidad) {
		deuda = deuda + cantidad
	}
	
	// PUNTO 2.a: Obtener el costo promedio de todos los consumos realizados entre dos fechas dadas.
	method costoPromedioEntre(fechaMin, fechaMax) = self.costoTotalEntre(fechaMin, fechaMax) / self.cantConsumos()
	// PUNTO 2.b: Obtener el costo total de los consumos realizados en los ultimos 30 dias.
	method ultimosCostosTotales() = self.costoTotalEntre(new Date().minusDays(30) , new Date())
	
	// PUNTO 5: Saber si se puede hacer cierto consumo dado (Cuando el consumo se puede satisfacer completamente por un pack)
	method puedeRealizar(consumo) = packs.any{pack => pack.satisface(consumo)}
	
	// PUNTO 6: Realizar consumo.
	method realizar(consumo) {
		// Verificar si se pueda realizar un consumo dado.
		if(self.puedeRealizar(consumo)) self.puedeRealizarConsumo(consumo) else tipoLinea.noPuedeRealizarConsumo(self, consumo)
	}
	
	// PUNTO 7.a: Realizar una limpieza de los packs vencidos y/o gastados.
	method limpiarPacks() {
		packs.removeAllSuchThat{pack => pack.sePuedeEliminar()}
	}
	
	// PUNTO 8: Cambiar el tipo de Linea.
	method tipoLinea(nuevoTipo) {
		tipoLinea = nuevoTipo
	}
}

// ----------------------------------------------------------------
// 🔸 PUNTO 8: Tipo de Lineas Telefonicas.
// ----------------------------------------------------------------

object comun {
	// Accion al no poder realizar el consumo (Lanzar excepcion)
	method noPuedeRealizarConsumo(linea, consumo) {
		throw new Exception(message = "Los packs de la línea no cubren el consumo")
	}
}

object black {
	// Accion al no poder realizar el consumo (Suma a la deuda el costo del consumo)
	method noPuedeRealizarConsumo(linea, consumo) {
		linea.sumarDeuda(consumo.costo())
	}
}

object platinum {
	// Accion al no poder realizar el consumo (No lanza excepcion y no suma deuda)
	method noPuedeRealizarConsumo(linea, consumo) {
		
	}
}