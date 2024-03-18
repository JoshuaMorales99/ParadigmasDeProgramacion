// ---------------------------------------------------------
// 🔸 Partidas.
// ---------------------------------------------------------
// Molde para las partidas.
class Partida {
	// Integrante del equipo rojo.
	const equipoRojo
	// Integrante del equipo azul.
	const equipoAzul
	
	// Obtener al ganador (Equipo con mayor nivel de habilidad)
	method ganador() = [equipoRojo, equipoAzul].max{equipo => equipo.habilidad()}
	
	// Comenzar partida.
	method comenzarPartida() {
		equipoRojo.jugar()
		equipoAzul.jugar()
	}
}
