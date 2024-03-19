// ---------------------------------------------------------
// 🔸 La porota.
// ---------------------------------------------------------
// Molde para los clientes.
class Cliente {
	// Medio de pago.
	var medioPago
	// Cantidad de porotos.
	var cantidadPorotos = 0
	
	// Establecer un nuevo medio de pago.
	method medioPago(nuevoMedioPago) {
		medioPago = nuevoMedioPago
	}
	
	// Pagar un monto dada con el medio de pago actual.
	method pagar(monto) {
		medioPago.usar(monto)
	}
	
	// Recibir cantidad de porotos.
	method recibirPorotos(cantidad) {
		cantidadPorotos = cantidadPorotos + cantidad
	}
	
	// Obtener la cantidad de porotos.
	method cantidadPorotos() = cantidadPorotos
}