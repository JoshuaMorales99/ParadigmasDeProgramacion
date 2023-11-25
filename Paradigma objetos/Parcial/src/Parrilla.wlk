// -------------------------------------------------------------
// 🔸 La parrilla del nuevo Miguelito. 
// -------------------------------------------------------------
object parrillaMiguelito {
	// Menu de la parrilla.
	const menu = #{}
	
	// Agregar comidas dadas al menu.
	method agregarAMenu(comidas) {
		menu.addAll(comidas)
	}
	
	// Quitar una comidad dada del menu.
	method quitarDeMenu(comida) {
		menu.remove(comida)
	}
}