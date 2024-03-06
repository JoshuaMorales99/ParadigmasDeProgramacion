// -------------------------------------------------
// 🔸 Roles.
// -------------------------------------------------
object espia {
	// Obtener el nivel de salud critica.
	method saludCritica() = 15
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Aprender nuevas habilidades.
		mision.aprenderHabilidades(empleado)
	}
}

// Molde para los roles de oficinista.
class Oficinista {
	// Cantidad de estrellas.
	var cantEstrellas
	
	// Obtener el nivel de salud critica.
	method saludCritica() = 40 - 5 * cantEstrellas
	
	// Saber si posee suficiente experiencia (Tiene 3 estrellas)
	method suficienteExperiencia() = cantEstrellas == 3
	
	// Ganar una estrella.
	method ganarEstrellas(cantidad) {
		cantEstrellas = cantEstrellas + cantidad
	}
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Ganar estrella.
		self.ganarEstrellas(1)
		// Si tiene la suficiente experiencia, comienza a trabajar como espia.
		if(self.suficienteExperiencia()) empleado.rol(espia)
	}
	
	// Saber la cantidad de estrellas que posee (Para Test)
	method cantEstrellas() = cantEstrellas
}