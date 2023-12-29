// ----------------------------------------------------------------
// 🔸 Lineas Telefonicas.
// ----------------------------------------------------------------
// Molde para las lineas telefonicas (Celulares).
class LineaTelefonica {
	// Numero de telefono.
	const property telefono
	// Packs activos.
	const packs = []
	// Consumos realizados.
	const consumos = []
	
	// Obtener la cantidad de consumos realizados.
	method cantConsumos() = consumos.size()
	// Obtener los consumos realizados entre dos fechas dadas.
	method consumosEntre(fechaMin, fechaMax) = consumos.filter{consumo => consumo.entreFechas(fechaMin, fechaMax)}
	// Obtener el costo total de los consumos realizados entre dos fechas dadas.
	method costoTotalEntre(fechaMin, fechaMax) = self.consumosEntre(fechaMin, fechaMax).sum{consumo => consumo.costo()}
	
	// Agregar un pack a la linea telefonica.
	method agregarPack(pack) {
		packs.add(pack)
	}
	
	// PUNTO 2.a: Obtener el costo promedio de todos los consumos realizados entre dos fechas dadas.
	method costoPromedioEntre(fechaMin, fechaMax) = self.costoTotalEntre(fechaMin, fechaMax) / self.cantConsumos()
	// PUNTO 2.b: Obtener el costo total de los consumos realizados en los ultimos 30 dias.
	method ultimosCostosTotales() = self.costoTotalEntre(new Date().minusDays(30) , new Date())
	
	// PUNTO 5: Saber si se puede hacer cierto consumo dado (Cuando el consumo se puede satisfacer completamente por un pack)
	method puedeRealizar(consumo) = packs.any{pack => pack.satisface(consumo)}
}
