// ---------------------------------------------------------
// 🔸 Torneos.
// ---------------------------------------------------------
// Molde para los torneos.
class Torneo {
	// Catadores del torneo.
	const catadores = []
	// Cocineros participantes del torneo de cocina.
	const platillos = []
	
	// Saber si hay participantes en el torneo.
	method hayParticipantes() = not platillos.isEmpty()
	
	// Obtener la calificacion total obtenida de un participante dado.
	method calificacionTotal(platillo) = catadores.sum{catador => catador.catar(platillo)}
	
	// Agregar catadores del torneo.
	method agregarCatadores(unosCatadores) {
		catadores.addAll(unosCatadores)
	}
	
	// PUNTO 6a - Agregar participante al torneo de cocina (Al participar, cocina y presenta su plato al torneo)
	method agregarParticipante(cocinero) {
		platillos.add(cocinero.cocinar())
	}
	
	// PUNTO 6b - Obtener el cocinero ganador (La mayor puntuacion que va a ser la suma de las calificaciones de cada catador)
	method ganador() =
		if(not self.hayParticipantes()) throw new Exception(message = "No hay participantes en el torneo")
		else platillos.max{platillo => self.calificacionTotal(platillo)}.cocinero()
}
