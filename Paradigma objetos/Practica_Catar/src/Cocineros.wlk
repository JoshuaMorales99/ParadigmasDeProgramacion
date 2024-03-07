// ---------------------------------------------------------
// 🔸 Cocineros.
// ---------------------------------------------------------
// Molde para los cocineros.
class Cocinero {
	// Especialidad del cocinero.
	var property especialidad
	
	// PUNTO 2 - Catar un plato dado.
	method catar(platillo) = especialidad.calificar(platillo)
	
	// PUNTO 3 - Establecer una nueva especialidad.
	method especialidad(nuevaEspecialidad) {
		especialidad = nuevaEspecialidad
	}
	
	// PUNTO 5 - Cocinar un platillo.
	method cocinar() = especialidad.preparar(self)
	
	// Obtener su especialidad (Para test)
	method especialidad() = especialidad
}