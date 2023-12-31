// ----------------------------------------------------------------
// 🔸 Packs.
// ----------------------------------------------------------------
// Clase abstracta para los distintos packs disponibles.
class Pack {
	// Tipo de vencimiento (Ilimitado o Vencimiento)
	const tipoVencimiento
	
	// Saber si se cubre el consumo dado.
	method cubre(consumo) = self.puedeCubrirElTipo(consumo)
	// Saber si se puede cubrir el tipo de consumo dado.
	method puedeCubrirElTipo(consumo)
	// Saber si esta en fecha (No vencido)
	method estaEnFecha() = tipoVencimiento.estaEnFecha()
	// Saber si esta totalmente gastado.
	method estaTotalmenteGastado()
	// Saber si se puede eliminar (Esta vencido o totalmente gastado)
	method sePuedeEliminar() = not self.estaEnFecha() or self.estaTotalmenteGastado()
	
	// PUNTO 3: Saber si se puede utilizar en un consumo dado (Esta en fecha y cubre el consumo dado)
	method satisface(consumo) = self.estaEnFecha() and self.cubre(consumo)
}

// ----------------------------------------------------------------
// 🔸 Tipo de Packs.
// ----------------------------------------------------------------

// Clase abstracta para los distintos packs consumibles.
class PackConsumible inherits Pack {
	// Cantidad disponible a consumir.
	var cantidad
	
	// Obtener la cantidad a consumir dependiendo de un consumo.
	method cantAConsumir(consumo)
	// Obtener la cantidad restante (Para test)
	method cantidad() = cantidad
	// Obtener la cantidad limite posible a consumir.
	method limiteAConsumir() = cantidad
	
	// Saber si se cubre el consumo dado (Se puede cubrir el tipo del consumo y se puede cubrir la cantidad del consumo)
	override method cubre(consumo) = super(consumo) and self.puedeCubrirLaCantidad(consumo)
	// Saber si se puede cubrir la cantidad del consumo dado.
	method puedeCubrirLaCantidad(consumo) = self.cantAConsumir(consumo) <= self.limiteAConsumir()
	// Saber si esta totalmente gastado.
	override method estaTotalmenteGastado() = cantidad == 0
	
	// Gastar pack (Disminuir la cantidad a consumir)
	method gastar(consumo) {
		cantidad = cantidad - self.cantAConsumir(consumo)
	}
}

// Clase abstracta para los distintos packs ilimitados.
class PackIlimitado inherits Pack(tipoVencimiento = ilimitado) {
	// Dias de la semana validos para su uso.
	const diasSemanas
	
	// Saber si se cubre el consumo dado (Se puede cubrir el tipo del consumo y puede usarse en el dia actual)
	override method cubre(consumo) = super(consumo) and self.esDiaSemanaValido(new Date().dayOfWeek())
	// Saber si se puede usar en el dia actual.
	method esDiaSemanaValido(diaSemana) = diasSemanas.contains(diaSemana)
	// Saber si esta totalmente gastado.
	override method estaTotalmenteGastado() = false
	
	// Gastar pack de la linea.
	method gastar(consumo) {
		// Al ser Ilimitado no se puede gastar.
	}
}

// ----------------------------------------------------------------
// 🔸 Packs Disponibles.
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

// PUNTO 7.b: Molde para el pack de una cantidad de MB libres ++ para navegar por internet.
class InternetLibrePlusPlus inherits InternetLibre {
	// Obtener la cantidad limite posible a consumir (Si esta gastado, se  puede consumir hasta 0.1 MB. En caso contrario, la cantidad disponible a consumir)
	override method limiteAConsumir() = if(self.estaTotalmenteGastado()) 0.1 else super()
	
	// Gastar pack (Si no esta gastado, disminuir la cantidad a consumir. En caso contrario, no hace nada)
	override method gastar(consumo) {
		if(not self.estaTotalmenteGastado()) super(consumo)
	}
}

// Molde para el pack de una cantidad de segundos libres de llamadas.
class LlamadaLibre inherits PackConsumible {
	// Obtener la cantidad a consumir dependiendo del consumo dado.
	override method cantAConsumir(consumo) = consumo.cantSegundos()
	
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Llamada)
	override method puedeCubrirElTipo(consumo) = consumo.esDeLlamada()
}

// Clase abstracta para el Internet Ilimitado.
class InternetIlimitado inherits PackIlimitado {
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Internet)
	override method puedeCubrirElTipo(consumo) = consumo.esDeInternet()
}

object llamadasGratis inherits PackIlimitado(diasSemanas = []) {
	// Saber si se puede cubrir el tipo de consumo dado (Cubre solamente Llamadas)
	override method puedeCubrirElTipo(consumo) = consumo.esDeLlamada()
	
	// Saber si se puede usar en un dia de la semana dado (En cualquier dia)
	override method esDiaSemanaValido(diaSemana) = true
}

// ----------------------------------------------------------------
// 🔸 Vigencia de los Packs.
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

// ----------------------------------------------------------------
// 🔸 PUNTO 10.a: Teorico.
// ----------------------------------------------------------------
/* Describir y justificar qué es lo mínimo necesario que hay que hacer para agregar un nuevo pack.

Para agregar un nuevo pack, se debe respetar el polimorfismo (misma interfaz, distintos comportamientos) que tienen estos.
	* Para packs que heredan de PackConsumibles:
	* Metodos obligatorios a agregar:
	* 	- puedeCubrirElTipo(consumo)
	* 	- cantAConsumir(consumo)
	* Metodos que se pueden sobrescribir:
	* 	- Todos los metodos de la clase abstracta.

	* Para packs que heredan de PackIlimitados:
	* Metodos obligatorios a agregar:
	* 	- puedeCubrirElTipo(consumo)
	* 	- esDiaSemanaValido(diaSemana)
	* Metodos que se pueden sobrescribir:
	* 	- Todos los metodos de la clase abstracta.

	* Para packs que heredan de Pack:
	* Metodos obligatorios a agregar:
	* 	- puedeCubrirElTipo(consumo)
	* 	- estaTotalmenteGastado()
	* 	- cubre(consumo)
	* 	- gastar()
	* Metodos que se pueden sobrescribir:
	* 	- Todos los metodos de la clase abstracta.

	* Para packs que no heredan de ninguna de las anteriores:
	* Metodos obligatorios a agregar:
	* 	- estaEnFecha()
	* 	- satisface(consumo)

*/