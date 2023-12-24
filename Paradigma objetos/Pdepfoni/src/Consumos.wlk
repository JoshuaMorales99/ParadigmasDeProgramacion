import Compania.*

// ----------------------------------------------------------------
// 🔸 Consumos.
// ----------------------------------------------------------------
// Clase abstracta de consumos.
class Consumo {
	// Fecha de cuando se realizo el consumo.
	const fecha = new Date()
	
	// Saber si la fecha del consumo esta entre las fechas dadas.
	method entreFechas(fechaMin, fechaMax) = fecha.between(fechaMin, fechaMax)
	// Saber si es un consumo de tipo Llamada.
	method esDeLlamada() = false
	// Saber si es un consumo de tipo Internet.
	method esDeInternet() = false
}

// Molde para los consumos de llamadas.
class Llamada inherits Consumo {
	// Cantidad de segundos consumidos.
	const cantSegundos
	
	// Obtener los segundos restantes luego de los primeros 30 segundos de llamada.
	method segundosRestantes() = 0.max(cantSegundos - 30)
	// Obtener el costo de los segundos restantes.
	method costoRestante() = self.segundosRestantes() * pdepfoni.precioSegundos()
	// Obtener la cantidad de MB consumidos.
	method cantMB() = 0
	
	// Saber si es un consumo de tipo Llamada.
	override method esDeLlamada() = true
	
	// PUNTO 1: Obtener el costo del consumo realizado.
	method costo() = pdepfoni.precioFijo() + self.costoRestante()
}

// Molde para los consumos de internet.
class Internet inherits Consumo {
	// Cantidad de MB consumidos.
	const property cantMB
	
	// Saber si es un consumo de tipo Internet.
	override method esDeInternet() = true
	
	// PUNTO 1: Obtener el costo del consumo realizado.
	method costo() = cantMB * pdepfoni.precioMB()
	
}