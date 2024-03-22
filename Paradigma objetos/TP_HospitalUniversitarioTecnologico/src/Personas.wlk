// ----------------------------------------------------------------
// 🔸 Personas.
// ----------------------------------------------------------------
// Molde para las personas.
class Persona {
	// Enfermedades que posee.
	const enfermedades = #{}
	// Temperatura de la persona.
	var temperatura = 36
	// Cantidad de celulas.
	var cantidadDeCelulas
	
	// Obtener la cantidad de celulas que posee.
	method cantidadDeCelulas() = cantidadDeCelulas
	// Obtener la cantidad de celulas agresivas.
	// method cantidadDeCelulasAgresivas()
	// Obtener la enfermedad que mas celulas afecta. TODO test
	method laQueMasCelulasAfecta() = enfermedades.max{enfermedad => enfermedad.cantDeCelulasAmenazadas()}
	
	// Saber si esta en coma.
	// method estaEnComa()
	
	// Contraer una enfermedad dada.
	method contraer(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	// Vivir un dia.
	method viviUnDia() {
		
	}
	
	// Curarse de una enfermedad dada.
	method curarse(enfermedad) {
		enfermedades.remove(enfermedad)
	}
	
	// Aplicar una dosis a una enfermedad dada.
	method aplicarDosis(enfermedad, dosis) {
		// Atenuar la enfermedad con la dosis dada.
		enfermedad.atenuar(dosis)
		// Si puede curarse, entonces se cura.
		if(enfermedad.puedeCurarse()) self.curarse(enfermedad)
	}
	
	// Recibir una dosis de medicamento.
	method recibir(dosis) {
		enfermedades.forEach{enfermedad => self.aplicarDosis(enfermedad, dosis)}
	}
	
	// Obtener las enfermedades de una persona (Para test)
	method enfermedades() = enfermedades
}