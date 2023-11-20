// -------------------------------------------------
// 🔸 Empleados.
// -------------------------------------------------
// Molde para los empleados.
class Empleado {
	// Nivel de salud del empleado.
	var salud
	// Rol del empleado dentro de la agencia.
	var rol
	// Jefe asignado. // TODO ???
	var jefe = null
	// Habilidades para resolver misiones.
	const habilidades = #{}
	
	// Saber si posee una habilidad dada.
	method posee(habilidad) = habilidades.contains(habilidad)
	
	// Sufrir un danio dado (Para Test)
	method sufrirDanio(cantidad) {
		salud = 0.max(salud - cantidad)
	}
	
	// Asistir al jefe.
	method asistirJefe() {
		
	}
	
	// PUNTO 1 - Saber si esta incapacitado (Cuando su salud esta por debajo de su salud critica)
	method incapacitado() = salud < rol.saludCritica()
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad)
	method puedeUsar(habilidad) = not self.incapacitado() and self.posee(habilidad)
}

// -------------------------------------------------
// 🔸 Jefes.
// -------------------------------------------------
// Molde para los jefes.
class Jefe inherits Empleado {
	// Subordinados asignados.
	const subordinados = #{}
	
	
}

// -------------------------------------------------
// 🔸 Posibles roles dentro de la agencia.
// -------------------------------------------------
object espia {
	// Nivel de salud critica.
	method saludCritica() = 15
	
	// Aprender nuevas habilidades.
	
	// Completar misiones.
		// Aprender nuevas habilidades.
		
}

object oficinista {
	// Cantidad de estrellas.
	var cantEstrellas = 0
	
	// Nivel de salud critica.
	method saludCritica() = 40 - 5 * cantEstrellas
	
	// Sobrevive a mision.
	
	// Ganar estrella.
	
	// Completar misiones.
		// Si sobrevive a una mision.
		
		// Ganar estrella.
}