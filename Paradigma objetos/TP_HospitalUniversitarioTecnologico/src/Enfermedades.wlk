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
	method efectoMedicamento(dosis) = dosis - self.resistencia(dosis)
	
	// Saber si se puede curar (Cantidad de celulas amenazadas es menor o igual a 0)
	method puedeCurarse() = cantDeCelulasAmenazadas <= 0
	
	// Atenuar enfermedad dada una dosis (Cantidad de celulas amenazadas - (efecto del medicamento * 15))
	method atenuar(dosis) {
		cantDeCelulasAmenazadas = cantDeCelulasAmenazadas - self.efectoMedicamento(dosis) * 15
	}
}

// Molde para las enfermedades infecciosas.
class EnfermedadInfecciosa inherits EnfermedadDeCelulas {
	// Obtener la resistencia de la enfermedad a una dosis (Resisten 20 ml)
	override method resistencia(dosis) = 20
	
	// Saber si es una enfermedad agresiva para una persona dada (La enfermedad de la persona dada posee una cantidad de celulas amenazadas mayor a 1000)
	method esAgresiva(persona) = cantDeCelulasAmenazadas > 1000
	
	// Reproducir (Duplica la cantidad de celulas amenazadas)
	method reproducir() {
		cantDeCelulasAmenazadas = cantDeCelulasAmenazadas * 2
	}
	
	// Producir los efectos de la enfermedad en una persona dada (Si es agresiva, mata la mitad de las celulas que amenaza de la persona. Luego, en cualquier caso, se reproduce)
	method producirEfecto(persona) {
		// Matar la mitad de las celulas que amenaza si es agresiva.
		if(self.esAgresiva(persona)) persona.matarCelulas(cantDeCelulasAmenazadas.div(2))
		// Reproducirse.
		self.reproducir()
	}
}

// Molde para las enfermedades autoinmune.
class EnfermedadAutoinmune inherits EnfermedadDeCelulas {
	// Cantidad de veces que se ha producido efecto.
	var cantVecesProducidoEfecto = 0
	
	// Obtener la resistencia de la enfermedad a una dosis (No tienen resistencias)
	override method resistencia(dosis) = 0
	
	// Saber si es una enfermedad agresiva para una persona dada (La temperatura de la persona esta entre los 35 y 40 grados)
	method esAgresiva(persona) = not persona.temperatura().between(35, 40)
	
	// Producir los efectos de la enfermedad en una persona dada (Sube un grado la temperatura de la persona dada)
	method producirEfecto(persona) {
		// Subir un grado la temperatura de la persona.
		persona.subirTemperatura(1)
		// Registrar la cantidad de veces que se ha producido el efecto.
		cantVecesProducidoEfecto = cantVecesProducidoEfecto + 1
	}
	
	// Obtener la cantidad de veces que se ha producido efecto (Para test)
	method cantVecesProducidoEfecto() = cantVecesProducidoEfecto
}

object laHipotermia {
	// Obtener la cantidad de celulas amenazadas (No afecta a ninguna celula)
	method cantDeCelulasAmenazadas() = 0
	
	// Saber si es una enfermedad agresiva para una persona dada (Es extremadamente agresiva)
	method esAgresiva(persona) = true
	
	// Producir los efectos de la enfermedad en una persona dada.
	method producirEfecto(persona) {
		persona.bajarTotalmenteTemperatura()
	}
	
	// Atenuar enfermedad dada una dosis (No se atenua)
	method atenuar(dosis) {
		
	}
}