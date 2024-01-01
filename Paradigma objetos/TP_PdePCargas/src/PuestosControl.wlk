/*===================================================
🔸 PUESTOS DE CONTROL.
===================================================*/

object rutatlantica {
	// Obtener importe por dejar pasar a un camion dado ($7000 por camion + un importe adicional)
	method generarImporte(camion) = 7000 + self.importeAdicional(camion)
	// Obtener importe adicional dado el camion ($100 por cada 1000 kg de carga que lleva el camion)
	method importeAdicional(camion) = 100 * camion.pesoCarga().div(1000)
	
	// Cobrarle a una empresa dada, un monto dado por dejar pasar a su camion.
	method cobrarCargosA(empresa, monto) {
		empresa.generarDeuda(monto)
	}
	
	// Dejar pasar a un camion dado.
	method dejarPasar(camion) {
		// Cobrar cargos a la empresa del camion.
		self.cobrarCargosA(camion.empresa(), self.generarImporte(camion))
		// Hacer que el camion recorra 400 km a 75 km/h como velocidad maxima.
		camion.recorrer(400, 75)
	}
}