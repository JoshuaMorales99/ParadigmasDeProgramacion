import Empresas.*

/*===================================================
 PUESTOS DE CONTROL.
===================================================*/
object rutatlantica {
	// Generar importe por pasar.
	method generarImporte(camion) = 7000 + 100 * camion.pesoCarga().div(1000)
	
	// Cobrar cargos al dejar pasar a camion.
	method cobrarCargos(monto) {
		pdepCargas.generarDeuda(monto)
	}
	// Dejar pasar camion.
	method dejarPasar(camion) {
		// Cobrar cargos.
		self.cobrarCargos(self.generarImporte(camion))
		// Hacer que el camion recorra 400km a 75km/h como velocidad maxima.
		camion.recorrer(400, 75)
	}
}