// ---------------------------------------------------------
// 🔸 Platillos.
// ---------------------------------------------------------
// Clase abstracta para los distintos platos.
class Plato {
	// Cantidad de azucar en el platillo (En gramos)
	const property cantAzucar
	
	// PUNTO 1 - Obtener la cantidad de calorias del plato (3 * Cantidad de azúcar + 100 de base)
	method calorias() = 3 * cantAzucar + 100
}

// Molde para las entradas.
class Entrada inherits Plato(cantAzucar = 0) {
	// Saber si es un plato bonito (Siempre es bonito)
	method esBonito() = true
}

// Molde para los principales.
class Principal inherits Plato {
	// Saber si es un plato bonito (Puede o no serlo)
	const property esBonito
}

// Molde para los postres.
class Postre inherits Plato(cantAzucar = 120) {
	// Cantidad de colores que posee el plato
	const cantColores
	
	// Saber si es un plato bonito (Es bonito si posee mas de 3 colores)
	method esBonito() = cantColores > 3
}