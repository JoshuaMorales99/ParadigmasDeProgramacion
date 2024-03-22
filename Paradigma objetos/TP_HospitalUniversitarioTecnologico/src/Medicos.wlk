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
		paciente.recibir(dosis)
	}
	
	// Contraer una enfermedad dada.
	override method contraer(enfermedad) {
		// Contraer la enfermedad.
		super(enfermedad)
		// Tratar de curarse.
		self.atender(self)
	}
}

class JefeDeDepartamento inherits Medico {
	// Subordinados a cargo.
	const subordinados = #{}
	
	// Obtener a un subordiando aleatoriamente.
	method elegirSubordinado() = subordinados.anyOne()
	
	// Atender a un paciente dado.
	override method atender(paciente) {
		self.elegirSubordinado().atender(paciente)
	}
}