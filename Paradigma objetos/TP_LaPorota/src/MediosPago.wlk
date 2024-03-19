// ---------------------------------------------------------
// 🔸 Medios de pago.
// ---------------------------------------------------------
// Molde para las tarjetas de credito.
class TarjetaCredito {
	// Deuda de la tarjeta.
	var deuda
	
	// Aumentar deuda.
	method aumentarDeuda(monto) {
		deuda = deuda + monto
	}
	
	// Usar la tarjeta de credito (Aumenta la deuda en base al monto)
	method usar(monto) {
		self.aumentarDeuda(monto)
	}
	
	// Obtener la deuda de la tajeta (Para test)
	method deuda() = deuda
}

// Molde para las tarjetas de debito.
class TarjetaDebito {
	// Saldo disponible en la tarjeta.
	var saldo
	
	// Saber si el saldo puede satisfacer un monto dado (Saldo igual o mayor al monto dado)
	method puedeSatisfacer(monto) = saldo >= monto
	
	// Verificar que se pueda descontar el monto dado del saldo disponible.
	method verificarSaldo(monto) {
		if(not self.puedeSatisfacer(monto)) throw new Exception(message = "Saldo insuficiente!")
	}
	
	// Descontar el monto del saldo disponible.
	method descontarSaldo(monto) {
		saldo = saldo - monto
	}
	
	// Usar la tarjeta de debito (Descuenta el saldo disponible en la tarjeta)
	method usar(monto) {
		// Verificar que se pueda descontar el monto dado del saldo disponible.
		self.verificarSaldo(monto)
		// Descontar el monto dado del saldo disponible.
		self.descontarSaldo(monto)
	}
	
	// Obtener el saldo disponible en la tarjeta.
	method saldo() = saldo
}

// Molde para los cupones.
class Cupon {
	// Monto maximo del cupon.
	const montoMaximo
	// Esta usado.
	var estaUsado = false
	
	// Saber si el cupon esta usado.
	method estaUsado() = estaUsado
	// Saber si el monto maximo puede satisfacer el monto dado (Monto maximo es igual o mayor al monto dada)
	method puedeSatisfacer(monto) = montoMaximo >= monto
	
	// Verificar que se pueda usar con el monto dada.
	method verificarUso(monto) {
		if(self.estaUsado()) throw new Exception(message = "Cupon ya usado!")
		if(not self.puedeSatisfacer(monto)) throw new Exception(message = "Monto maximo insuficiente!")
	}
	
	// Usar el cupon.
	method usar(monto) {
		// Verificar que se pueda usar con el monto dada.
		self.verificarUso(monto)
		// Usar el cupon.
		estaUsado = true
	}
}