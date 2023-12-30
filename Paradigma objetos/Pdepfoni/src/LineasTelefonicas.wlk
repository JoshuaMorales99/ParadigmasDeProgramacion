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
	
	// Obtener la cantidad de consumos realizados.
	method cantConsumos() = consumos.size()
	// Obtener los consumos realizados entre dos fechas dadas.
	method consumosEntre(fechaMin, fechaMax) = consumos.filter{consumo => consumo.entreFechas(fechaMin, fechaMax)}
	// Obtener el costo total de los consumos realizados entre dos fechas dadas.
	method costoTotalEntre(fechaMin, fechaMax) = self.consumosEntre(fechaMin, fechaMax).sum{consumo => consumo.costo()}
	// Obtener el ultimo pack agregado a la linea que satisface un consumo dado.
	method ultimoPackQueSatisface(consumo) = packs.reverse().find{pack => pack.satisface(consumo)}
	
	// Consumir el ultimo pack agregado que satisface un consumo dado.
	method consumirPack(consumo) {
		self.ultimoPackQueSatisface(consumo).gastar(consumo)
	}
	
	// Agregar un pack a la linea telefonica.
	method agregarPack(pack) {
		packs.add(pack)
	}
	
	// Agregar un consumo a la linea telefonica.
	method agregarConsumo(consumo) {
		consumos.add(consumo)
	}
	
	// PUNTO 2.a: Obtener el costo promedio de todos los consumos realizados entre dos fechas dadas.
	method costoPromedioEntre(fechaMin, fechaMax) = self.costoTotalEntre(fechaMin, fechaMax) / self.cantConsumos()
	// PUNTO 2.b: Obtener el costo total de los consumos realizados en los ultimos 30 dias.
	method ultimosCostosTotales() = self.costoTotalEntre(new Date().minusDays(30) , new Date())
	
	// PUNTO 5: Saber si se puede hacer cierto consumo dado (Cuando el consumo se puede satisfacer completamente por un pack)
	method puedeRealizar(consumo) = packs.any{pack => pack.satisface(consumo)}
	
	// PUNTO 6: Realizar consumo.
	method realizar(consumo) {
		// Verificar que se pueda realizar un consumo dado.
		self.verificarConsumo(consumo)
		
		// Consumir el ultimo pack agregado que satisface un consumo dado.
		self.consumirPack(consumo)
		// Agregar el consumo al historial.
		self.agregarConsumo(consumo)
	}
	
	// PUNTO 7.a: Realizar una limpieza de los packs vencidos y/o gastados.
	method limpiarPacks() {
		packs.removeAllSuchThat{pack => pack.sePuedeEliminar()}
	}
	
	// Verificar que se pueda realizar un consumo dado.
	method verificarConsumo(consumo) {
		if(not self.puedeRealizar(consumo)) throw new Exception(message = "No se puede realizar el consumo dado")
	}
}
