// ---------------------------------------------------------
// 🔸 Jugadores.
// ---------------------------------------------------------
// Molde para los jugadores profesionales de los esports.
class Jugador {
	// Anios activos como jugador profesional de esports.
	const antiguedad
	// Nivel de cansancio.
	var cansancio = 50
	
	// Obtener el nivel de habilidad (Nivel de antiguedad * 2 - nivel de cansancio)
	method habilidad() = antiguedad * 2 - cansancio
	
	// Saber si es titular (Antiguedad mayor a 3)
	method esTitular() = antiguedad > 3
	// Seber si esta totalmente cansado (Nivel de cansancion mayor o igual a 100)
	method totalmenteCansado() = cansancio >= 100
	// Saber si puede jugar (Es titular y no esta totalmente cansado)
	method puedeJugar() = self.esTitular() and not self.totalmenteCansado()
	
	// Establecer nivel de cansancio (No puede ser menor a 0)
	method establecerCansancio(nuevoNivelCansancio) {
		cansancio = nuevoNivelCansancio.max(0)
	}
	
	// Tomar bebida energizante (Baja su cansancio en 10 puntos)
	method tomarBebidaEnergizante() {
		self.establecerCansancio(cansancio - 10)
	}
	
	// Jugar (Aumenta el nivel de cansancio en 20 puntos)
	method jugar() {
		cansancio = cansancio + 20
	}
	
	// Obtener el nivel de cansancio (Para test)
	method cansancio() = cansancio
}

// WELL KNOWN OBJECT - OBJETO BIEN CONOCIDO
object faker {
	// Tilteado.
	var estaTilteado = false
	// Nivel de habilidad.
	var habilidadAcumulada = 0
	
	// Obtener el nivel de habilidad.
	method habilidad() = if(estaTilteado) 0 else habilidadAcumulada
	
	// Saber si esta tilteado.
	method estaTilteado() = estaTilteado
	// Saber si puede jugar (No esta tilteado)
	method puedeJugar() = not estaTilteado
	
	// Tomar tecito.
	method tomarTecito() {
		estaTilteado = false
	}
	
	// Jugar (Aumenta su nivel de habilidad en 30 puntos)
	method jugar() {
		habilidadAcumulada = habilidadAcumulada + 30
	}
	
	// Obtener los puntos de habilidad acumulada (Para test)
	method habilidadAcumulada() = habilidadAcumulada
	
	// Tiltear (Para test)
	method tiltear() {
		estaTilteado = true
	}
}

const caps = new Jugador(antiguedad = 8)
const josedeodo =  new Jugador(antiguedad = 6)