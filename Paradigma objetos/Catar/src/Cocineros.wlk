// ---------------------------------------------------------
// 🔸 Cocineros.
// ---------------------------------------------------------
// Molde para los cocineros.
class Cocinero {
	// Especialidad del cocinero.
	var especialidad
	
	// PUNTO 2 - Catar un plato dado.
	method catar(plato) = especialidad.calificar(plato)
}