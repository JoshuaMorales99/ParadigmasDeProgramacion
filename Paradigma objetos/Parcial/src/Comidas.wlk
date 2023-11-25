// -------------------------------------------------------------
// 🔸 PARTE 1 - Comidas. 
// -------------------------------------------------------------
// Clase abstracta para las comidas.
class Comida {
	// Obtener precio de la comida (300 por su valoracion + adicional)
	method precio() = 300 * self.valoracion() + self.adicional()
	// Obtener la valoracion de la comida.
	method valoracion()
	// Obtener el monto adicional (Si es apto para celiacos sera 1200. En caso contrario, sera 0)
	method adicional() = if(self.aptoCeliacos()) 1200 else 0
	// Obtener el peso de la comida.
	method peso()
	
	// Saber si la comida es apto para celiacos.
	method aptoCeliacos()
	// Saber si es especial (Peso > 250 gramos)
	method esEspecial() = self.peso() > 250
}

// Molde para las provoletas (Al instanciar, hay que pasarle 'peso' y 'tieneEmpanado')
class Provoleta inherits Comida{
	// Peso de esta comida (En gramos)
	const property peso
	// Saber si esta comida tiene empanado.
	const tieneEmpanado
	
	// Saber si es apta para celiacos (Lo es si no tiene empanado)
	override method aptoCeliacos() = not tieneEmpanado
	// Saber si es especial (Peso > 250 gramos y tiene empanado)
	override method esEspecial() = super() and tieneEmpanado
	
	// Obtener su valoracion (Si es especial sera 120. En caso contrario, sera 80)
	override method valoracion() = if(self.esEspecial()) 120 else 80
}

// Clase abstracta para las hamburguesas.
class Hamburguesa inherits Comida {
	// Peso del medallon de carne.
	const pesoCarne
	// Pan utilizado para su elaboracion (industrial, casero o deMaiz)
	const pan
	
	// Saber si es apta para celiacos (Depende del pan utilizado para su elaboracion)
	override method aptoCeliacos() = pan.aptoCeliacos()
	
	// Obtener el peso de esta comida (Cantidad de medallones de carne * Peso del medallon de carne + Peso del pan utilizado en su elaboracion)
	override method peso() = self.cantMedallones() * pesoCarne + pan.peso()
	// Obtener la cantidad de medallones de carne utilizado para su elaboracion.
	method cantMedallones()
	// Obtener su valoracion (Peso / 10)
	override method valoracion() = self.peso() / 10
}

// Molde para las hamburguesas de carne (Al instanciar, hay que pasarle 'pesoCarne' y 'pan')
class HamburguesaCarne inherits Hamburguesa {
	// Obtener la cantidad de medallones de carne utilizados para su elaboracion.
	override method cantMedallones() = 1
}

// Molde para las hamburguesas dobles (Al instanciar, hay que pasarle 'pesoCarne' y 'pan')
class HamburguesaDoble inherits Hamburguesa {
	// Saber si es especial (Peso > 500 gramos)
	override method esEspecial() = self.peso() > 500
	
	// Obtener la cantidad de medallones de carne utilizados para su elaboracion.
	override method cantMedallones() = 2
}

// Molde para los cortes de carne (Al instanciar, hay que pasarle 'peso' y 'puntoCoccion')
class CorteCarne inherits Comida {
	// Peso del corte de carne.
	const property peso
	// Punto de coccion de la carne (jugoso, aPunto o cocido)
	const puntoCoccion
	
	// Saber si es apto para celiacos (Siempre lo es)
	override method aptoCeliacos() = true
	// Saber si es especial (Peso > 250 gramos y es un punto de coccion especial)
	override method esEspecial() = super() and puntoCoccion.esPuntoEspecial()
	
	// Obtener su valoracion (Siempre es igual a 100)
	override method valoracion() = 100
}

// Molde para las parrilladas (Al instanciar, hay que pasarle 'comidas' (OPCIONAL))
class Parrillada inherits Comida {
	// Comidas que componen la parrillada.
	const comidas = []
	
	// Saber si es apto para celiacos (Todas las comidas que la componen lo son)
	override method aptoCeliacos() = comidas.all{comida => comida.aptoCeliacos()}
	// Saber si es especial (Peso > 250 y tiene al menos 3 comidas)
	override method esEspecial() = super() and self.cantComidas() >= 3
	
	// Obtener el peso de esta parrillada (Suma de todas las comidas que la componen)
	override method peso() = comidas.sum{comida => comida.peso()}
	// Obtener la cantidad de comidas que la componen.
	method cantComidas() = comidas.size()
	// Obtener su valoracion (Es igual a la mayor valoracion de entre todas las comidas que la componen)
	override method valoracion() = comidas.max{comida => comida.valoracion()}.valoracion()
	
	// Agregar comidas a la parrillada.
	method agregarAParrillada(unasComidas) {
		comidas.addAll(unasComidas)
	}
}

// -------------------------------------------------------------
// 🔸 Panes para hamburguesas.
// -------------------------------------------------------------
// Molde para los panes de las hamburguesas (Al instanciar, hay que pasarle 'peso' y 'aptoCeliacos')
class Pan {
	// Peso del pan (En gramos)
	const property peso
	// Saber si es apto para celiacos.
	const property aptoCeliacos
}

// Panes disponibles.
const industrial = new Pan(peso = 60, aptoCeliacos = false)
const casero = new Pan(peso = 100, aptoCeliacos = false)
const deMaiz = new Pan(peso = 30, aptoCeliacos = true)

// -------------------------------------------------------------
// 🔸 Puntos de coccion de los cortes de carne.
// -------------------------------------------------------------
// Puntos de coccion disponibles.
object jugoso {
	// Saber si es un punto especial de la carne.
	method esPuntoEspecial() = false
}

object aPunto {
	// Saber si es un punto especial de la carne.
	method esPuntoEspecial() = true
}

object cocido {
	// Saber si es un punto especial de la carne.
	method esPuntoEspecial() = false
}