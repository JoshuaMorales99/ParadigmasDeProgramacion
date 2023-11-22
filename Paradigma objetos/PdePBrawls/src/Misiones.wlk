// --------------------------------------------------
// 🔸 Misiones.
// --------------------------------------------------
// Clase abstracta para las misiones.
class Mision {
	const tipoMision
	
	// Saber si el/los participantes tienen estrategia.
	method tieneEstrategia()
	// Saber si el/los participantes tiene la destreza suficiente.
	method tieneDestrezaSuficiente()
	// Saber si se puede comenzar la mision.
	method puedeComenzar()
	// Saber si sumar o restar las copas en juego.
	method sumarORestar() = if(self.puedeSuperar()) 1 else - 1
	
	// Repartir copas.
	method repartirCopas()
	
	// PUNTO 1 - Saber si puede ser superada por el personaje (Tiene estrategia o tienen la destresa suficiente)
	method puedeSuperar() = self.tieneEstrategia() or self.tieneDestrezaSuficiente()
	
	// PUNTO 2 - Realizar mision.
	method realizarMision() {
		// Si no se puede comenzar con la mision, se lanza una excepcion.
		if(self.puedeComenzar()) throw new Exception(message = "La mision no puede comenzar")
		// Repartir copas.
		self.repartirCopas()
	}
}

// Molde para las misiones individuales.
class MisionIndividual inherits Mision {
	// Personaje participante de la mision.
	const personaje
	// Dificultad de la mision.
	const dificultad
	
	// Obtener la cantidad de participantes en el equipo.
	method cantParticipantes() = 1
	// Obtener la cantidad de copas en juego (doble de la dificultad)
	method copasEnJuego() = 2 * dificultad
	
	// Saber si el personaje tiene estrategia.
	override method tieneEstrategia() = personaje.tieneEstrategia()
	// Saber si el personaje tiene la destreza suficiente (Su destreza supera la dificultad de la mision)
	override method tieneDestrezaSuficiente() = personaje.destreza() > dificultad
	// Saber si se puede comenzar la mision (Si el personaje tiene, por lo menos, 10 copas)
	override method puedeComenzar() = personaje.cantCopas() >= 10
	
	// Repartir las copas al personaje dependiendo si superaron la mision o no.
	override method repartirCopas() {
		personaje.sumarCopas(self.sumarORestar() * tipoMision.copasARepartir(self))
	}
}

// Molde para las misiones grupales.
class MisionGrupal inherits Mision {
	// Grupo de participantes de la mision.
	const equipo = #{}
	
	// Obtener la cantidad de participantes en el equipo.
	method cantParticipantes() = equipo.size()
	// Obtener la cantidad de personajes del equipo que tienen estrategias.
	method cantparticipantesConEstrategia() = equipo.count{personaje => personaje.tieneEstrategia()}
	// Obtener la cantidad de copas en juego (50 / cantidad de personajes en el equipo)
	method copasEnJuego() = 50.div(self.cantParticipantes())
	
	// Saber si mas de la mitad de los personajes del equipo tienen estrategia.
	override method tieneEstrategia() = self.cantparticipantesConEstrategia() > self.cantParticipantes() / 2
	// Saber si el equipo tienen la destreza suficiente (Cada uno de los personajes del equipo tienen destresa superior a 400)
	override method tieneDestrezaSuficiente() = equipo.all{personaje => personaje.destreza() > 400}
	// Saber si se puede comenzar la mision (Si la suma de las copas del equipo es, por lo menos, igual a 60)
	override method puedeComenzar() = equipo.sum{personaje => personaje.cantCopas()} >= 60
	
	// Agregar personajes al equipo (Para test)
	method agregarPersonajes(personajes) {
		equipo.addAll(personajes)
	}
	
	// Repartir las copas al equipo dependiendo si superaron la mision o no.
	override method repartirCopas() {
		equipo.forEach{personaje => personaje.sumarCopas(self.sumarORestar() * tipoMision.copasARepartir(self))}
	}
}

// --------------------------------------------------
// 🔸 Tipos de misiones.
// --------------------------------------------------
object comun {
	// Obtener la cantidad de copas total a repartir al finalizar/perder mision.
	method copasARepartir(mision) = mision.copasEnJuego()
}

// Molde para los tipos boost.
class Boost {
	// Multiplicador de copas.
	const multiplicador
	
	// Obtener la cantidad de copas total a repartir al finalizar/perder mision.
	method copasARepartir(mision) = mision.copasEnJuego() * multiplicador
}

object bonus {
	// Obtener la cantidad de copas total a repartir al finalizar/perder mision.
	method copasARepartir(mision) = mision.copasEnJuego() + mision.cantParticipantes()
}