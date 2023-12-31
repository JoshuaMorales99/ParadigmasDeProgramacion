import Personajes.*

/*========================================
 LUGARES.
=========================================*/
object plantaNuclear {
	// Tiene un encargado de la sala de control.
	var encargado = homero
	// Tiene barras de uranio (Al principio no hay)
	var cantBarrasUranio = 0
	
	// Saber si la planta esta en peligro (cantBarrasUranio > 10000 y encargado distraido)
	method estaEnPeligro() = cantBarrasUranio > 10000 && encargado.estaDistraido() || mrBurns.esPobre()
	
	// Entregar cargamento de cierta cantidad de barras de uranio.
	method recibirCargamento(cantidad) {
		cantBarrasUranio += cantidad
	}
	// Reemplazar al encargado de la sala de control.
	method encargado(nuevoEncargado) {
		encargado = nuevoEncargado
	}
}
