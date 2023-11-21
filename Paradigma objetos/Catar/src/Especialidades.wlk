// ---------------------------------------------------------
// 🔸 Especialidades.
// ---------------------------------------------------------
class Pastelero {
	// Nivel de dulzor deseado.
	const dulzorDeseado
	
	// Otorgar calificacion dado un plato (5 * Cantidad de azúcar / dulzor deseado. No puede ser mayor a 10)
	method calificar(plato) = 10.min(5 * plato.cantAzucar() / dulzorDeseado)
}

class Chef {
	// Nivel maximo de calorias aceptable.
	const caloriasMaxima
	
	// Saber si un plato dado cumple las expectativas (Es bonito y tiene hasta cierta cantidad de calorias)
	method cumpleExpectativa(plato) = plato.esBonito() and plato.calorias() < caloriasMaxima
	
	// Otorgar calificacion dado un plato (10 si cumple las expectativas, 0 en caso contrario)
	method calificar(plato) = if(self.cumpleExpectativa(plato)) 10 else 0
}