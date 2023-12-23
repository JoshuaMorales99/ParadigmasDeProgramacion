// ----------------------------------------------------------------
// 🔸 Packs. TODO
// ----------------------------------------------------------------
// Clase abstracta para los diferentes packs disponibles.
class Pack {
	// Tipo de vencimiento (ilimitado o Vencimiento)
	const tipoVencimiento
	
	// Saber si se cubre el consumo dado.
	method cubre(consumo)
	
	// PUNTO 3: Saber si se puede utilizar en un consumo dado (Esta en fecha y cubre el consumo dado)
	method satisface(consumo) = tipoVencimiento.estaEnFecha() and self.cubre(consumo)
}

class PackConsumible inherits Pack {
	// Cantidad disponible a consumir.
	var cantidad
	
	// Obtener la cantidad a consumir dependiendo de un consumo.
	method cantAConsumir(consumo)
	
	// Saber si se cubre el consumo dado (Se puede cubrir el tipo del consumo y se puede cubrir la cantidad del consumo)
	override method cubre(consumo) = self.puedeCubrirElTipo(consumo) and self.puedeCubrirLaCantidad(consumo)
	// Saber si se puede cubrir el tipo de consumo dado.
	method puedeCubrirElTipo(consumo)
	// Saber si se puede cubrir la cantidad del consumo dado.
	method puedeCubrirLaCantidad(consumo) = self.cantAConsumir(consumo) <= cantidad
}

class PackIlimitado inherits Pack {
	
}

// ----------------------------------------------------------------
// 🔸 Tipo de Packs. TODO
// ----------------------------------------------------------------
// Molde para el pack de cierta cantidad de credito disponible.
class Credito inherits PackConsumible {
	// Obtener la cantidad a consumir dependiendo del consumo dado.
	override method cantAConsumir(consumo) = consumo.costo()
	
	// Saber se pack puede cubrir el tipo de consumo dado (Cubre cualquiera de los dos: Llamadas e Internet)
	// Se puede poner true, pero se opto por esta opcion para adaptarlo mejor al enunciado.
	override method puedeCubrirElTipo(consumo) = consumo.esDeLlamada() or consumo.esDeInternet()
}

// Molde para el pack de una cantidad de MB libres para navegar por internet.
class InternetLibre inherits PackConsumible {
	// Obtener la cantidad a consumir dependiendo del consumo dado.
	override method cantAConsumir(consumo) = consumo.cantMB()
	
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Internet)
	override method puedeCubrirElTipo(consumo) = consumo.esDeInternet()
}

// Molde para el pack de llamadas gratis.
class LlamadasGratis {
	
}

// Molde para el pack de internet ilimitado los fines de semana.
class InternetIlimitado {
	
}

// ----------------------------------------------------------------
// 🔸 Vigencia de los packs.
// ----------------------------------------------------------------

object ilimitado {
	// Saber si esta en fecha.
	method estaEnFecha() = true
}

// Molde para los vencimientos.
class Vencimiento {
	// Fecha de vencimiento.
	const fecha
	
	// Saber si esta en fecha. TODO
	method estaEnFecha() = new Date() <= fecha
}