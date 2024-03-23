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
	// Obtener la cantidad total de celulas agresivas.
	method cantidadDeCelulasAgresivas() = enfermedades.sum{enfermedad => enfermedad.cantDeCelulasAmenazadas()}
	// Obtener la enfermedad que mas celulas afecta.
	method laQueMasCelulasAfecta() = enfermedades.max{enfermedad => enfermedad.cantDeCelulasAmenazadas()}
	// Obtener la temperatura de la persona.
	method temperatura() = temperatura
	
	// Saber si esta en coma (Tiene menos de 10000000000 o su temperatura es mayor o igual a 40)
	method estaEnComa() = cantidadDeCelulas < 10000000000 or temperatura >= 40
	
	// Contraer una enfermedad dada.
	method contraer(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	// Vivir un dia (Desencadena los efectos de cada enfermedad)
	method viviUnDia() {
		enfermedades.forEach({enfermedad => enfermedad.producirEfecto(self)})
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
	
	// Subir la temperatura en una cantidad dada.
	method subirTemperatura(grados) {
		temperatura = temperatura + grados
	}
	
	// Bajar totalmente la temperatura.
	method bajarTotalmenteTemperatura() {
		temperatura = 0
	}
	
	// Matar una cantidad dada de celulas.
	method matarCelulas(cantCelulas) {
		cantidadDeCelulas = cantidadDeCelulas - cantCelulas
	}
	
	// Obtener las enfermedades de una persona (Para test)
	method enfermedades() = enfermedades
}