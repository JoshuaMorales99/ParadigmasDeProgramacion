import Platillos.*

// ---------------------------------------------------------
// 🔸 Especialidades.
// ---------------------------------------------------------
class Pastelero {
	// Nivel de dulzor deseado.
	const dulzorDeseado
	
	// Otorgar calificacion dado un plato (5 * Cantidad de azúcar / dulzor deseado. No puede ser mayor a 10)
	method calificar(plato) = 10.min(5 * plato.cantAzucar() / dulzorDeseado) // TODO Division por 0???
	
	// Preparar un platillo (Cantidad de colores va a ser el nivel de dulzor deseado dividido 50)
	method preparar() = new Postre(cantColores = dulzorDeseado / 50)
}

class Chef {
	// Nivel maximo de calorias preferida.
	const caloriasMaxima
	
	// Saber si un plato dado cumple las expectativas (Es bonito y tiene hasta cierta cantidad de calorias)
	method cumpleExpectativa(plato) = plato.esBonito() and plato.calorias() < caloriasMaxima
	
	// Obtener un mal puntaje (Igual a 0)
	method malPuntaje(plato) = 0
	
	// Otorgar calificacion dado un plato (10 si cumple las expectativas, 0 en caso contrario)
	method calificar(plato) = if(self.cumpleExpectativa(plato)) 10 else self.malPuntaje(plato)
	
	// Preparar un platillo (Son bonitos y la cantidad de azucar es equivalente a la cantidad de calorias maxima preferida)
	method preparar() = new Principal(cantAzucar = caloriasMaxima, esBonito = true)
}

class SousChef inherits Chef {
	// Obtener un mal puntaje (Igual a la cantidad de calorías del plato / 100. No puede ser mayor a 6)
	override method malPuntaje(plato) = 6.min(plato.calorias() / 100)
	
	// Preparar un platillo.
	override method preparar() = new Entrada()
}