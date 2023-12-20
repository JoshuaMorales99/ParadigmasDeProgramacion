import Compania.*

// ----------------------------------------------------------------
// 🔸 Consumos.
// ----------------------------------------------------------------
// Molde para los consumos de llamadas.
class ConsumoLlamada {
	// Cantidad de segundos consumidos.
	const cantSegundos
	
	// Obtener los segundos restantes luego de los primeros 30 segundos de llamada.
	method segundosRestantes() = 0.max(cantSegundos - 30)
	// Obtener el costo de los segundos restantes.
	method costoRestante() = self.segundosRestantes() * pdepfoni.precioSegundos()
	
	// PUNTO 1: Obtener el costo del consumo realizado.
	method costo() = pdepfoni.precioFijo() + self.costoRestante()
	
}

// Molde para los consumos de internet.
class ConsumoInternet {
	// Cantidad de MB consumidos.
	const cantMB
	
	// PUNTO 1: Obtener el costo del consumo realizado.
	method costo() = cantMB * pdepfoni.precioMB()
	
}