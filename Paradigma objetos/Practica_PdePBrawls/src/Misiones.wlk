// --------------------------------------------------
// 🔸 Misiones.
// --------------------------------------------------
// Clase abstracta para las misiones.
class Mision {
	// Tipo de mision (comun, Boost o bonus)
	const tipoMision
	
	// Saber si el/los participantes tienen estrategia.
	method tieneEstrategia()
	// Saber si el/los participantes tiene la destreza suficiente.
	method tieneDestrezaSuficiente()
	// Saber si se puede comenzar la mision.
	method puedeComenzar()
	// Saber si sumar o restar las copas en juego.
	method sumarORestar() = if(self.puedeSuperar()) 1 else - 1
	
	// Obtener la cantidad de copas a repartir.
	method cantCopas(mision) = self.sumarORestar() * tipoMision.copasARepartir(mision)
	
	// Repartir copas.
	method repartirCopas()
	
	// Verificar si se puede comenzar la mision.
	method verificarInicioDeMision() {
		if(not self.puedeComenzar()) throw new Exception(message = "La mision no puede comenzar")
	}
	
	// PUNTO 1 - Saber si puede ser superada por el personaje (Tiene estrategia o tienen la destresa suficiente)
	method puedeSuperar() = self.tieneEstrategia() or self.tieneDestrezaSuficiente()
	
	// PUNTO 2 - Realizar mision.
	method realizarMision() {
		// Verificar si se puede comenzar la mision.
		self.verificarInicioDeMision()
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
		personaje.sumarCopas(self.cantCopas(self))
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
	
	// Repartir las copas al equipo dependiendo si superaron la mision o no.
	override method repartirCopas() {
		equipo.forEach{personaje => personaje.sumarCopas(self.cantCopas(self))}
	}
	
	// Agregar personajes al equipo (Para test)
	method agregarPersonajes(personajes) {
		equipo.addAll(personajes)
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

// --------------------------------------------------
// 🔸 PUNTO 5 - Polimorfismo.
// --------------------------------------------------
/* En este archivo se presentan los siguientes elementos polimorficos:

MisionIndividual y MisionGrupal son clases cuyos objetos instanciables son polimorficos entre si puesto que comparten una misma interfaz
aunque algunos de ellos tienen comportamiento distinto. Este polimorfismo lo aprovecha el Usuario, puesto que para realizar la mision
se les manda a las misiones (Indistintamente de cual sea) unos mensajes que son entendibles para cada uno de ellos.

Los mensajes polimorficos son:
* cantParticipantes()
* copasEnJuego()
* tieneEstrategia()
* tieneDestrezaSuficiente()
* puedeComenzar()
* repartirCopas()
* sumarORestar()
* cantCopas(mision)
* puedeSuperar()
* verificarInicioDeMision()
* realizarMision()

comun, Boost (clase cuyo objetos instanciables son polimorficos) y bonus son objetos polimorficos entre si puesto que comparten una misma
interfaz aunque tengan comportamiento distinto. Este polimorfismo lo aprovecha una Mision, ya que para poder calcular la cantidad de copas
a repartir se les manda a los tipos de misiones (Indistintamente de cual sea) un mensaje que es entendible para cada uno de ellos.

Los mensajes polimorficos son:
* copasARepartir(mision)

*/