// ---------------------------------------------------------
// 🔸 Jugadores.
// ---------------------------------------------------------
// Molde para los jugadores profesionales de los esports.
class JugadorProfesional {
	// Anios activos como jugador profesional de esports.
	const antiguedad
	// Nivel de cansancio.
	var cansancio = 50
	
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
	
	// Obtener el nivel de cansancio (Para test)
	method cansancio() = cansancio
}

// WELL KNOWN OBJECT - OBJETO BIEN CONOCIDO
object faker {
	// Tilteado.
	var estaTilteado = false
	
	// Saber si esta tilteado.
	method estaTilteado() = estaTilteado
	// Saber si puede jugar (No esta tilteado)
	method puedeJugar() = not estaTilteado
	
	// Tomar tecito.
	method tomarTecito() {
		estaTilteado = false
	}
	
	// Tiltear (Para test)
	method tiltear() {
		estaTilteado = true
	}
}

const caps = new JugadorProfesional(antiguedad = 8)
const josedeodo =  new JugadorProfesional(antiguedad = 6)