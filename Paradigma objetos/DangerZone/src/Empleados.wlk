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
	const property habilidades = #{}
	
	// Saber el rol del empleado (TODO Para Test)
	method rol() = rol
	// Saber si posee una habilidad dada.
	method posee(unaHabilidad) = habilidades.contains(unaHabilidad)
	
	// Sufrir un danio dado (TODO Para Test)
	method sufrirDanio(cantidad) {
		salud = 0.max(salud - cantidad)
	}
	
	// Aprender nuevas habilidades.
	method aprender(unasHabilidades) {
		habilidades.addAll(unasHabilidades)
	}
	
	// Asistir al jefe. // TODO ???
	method asistirJefe() {
		
	}
	
	// PUNTO 1 - Saber si esta incapacitado (Cuando su salud esta por debajo de su salud critica)
	method incapacitado() = salud < rol.saludCritica()
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad)
	method puedeUsar(unaHabilidad) = not self.incapacitado() and self.posee(unaHabilidad)
}

// -------------------------------------------------
// 🔸 Jefes.
// -------------------------------------------------
// Molde para los jefes.
class Jefe inherits Empleado {
	// Subordinados asignados.
	const subordinados = #{}
	
	// Agregar subordinado.
	method agregarSubordinado(nuevoSubordinado) {
		subordinados.add(nuevoSubordinado)
	}
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad o alguno de sus subordinados puede usarla)
	override method puedeUsar(unaHabilidad) = super(unaHabilidad) or subordinados.any{subordinado => subordinado.puedeUsar(unaHabilidad)}
}

// -------------------------------------------------
// 🔸 Posibles roles dentro de la agencia.
// -------------------------------------------------
object espia {
	// Nivel de salud critica.
	method saludCritica() = 15
	
	// Completar misiones.
		// Si sobrevive a una mision.
	
		// Aprender nuevas habilidades.
		
}

class Oficinista {
	// Cantidad de estrellas.
	var cantEstrellas
	
	// Nivel de salud critica.
	method saludCritica() = 40 - 5 * cantEstrellas
	
	// Sobrevive a mision.
	
	// Ganar una estrella.
	method ganarEstrellas() {
		cantEstrellas = cantEstrellas + 1
	}
	
	// Completar misiones.
		// Si sobrevive a una mision.
		
		// Ganar estrella.
}