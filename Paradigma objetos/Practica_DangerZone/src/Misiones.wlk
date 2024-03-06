// -------------------------------------------------
// 🔸 Misiones.
// -------------------------------------------------
// Molde para las misiones a realizar.
class Mision {
	// Nivel de peligrosidad de la mision.
	const peligrosidad
	// Habilidades requeridas para completar la mision.
	const habilidadesRequeridas = []
	
	// Saber si una entidad puede completar la mision.
	method puedeCompletar(entidad) = habilidadesRequeridas.all{habilidadRequerida => entidad.puedeUsar(habilidadRequerida)}
	
	// Verificar si la entidad cumple con las habilidades requeridas.
	method verificarHabilidades(entidad) {
		// Si no se puede cumplir con la mision, se lanza una excepcion.
		if(not self.puedeCompletar(entidad)) throw new Exception(message = "No se puede completar la mision")
	}
	
	// Comenzar con la mision dado un empleado/equipo.
	method comenzar(entidad) {
		// Verificar si se cumple con las habilidades requeridas.
		self.verificarHabilidades(entidad)
		// Sufrir danio por cumplir con la mision.
		entidad.sufrirDanio(peligrosidad)
		// Recibir recompenza por cumplir con la mision.
		entidad.cumplir(self)
	}
	
	// Aprender habilidades de la mision que no se poseian (Puesto que las habilidades del empleado es un Set, no habran duplicados)
	method aprenderHabilidades(empleado) {
		empleado.aprender(habilidadesRequeridas)
	}
	
	// Agregar habilidades requeridas a la mision (Para Test)
	method agregarHabilidadesRequeridas(habilidades){
		habilidadesRequeridas.addAll(habilidades)
	}
}
