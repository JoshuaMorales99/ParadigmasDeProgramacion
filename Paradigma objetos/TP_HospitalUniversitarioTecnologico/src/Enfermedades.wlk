// ----------------------------------------------------------------
// 🔸 Enfermedades.
// ----------------------------------------------------------------
// Clase abstracta de enfermedades de celulas.
class EnfermedadDeCelulas {
	// Cantidad de celulas amenazadas.
	var cantDeCelulasAmenazadas
	
	// Obtener la cantidad de celulas amenazadas.
	method cantDeCelulasAmenazadas() = cantDeCelulasAmenazadas
	// Obtener la resistencia de la enfermedad a una dosis.
	method resistencia(dosis)
	// Obtener el efecto que le hace una dosis dada (Dosis - resistencia de la enfermedad a la dosis)
	method efecto(dosis) = dosis - self.resistencia(dosis)
	
	// Saber si se puede curar (Cantidad de celulas amenazadas es menor o igual a 0)
	method puedeCurarse() = cantDeCelulasAmenazadas <= 0
	
	// Atenuar enfermedad dada una dosis (Cantidad de celulas amenazadas - (efecto del medicamento * 15))
	method atenuar(dosis) {
		cantDeCelulasAmenazadas = cantDeCelulasAmenazadas - self.efecto(dosis) * 15
	}
}

// Molde para las enfermedades infecciosas.
class EnfermedadInfecciosa inherits EnfermedadDeCelulas {
	// Obtener la resistencia de la enfermedad a una dosis (Resisten 20 ml)
	override method resistencia(dosis) = 20
	
	// Saber si es una enfermedad agresiva para una persona dada (10% de las celulas de la persona estan amenazadas) TODO test
	method esAgresiva(persona) = cantDeCelulasAmenazadas > persona.cantidadDeCelulas() * 0.1
	
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
	
	// Obtener la resistencia de la enfermedad a una dosis (No tienen resistencias)
	override method resistencia(dosis) = 0
	
	// Saber si es una enfermedad agresiva para una persona dada (Cantidad de celulas amenazadas mayor a 1000) TODO test
	method esAgresiva(persona) = cantDeCelulasAmenazadas > 1000
	
	// Producir los efectos de la enfermedad en una persona dada.
	method producirEfecto(persona) {
		
	}
}