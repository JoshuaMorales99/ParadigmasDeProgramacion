// --------------------------------------------------
// 🔸 Personajes.
// --------------------------------------------------
// Clase abstracta para los distintos tipos de personajes.
class Personaje {
	// Cantidad de copas obtenidas.
	var cantCopas = 0
	
	// Obtener la cantidad de copas obtenidas.
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
	
	// Cancular la destreza del personaje (50% mas que su fuerza)
	method destreza() = fuerza + fuerza * 0.5
	
}

// Molde para los ballesteros.
class Ballestero inherits Arquero {
	override method destreza() = 2 * super()
}

// --------------------------------------------------
// 🔸 PUNTO 5 - Polimorfismo.
// --------------------------------------------------
/* En este archivo se presentan los siguientes elementos polimorficos:

Arquero, Gerrero y Ballestero son clases cuyos objetos instanciables son polimorficos entre si puesto que comparten una misma interfaz
aunque algunos de ellos tienen comportamiento distinto. Este polimorfismo lo aprovecha una Mision, ya que para realizar y completar la
misma (o no) se les manda a los personajes (Indistintamente de cual sea) unos mensajes que son entendibles para cada uno de ellos.

Los mensajes polimorficos son:
* cantCopas()
* sumarCopas()
* destreza()
* tieneEstrategia()

*/