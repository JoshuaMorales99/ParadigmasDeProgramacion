// ----------------------------------------------------------------
// 🔸 Packs.
// ----------------------------------------------------------------
// Clase abstracta para los distintos packs disponibles.
class Pack {
	// Tipo de vencimiento (ilimitado o Vencimiento)
	const tipoVencimiento
	
	// Saber si se cubre el consumo dado.
	method cubre(consumo) = self.puedeCubrirElTipo(consumo)
	// Saber si se puede cubrir el tipo de consumo dado.
	method puedeCubrirElTipo(consumo)
	// Saber si esta en fecha (No vencido)
	method estaEnFecha() = tipoVencimiento.estaEnFecha()
	
	// PUNTO 3: Saber si se puede utilizar en un consumo dado (Esta en fecha y cubre el consumo dado)
	method satisface(consumo) = self.estaEnFecha() and self.cubre(consumo)
}

// Clase abstracta para los distintos packs consumibles.
class PackConsumible inherits Pack {
	// Cantidad disponible a consumir.
	var cantidad
	
	// Obtener la cantidad a consumir dependiendo de un consumo.
	method cantAConsumir(consumo)
	
	// Saber si se cubre el consumo dado (Se puede cubrir el tipo del consumo y se puede cubrir la cantidad del consumo)
	override method cubre(consumo) = super(consumo) and self.puedeCubrirLaCantidad(consumo)
	// Saber si se puede cubrir la cantidad del consumo dado.
	method puedeCubrirLaCantidad(consumo) = self.cantAConsumir(consumo) <= cantidad
}

// Clase abstracta para los distintos packs ilimitados.
class PackIlimitado inherits Pack {
	// Dias de la semana validos para su uso.
	const diasSemanas
	
	// Saber si se cubre el consumo dado (Se puede cubrir el tipo del consumo y puede usarse en el dia actual)
	override method cubre(consumo) = super(consumo) and self.esDiaSemanaValido(new Date().dayOfWeek())
	// Saber si se puede usar en el dia actual.
	method esDiaSemanaValido(diaSemana) = diasSemanas.contains(diaSemana)
}

// ----------------------------------------------------------------
// 🔸 Tipo de Packs.
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
class LlamadasGratis inherits PackIlimitado(diasSemanas = []) {
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Llamadas)
	override method puedeCubrirElTipo(consumo) = consumo.esDeLlamada()
	
	// Saber si se puede usar en un dia de la semana dado (En cualquier dia)
	override method esDiaSemanaValido(diaSemana) = true
}

// Molde para el pack de internet ilimitado los fines de semana.
class InternetIlimitadoFindes inherits PackIlimitado(diasSemanas = [saturday, sunday]) {
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Internet)
	override method puedeCubrirElTipo(consumo) = consumo.esDeInternet()
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
	
	// Saber si esta en fecha.
	method estaEnFecha() = new Date() <= fecha
}