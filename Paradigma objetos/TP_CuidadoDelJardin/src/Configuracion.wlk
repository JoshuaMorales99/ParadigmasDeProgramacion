import wollok.game.*
import Personajes.*
import Lugares.*

/*================================================================
🔸 Configuraciones.
================================================================*/
object config {
	// Cargar las configuraciones del juego.
	method cargar() {
		// Cargar las configuraciones de la ventana.
		self.ventana()
		// Cargar las configuraciones visuales de objetos.
		self.agregarObjetos()
		// Cargar los controles.
		self.controles()
		// Cargar las colisiones.
		self.colisiones()
		// Cargar eventos automaticos.
		self.configurarEventosAutomaticos()
	}
	
	// Configuracion de la ventana.
	method ventana() {
		// Dimensiones de la pantalla.
		game.width(8)
		game.height(8)
		
		// Titulo del juego.
		game.title("Cuidado de jardin")
	}
	
	// Configuraciones visuales de objetos.
	method agregarObjetos() {
		// Mostrar visualmente al personaje controlado.
		game.addVisualCharacter(personajeControlado) 
		// Mostrar visualmente el spa en la casilla (1, 1)
		game.addVisualIn(spa, game.at(1, 1))
		// Mostrar visualmente el jardin en la casilla (6, 6)
		game.addVisualIn(jardin, game.at(6, 6))
		// Mostrar los atributos del jardin en la casilla (6, 7)
		game.addVisualIn(contadorDeMalezas, game.at(6, 7))
	}
	
	// Cargar los controles.
	method controles() {
		// Cambiar de personaje con la barra espaciadora.
		keyboard.space().onPressDo{personajeControlado.cambiar()}
	}
	
	// Cargar las colisiones.
	method colisiones() {
		// Cargar colisiones del spa.
		game.onCollideDo(spa, {_ => spa.atender(personajeControlado.personajeActual())})
		// Cargar colisiones del jardin.
		game.onCollideDo(jardin, {_ => personajeControlado.personajeActual().trabajarEnJardin(jardin)})
	}
	
	// Cargar elementos automaticos.
	method configurarEventosAutomaticos() {
		// Hacer crecer maleza en el jardin cada 5 segundos.
		game.onTick(5000, "crecerMaleza", {jardin.crecerMalezas()})
	}
	
}

object personajeControlado {
	// Posicion del personaje.
	var property position = game.center()
	// Personaje actual jugable.
	var personajeActual = olivia
	// Siguiente personaje para jugar.
	var siguientePersonaje = adriano
	
	// Obtener la imagen del personaje actual.
	method image() = self.personajeActual().image()
	// Obtener al personaje actual.
	method personajeActual() = personajeActual
	
	// Cambiar de personaje.
	method cambiar() {
		// Guardar temporalmente al personaje actual.
		const personaje = personajeActual
		
		// Intercambiar los personajes.
		personajeActual = siguientePersonaje
		siguientePersonaje = personaje
	}
}

object contadorDeMalezas {
	// Obtener el color del texto a mostrar ('FFFFFF' = Blanco)
	method textColor() = "FFFFFF"
	// Obtener el texto a mostrar.
	method text() = "Malezas: " + jardin.malezas().toString()
	
	// Cargar el contador de malezas.
	method cargar() {
		game.addVisual(self)
	}
}