// ----------------------------------------------------------------
// 🔸 Especialidades.
// ----------------------------------------------------------------
object enfermero{
	// Aplicar un tratamiento extra a una persona dada (Da 10 unidades de dosis extra)
	method tratamientoExtra(persona){
		persona.recibir(10)
	}
}

object guardia{
	// Aplicar un tratamiento extra a una persona dada (Estabiliza la temperatura de la persona)
	method tratamientoExtra(persona){
		persona.estabilizarTemperatura()
	}
}

object sinEspecialidad{
	// Aplicar un tratamiento extra a una persona dada (No hace nada extra)
	method tratamientoExtra(persona){
		
	}
}