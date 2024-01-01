/*===================================================
🔸 EMPRESA PDEP CARGAS.
===================================================*/

object pdepCargas {
	// Monto total de las deudas pendientes (Inicialmente 0)
	var deudaTotal = 0
	
	// Obtener la deuda total pendiente (Para test)
	method deudaTotal() = deudaTotal
	
	// Sumar deuda generada al total.
	method generarDeuda(monto) {
		deudaTotal = deudaTotal + monto
	}
}