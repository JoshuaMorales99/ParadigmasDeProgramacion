import Personajes.*

/*========================================
 🔸 LUGARES.
=========================================*/

object plantaNuclear {
	// Encargado de la sala de control.
	var encargado = homero
	// Cantidad de barras de uranio (Al principio no hay)
	var cantBarrasUranio = 0
	
	// Saber si hay muchas barras de uranio (> 10000)
	method hayMuchoUranio() = cantBarrasUranio > 10000
	// PUNTO 2.a: Saber si esta en peligro (Hay muchas barras de uranio y el encargado distraido, o Mr. Burns es pobre)
	method estaEnPeligro() = self.hayMuchoUranio() and encargado.estaDistraido() or mrBurns.esPobre()
	
	// PUNTO 2.b: Recibir el cargamento de cierta cantidad de barras de uranio.
	method recibirCargamento(cantidad) {
		cantBarrasUranio = cantBarrasUranio + cantidad
	}
	
	// PUNTO 4: Reemplazar al encargado de la sala de control.
	method encargado(nuevoEncargado) {
		encargado = nuevoEncargado
	}
}
