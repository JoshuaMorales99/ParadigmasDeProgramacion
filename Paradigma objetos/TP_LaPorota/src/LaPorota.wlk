// ---------------------------------------------------------
// 🔸 La porota.
// ---------------------------------------------------------
object laPorota {
	// Stock de porotos por gramos.
	var stock = 10000
	// Dinero disponible.
	var dinero = 0
	
	// Obtener el precio por gramos de porotos.
	method precio() = 100
	// Obtener el monto total de una venta.
	method montoTotal(cantidad) = cantidad * self.precio()
	
	// Saber si el stock puede satisfacer una cantidad dada.
	method puedeSatisfacer(cantidad) = stock >= cantidad
	
	// Verificar disponibilidad de stock.
	method verificarStock(cantidad) {
		if(not self.puedeSatisfacer(cantidad)) throw new Exception(message = "No hay stock suficiente!")
	}
	
	// Aumentar dinero.
	method aumentarDinero(monto) {
		dinero = dinero + monto
	}
	
	// Disminuir stock en una cantidad dada.
	method disminuirStock(cantidad) {
		stock = stock - cantidad
	}
	
	// Recibir una transaccion del cliente.
	method recibirTransaccion(monto, cliente) {
		// Descontar el monto total de la compra al cliente.
		cliente.pagar(monto)
		// Recibir el monto total de la compra.
		self.aumentarDinero(monto)
	}
	
	// Entregar la cantidad de porotos al cliente.
	method entregarPorotos(cantidad, cliente) {
		// Disminuir stock en la cantidad dada.
		self.disminuirStock(cantidad)
		// Entregar la cantidad de porotos solicitada al cliente.
		cliente.recibirPorotos(cantidad)
	}
	
	// Vender una cantidad dada de porotos a un cliente.
	method vender(cantidad, cliente) {
		// Verificar disponibilidad de stock.
		self.verificarStock(cantidad)
		// Realizar transaccion del monto total.
		self.recibirTransaccion(self.montoTotal(cantidad), cliente)
		// Entregar la cantidad de porotos al cliente.
		self.entregarPorotos(cantidad, cliente)
	}
	
	// Obtener el dinero disponible (Para test)
	method dinero() = dinero
	// Obtener el stock de porotos por gramos (Para test)
	method stock() = stock
}