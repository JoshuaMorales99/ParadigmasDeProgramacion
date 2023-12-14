// --------------------------------------------------
// 🔸 Notificaciones.
// --------------------------------------------------
// Molde para las notificaciones.
class Notificacion {
	// Chat de donde sale la notificacion.
	const property chat
	// Estado de leido.
	var leida = false
	
	// Saber si una notificacion fue leida.
	method leida() = leida
	
	// Leer notificacion.
	method leer() {
		leida = true
	}
}
