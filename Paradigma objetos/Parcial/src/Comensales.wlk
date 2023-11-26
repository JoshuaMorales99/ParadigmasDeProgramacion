// -------------------------------------------------------------
// 🔸 PARTE 2 - Comensales. 
// -------------------------------------------------------------
// Molde para los comensales (Al instanciar, hay que pasarle 'dinero')
class Comensal {
	// Dinero disponible del comensal.
	var dinero
	// Tipo de comensal (celiaco, paladarFino, todoTerreno)
	var tipoComensal
	
	// Saber si le agrada una comida dada.
	method leAgrada(comida) = tipoComensal.leAgrada(comida)
	// Saber si puede pagar una comida dada.
	method puedePagar(comida) = comida.precio() <= dinero
	// Saber si puede comprar una comida dada (Si le agrada y tiene dinero suficiente para comprarla)
	method puedeComprar(comida) = self.leAgrada(comida) and self.puedePagar(comida)
	
	// GETTER: Obtener la cantidad de dinero disponible (Para test)
	method dinero() = dinero
	
	// Elegir un platillo para comprar del menu dado (Obtener el platillo de maxima valoracion)
	method elegirPlatillo(menu) = menu.max{platillo => platillo.valoracion()}
	
	// Pagar el precio dado.
	method pagar(precio) {
		dinero = dinero - precio
	}
	
	// Recibir una promocion de la parrilla.
	method recibirPromocion(cantidad) {
		dinero = dinero + cantidad
	}
}

// -------------------------------------------------------------
// 🔸 Tipo de comensales. 
// -------------------------------------------------------------
// Tipos de comensales disponibles.
object celiaco {
	// Saber si le agrada una comida dada (Le agradan las comidas que son aptas para celiacos)
	method leAgrada(comida) = comida.aptoCeliacos()
}

object paladarFino {
	// Saber si le agrada una comida dada (Le agradan las comidas que son especiales o tienen una valoracion mayor a 100)
	method leAgrada(comida) = comida.esEspecial() or comida.valoracion() > 100
}

object todoTerreno {
	// Saber si le agrada una comida dada (Le agrada todo tipo de comida)
	method leAgrada(comida) = true
}