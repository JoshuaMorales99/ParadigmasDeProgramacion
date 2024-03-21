// ----------------------------------------------------------------
// 🔸 Enfermedades.
// ----------------------------------------------------------------
// Clase abstracta de enfermedades de celulas.
class EnfermedadDeCelulas {
	// Cantidad de celulas amenazadas.
	var cantDeCelulasAmenazadas
	
	// Obtener la cantidad de celulas amenazadas.
	method cantDeCelulasAmenazadas() = cantDeCelulasAmenazadas
	
	// Atenuar enfermedad dada una dosis.
	method atenuar(dosis) {
		
	}
}

// Molde para las enfermedades infecciosas.
class EnfermedadInfecciosa inherits EnfermedadDeCelulas {
	// Saber si es una enfermedad agresiva para una persona dada.
	method esAgresiva(persona)
	
	// Reproducir.
	method reproducir() {
		
	}
	
	// Producir los efectos de la enfermedad en una persona dada.
	method producirEfecto(persona) {
		
	}
}

// Molde para las enfermedades autoinmune.
class EnfermedadAutoinmune inherits EnfermedadDeCelulas {
	// Cantidad de veces que se ha producido efecto.
	var cantVecesProducidoEfecto = 0
	
	// Saber si es una enfermedad agresiva para una persona dada.
	method esAgresiva(persona)
	
	// Producir los efectos de la enfermedad en una persona dada.
	method producirEfecto(persona) {
		
	}
}