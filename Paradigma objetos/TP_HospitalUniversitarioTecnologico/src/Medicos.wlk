import Personas.*
import Especialidades.*

// ----------------------------------------------------------------
// 🔸 Medicos.
// ----------------------------------------------------------------
// Molde para los medicos.
class Medico inherits Persona {
	// Dosis de medicamento propia.
	var dosis
	// Especialidad.
	var especialidad
	
	// Atender a un paciente dado.
	method atender(paciente) {
		// Le da una dosis de medicamento al paciente.
		paciente.recibir(dosis)
		// Le da un tratamiento extra al paciente.
		especialidad.tratamientoExtra(paciente)
	}
	
	// Contraer una enfermedad dada.
	override method contraer(enfermedad) {
		// Contraer la enfermedad.
		super(enfermedad)
		// Tratar de curarse.
		self.atender(self)
	}
	
	// Cambiar de especialidad.
	method especialidad(nuevaEspecialidad) {
		especialidad = nuevaEspecialidad
	}
}

class JefeDeDepartamento inherits Medico(especialidad = sinEspecialidad) {
	// Subordinados a cargo.
	const subordinados = #{}
	
	// Obtener a un subordiando aleatoriamente.
	method elegirSubordinado() = subordinados.anyOne()
	
	// Atender a un paciente dado.
	override method atender(paciente) {
		self.elegirSubordinado().atender(paciente)
	}
	
	// Cambiar de especialidad (No puede cambiar su especialidad)
	override method especialidad(nuevaEspecialidad) {
		
	}
}