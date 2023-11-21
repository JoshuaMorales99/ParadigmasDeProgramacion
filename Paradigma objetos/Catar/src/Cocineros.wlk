// ---------------------------------------------------------
// 🔸 Cocineros.
// ---------------------------------------------------------
// Molde para los cocineros.
class Cocinero {
	// Especialidad del cocinero. (SETTER necesario, TODO GETTER para Test)
	var property especialidad
	
	// PUNTO 2 - Catar un plato dado.
	method catar(plato) = especialidad.calificar(plato)
	
	// PUNTO 3 - Cambiar de especialidad.
	// Se establecio el property para unificar el SETTER de este punto y el GETTER para los Test.
}