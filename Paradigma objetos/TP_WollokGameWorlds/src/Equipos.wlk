// ---------------------------------------------------------
// 🔸 Equipos.
// ---------------------------------------------------------
// Molde para los equipos.
class Equipo {
	// Integrantes del equipo.
	const integrantes = []
	
	// Obtener los jugadores que estan disponibles (Pueden jugar)
	method jugadoresDisponibles() = integrantes.filter{jugador => jugador.puedeJugar()}
	// Obtener el nivel de habilidad (Nivel de antiguedad * 2 - nivel de cansancio)
	method habilidad() = integrantes.sum{jugador => jugador.habilidad()}
	
	// Agregar un integrante dado al equipo.
	method agregar(nuevoIntegrante) {
		integrantes.add(nuevoIntegrante)
	}
	
	// Eliminar un integrante dado del equipo.
	method eliminar(integrante) {
		integrantes.remove(integrante)
	}
	
	// Jugar (Solo los jugadores disponibles)
	method jugar() {
		self.jugadoresDisponibles().forEach{jugador => jugador.jugar()}
	}
}