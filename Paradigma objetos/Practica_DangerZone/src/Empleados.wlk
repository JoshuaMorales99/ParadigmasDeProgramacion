// -------------------------------------------------
// 🔸 Empleados.
// -------------------------------------------------
// Molde para los empleados.
class Empleado {
	// Nivel de salud del empleado.
	var salud
	// Rol del empleado dentro de la agencia.
	var rol
	// Habilidades para resolver misiones (Property para Test)
	const property habilidades = #{}
	
	// Obtener la salud restante.
	method salud() = salud
	
	// Saber si posee una habilidad dada.
	method posee(unaHabilidad) = habilidades.contains(unaHabilidad)
	// Saber si tiene vida (Salud es mayor a 0)
	method tieneSalud() = salud > 0
	
	// Sufrir una dada cantidad de danio.
	method sufrirDanio(cantidad) {
		salud = 0.max(salud - cantidad)
	}
	
	// Aprender nuevas habilidades.
	method aprender(unasHabilidades) {
		habilidades.addAll(unasHabilidades)
	}
	
	// Establecer nuevo rol.
	method rol(nuevoRol) {
		rol = nuevoRol
	}
	
	// PUNTO 1 - Saber si esta incapacitado (Cuando su salud esta por debajo de su salud critica)
	method incapacitado() = salud < rol.saludCritica()
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad)
	method puedeUsar(unaHabilidad) = not self.incapacitado() and self.posee(unaHabilidad)
	
	// PUNTO 3 - Cumplir una mision dada.
	method cumplir(mision) {
		// Si tiene vida, recibe una recompensa dependiendo del rol dentro de la agencia.
		if(self.tieneSalud()) rol.recibirRecompenza(mision, self)
	}
	
	// Saber el rol actual (Para test)
	method rol() = rol
}

// -------------------------------------------------
// 🔸 Jefes.
// -------------------------------------------------
// Molde para los jefes.
class Jefe inherits Empleado {
	// Subordinados asignados.
	const subordinados = #{}
	
	// Saber si algun subordinado puede usar una habilidad dada.
	method AlgunSubordinadoPuedeUsar(unaHabilidad) = subordinados.any{subordinado => subordinado.puedeUsar(unaHabilidad)}
	
	// Agregar subordinado.
	method agregarSubordinado(nuevoSubordinado) {
		subordinados.add(nuevoSubordinado)
	}
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad o alguno de sus subordinados puede usarla)
	override method puedeUsar(unaHabilidad) = super(unaHabilidad) or self.AlgunSubordinadoPuedeUsar(unaHabilidad)
}

// -------------------------------------------------
// 🔸 Equipo de empleados.
// -------------------------------------------------
// Molde para los equipos formados para una mision.
class Equipo {
	// Integrantes del equipo.
	const integrantes = #{}
	
	// Saber si algun integrante del equipo puede usar una habilidad dada.
	method puedeUsar(unaHabilidad) = integrantes.any{integrante => integrante.puedeUsar(unaHabilidad)}
	
	// Sufrir una dada cantidad de danio.
	method sufrirDanio(cantidad) {
		// Todos los integrantes reciban un tercio del daño total.
		integrantes.forEach{integrante => integrante.sufrirDanio(cantidad / 3)}
	}
	
	// Agregar integrantes al equipo.
	method agregarIntegrantes(unosIntegrantes) {
		integrantes.addAll(unosIntegrantes)
	}
	
	// PUNTO 3 - Comenzar una mision dada.
	method cumplir(mision) {
		integrantes.forEach{integrante => integrante.cumplir(mision)}
	}
}