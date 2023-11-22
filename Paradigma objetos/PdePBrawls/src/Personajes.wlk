// --------------------------------------------------
// 🔸 Personajes.
// --------------------------------------------------
// Clase abstracta para los distintos tipos de personajes.
class Personaje {
	// Cantidad de copas obtenidas.
	var cantCopas = 0
	
	// Ganar una cantidad de copas dada.
	method ganarCopas(cantidad) {
		cantCopas = cantCopas + cantidad
	}
	
	// Perder una cantidad de copas dada.
	method perderCopas(cantidad) {
		cantCopas = 0.max(cantCopas - cantidad)
	}
}

// Molde para los arqueros.
class Arquero inherits Personaje {
	// Agilidad del personaje.
	var agilidad // TODO var ???
	// Rango del personaje (En metros)
	var rango // TODO var ???
	
	// Calcular la destreza del personaje.
	method destreza() = agilidad * rango
	
	// Saber si el personaje tiene estrategia (Su rango supera los 100 metros)
	method tieneEstrategia() = rango > 100
}

// Molde para los guerreras.
class Gerrera inherits Personaje {
	// Fuerza del personaje.
	var fuerza // TODO var ???
	// Saber si el personaje tiene estrategia.
	const property tieneEstrategia // TODO const ???
	
	// Cancular la destreza del personaje (50% (0.5) mas que su fuerza)
	method destreza() = fuerza + fuerza * 0.5
	
}

// Molde para los ballesteros.
class Ballestero inherits Arquero {
	override method destreza() = 2 * super()
}