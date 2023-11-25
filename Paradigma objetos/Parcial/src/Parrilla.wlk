// -------------------------------------------------------------
// 🔸 La parrilla del nuevo Miguelito. 
// -------------------------------------------------------------
object parrillaMiguelito {
	// Menu de la parrilla.
	const menu = []
	
	// Agregar una comida dada al menu.
	method agregarAMenu(comida) {
		menu.add(comida)
	}
	
	// Quitar una comidad dada del menu.
	method quitarDeMenu(comida) {
		menu.remove(comida)
	}
}