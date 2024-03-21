import Personas.*

// ----------------------------------------------------------------
// 🔸 Medicos.
// ----------------------------------------------------------------
// Molde para los medicos.
class Medico inherits Persona {
	// Dosis de medicamento propia.
	var dosis
	
	// Atender a un paciente dado.
	method atender(paciente) {
		
	}
	
	// Contraer una enfermedad dada.
	override method contraer(enfermedad) {
		
	}
}

class JefeDeDepartamento inherits Medico {
	// Subordinados a cargo.
	const subordinados = #{}
	
	// Atender a un paciente dado.
	override method atender(paciente) {
		
	}
}