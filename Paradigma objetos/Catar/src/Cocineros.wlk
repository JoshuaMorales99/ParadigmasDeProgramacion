// ---------------------------------------------------------
// 🔸 Cocineros.
// ---------------------------------------------------------
// Molde para los cocineros.
class Cocinero {
	// Especialidad del cocinero. (SETTER necesario, GETTER para Test)
	var property especialidad
	
	// PUNTO 2 - Catar un plato dado.
	method catar(platillo) = especialidad.calificar(platillo)
	
	// PUNTO 3 - Cambiar de especialidad.
	// Se establecio el property para unificar el SETTER de este punto y el GETTER para los Test.
	
	// PUNTO 5 - Cocinar un platillo.
	method cocinar() = especialidad.preparar(self)
}