// --------------------------------------------------
// 🔸 Misiones.
// --------------------------------------------------
// Clase abstracta para las misiones.
class Mision {
	// Saber si el/los participantes tienen estrategia.
	method tieneEstrategia()
	// Saber si el/los participantes tiene la destreza suficiente.
	method tieneDestrezaSuficiente()
	
	// PUNTO 1 - Saber si puede ser superada por el personaje (Tiene estrategia o tienen la destresa suficiente)
	method puedeSuperar() = self.tieneEstrategia() or self.tieneDestrezaSuficiente()
}

// Molde para las misiones individuales.
class MisionIndividual inherits Mision {
	// Personaje participante de la mision.
	const personaje
	// Dificultad de la mision.
	const dificultad
	
	// Obtener la cantidad de copas en juego (doble de la dificultad)
	method copasEnJuego() = 2 * dificultad
	
	// Saber si el personaje tiene estrategia.
	override method tieneEstrategia() = personaje.tieneEstrategia()
	// Saber si el personaje tiene la destreza suficiente (Su destreza supera la dificultad de la mision)
	override method tieneDestrezaSuficiente() = personaje.destreza() > dificultad
	
}

// Molde para las misiones grupales.
class MisionGrupal inherits Mision {
	// Grupo de participantes de la mision.
	const personajes = #{}
	
	// Obtener la cantidad de personajes participantes de la mision.
	method cantParticipantes() = personajes.size()
	// Obtener la cantidad de personajes del equipo que tienen estrategias.
	method cantparticipantesConEstrategia() = personajes.count{personaje => personaje.tieneEstrategia()}
	// Obtener la cantidad de copas en juego (50 / cantidad de personajes participantes)
	method copasEnJuego() = 50 / self.cantParticipantes()
	
	// Saber si mas de la mitad de los participantes tienen estrategia.
	override method tieneEstrategia() = self.cantparticipantesConEstrategia() > self.cantParticipantes() / 2
	// Saber si los personajes tienen la destreza suficiente (Cada uno de los personajes tienen destresa superior a 400)
	override method tieneDestrezaSuficiente() = personajes.all{personaje => personaje.destreza() > 400}
	
	// Agregar personajes al grupo (TODO Para test)
	method agregarPersonajes(unosPersonajes) {
		personajes.addAll(unosPersonajes)
	}
}