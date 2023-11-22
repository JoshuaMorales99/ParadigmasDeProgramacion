// --------------------------------------------------
// 🔸 Personajes.
// --------------------------------------------------
// Clase abstracta para los distintos tipos de personajes.
class Personaje {
	// Cantidad de copas obtenidas.
	var cantCopas = 0
	
	// GETTER: Obtener la cantidad de copas obtenidas.
	method cantCopas() = cantCopas
	
	// Sumar una cantidad de copas dada.
	method sumarCopas(cantidad) {
		cantCopas = cantCopas + cantidad
	}
}

// Molde para los arqueros.
class Arquero inherits Personaje {
	// Agilidad del personaje.
	const agilidad
	// Rango del personaje (En metros)
	const rango
	
	// Calcular la destreza del personaje.
	method destreza() = agilidad * rango
	
	// Saber si el personaje tiene estrategia (Su rango supera los 100 metros)
	method tieneEstrategia() = rango > 100
}

// Molde para los guerreras.
class Gerrera inherits Personaje {
	// Fuerza del personaje.
	const fuerza
	// Saber si el personaje tiene estrategia.
	const property tieneEstrategia
	
	// Cancular la destreza del personaje (50% (0.5) mas que su fuerza)
	method destreza() = fuerza + fuerza * 0.5
	
}

// Molde para los ballesteros.
class Ballestero inherits Arquero {
	override method destreza() = 2 * super()
}