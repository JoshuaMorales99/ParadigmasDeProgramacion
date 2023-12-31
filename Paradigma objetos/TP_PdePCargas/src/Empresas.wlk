/*===================================================
 EMPRESA PDEP CARGAS.
===================================================*/
object pdepCargas {
	// Monto total de las deudas pendientes.
	var deudaTotal = 0
	
	// Saber la deuda total pendiente.
	method deudaTotal() = deudaTotal
	
	// Sumar deuda generada al total.
	method generarDeuda(monto) {
		deudaTotal += monto
	}
}