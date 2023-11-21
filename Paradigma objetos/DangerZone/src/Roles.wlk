// -------------------------------------------------
// 🔸 Roles.
// -------------------------------------------------
object espia {
	// Nivel de salud critica.
	method saludCritica() = 15
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Aprender nuevas habilidades.
		mision.aprenderHabilidades(empleado)
	}
}

class Oficinista {
	// Cantidad de estrellas.
	var cantEstrellas
	
	// Nivel de salud critica.
	method saludCritica() = 40 - 5 * cantEstrellas
	
	// Consultar la cantidad de estrellas que posee (Para Test)
	method cantEstrellas() = cantEstrellas
	
	// Ganar una estrella.
	method ganarEstrellas(cantidad) {
		cantEstrellas = cantEstrellas + cantidad
	}
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Ganar estrella.
		self.ganarEstrellas(1)
		// Si junta tres estrellas, comienza a trabajar como espia.
		if(cantEstrellas == 3) empleado.rol(espia)
	}
}