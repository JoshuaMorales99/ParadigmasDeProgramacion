// -------------------------------------------------
// 🔸 Empleados.
// -------------------------------------------------
// Molde para los empleados.
class Empleado {
	// Nivel de salud del empleado.
	var salud
	// Rol del empleado dentro de la agencia. (Setter necesario para Oficinista, Getter para Test)
	var property rol
	
	// Habilidades para resolver misiones (Property para Test)
	const property habilidades = #{}
	
	// Saber si posee una habilidad dada.
	method posee(unaHabilidad) = habilidades.contains(unaHabilidad)
	// Saber si tiene vida (Salud es mayor a 0)
	method tieneSalud() = salud > 0
	
	// Consultar salud restante.
	method salud() = salud
	
	// Sufrir una dada cantidad de danio.
	method sufrirDanio(cantidad) {
		salud = 0.max(salud - cantidad)
	}
	
	// Aprender nuevas habilidades.
	method aprender(unasHabilidades) {
		habilidades.addAll(unasHabilidades)
	}
	
	// PUNTO 1 - Saber si esta incapacitado (Cuando su salud esta por debajo de su salud critica)
	method incapacitado() = salud < rol.saludCritica()
	
	// PUNTO 2 - Saber si puede usar una habilidad dada (No esta incapacitado y posee la habilidad)
	method puedeUsar(unaHabilidad) = not self.incapacitado() and self.posee(unaHabilidad)
	
	// PUNTO 3 - Cumplir una mision dada.
	method cumplir(mision) {
		// Si tiene vida.
		if(self.tieneSalud()) {
			// Recibe una recompensa dependiendo del rol dentro de la agencia.
			rol.recibirRecompenza(mision, self)
		}
	}
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
	// Equipo conformado para llevar a cabo una mision.
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

// -------------------------------------------------
// 🔸 Posibles roles dentro de la agencia.
// -------------------------------------------------
object espia {
	// Nivel de salud critica.
	method saludCritica() = 15
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Aprender nuevas habilidades.
		mision.aprenderHabilidades(empleado)
	}
}

// Molde para los oficinistas.
class Oficinista {
	// Cantidad de estrellas.
	var cantEstrellas
	
	// Nivel de salud critica.
	method saludCritica() = 40 - 5 * cantEstrellas
	
	// Consultar la cantidad de estrellas que posee (Para Test)
	method cantEstrellas() = cantEstrellas
	
	// Ganar una estrella.
	method ganarEstrellas(cantidad) {
		cantEstrellas = cantEstrellas + cantidad
	}
	
	// Recibir recompenza por completar una mision dada.
	method recibirRecompenza(mision, empleado){
		// Ganar estrella.
		self.ganarEstrellas(1)
		// Si junta tres estrellas, comienza a trabajar como espia.
		if(cantEstrellas == 3) empleado.rol(espia)
	}
}