/*================================================================
🔸 Vehiculos.
================================================================*/
object alambiqueVeloz {
	// Cantidad de combustible en tanque.
	var combustible = 100
	// Capacidad del tanque de combustible.
	const maximoTanque = 100 // 100 es la capacidad maxima por default.
	
	// Saber si el vehiculo tiene tanque lleno.
	method tanqueLleno() = combustible == maximoTanque
	// Saber si el vehiculo es rapido.
	method rapido() = true // Siempre es rapido por default.
	// Saber si se puede desplazar (El vehículo debe tener el tanque lleno)
	method puedeDesplazarse() = self.tanqueLleno()
	
	// Modificar combustible respetando limitaciones.
	method combustible(nuevoCombustible) {
		combustible = nuevoCombustible.max(0).min(maximoTanque)
	}
	
	// Consumir combustible del tanque del vehiculo.
	method consumirCombustible(consumo) {
		self.combustible(combustible - consumo)
	}
	// Cargar combustible del tanque del vehiculo.
	method cargarCombustible(carga) { // Propuesta por el alumno.
		self.combustible(combustible + carga)
	}
	
	// Al viajar, el vehiculo sufre consecuencias.
	method viajar() {
		self.consumirCombustible(10) // 10 como combustible a consumir por default.
	}
}

object rocomovil {
	// Numero de mejoras del vehiculo.
	var mejorasHechas = 0
	
	// Saber si el vehiculo es rapido (Es rapido si tiene mas de 5 mejoras)
	method rapido() = mejorasHechas > 5
	// Reconstruir el vehiculo.
	method mejorasHechas() = 0
	// Saber si se puede desplazar
	method puedeDesplazarse() = true
	
	// Incrementar el numero de mejoras.
	method hacerMejora(nroMejoras){
		mejorasHechas += nroMejoras
	}
	
	// Al viajar, el vehiculo sufre consecuencias.
	method viajar() {
		// Cada que llega a un lugar, recibe una mejora.
		self.hacerMejora(1)
	}
}

object superheterodino {
	// Piezas perdidas por el camino.
	var piezasPerdidas = 0
	// Como el vehiculo pierde piezas por el camino, trae incluido kits de reparacion.
	var kitsReparacion = 5
	
	// Saber si el vehiculo es rapido (No perdio mas de 10 piezas)
	method rapido() = piezasPerdidas <= 10
	// Saber si le queda disponible una cantidad de kits de reparacion.
	method tieneKits(cantidad) = kitsReparacion > cantidad
	// Saber si le falta una cantidad determinada de piezas.
	method faltanPiezas(cantidad) = piezasPerdidas > cantidad
	// Saber si se puede desplazar (El vehículo debe tener menos de 10 piezas perdidas)
	method puedeDesplazarse() = piezasPerdidas < 10
	
	// Reparar vehiculo una cantidad determinada de veces.
	method reparar(cantidad) {
		/* Solamente se puede reparar si se cumplen las siguientes condiciones:
		 * 	- Faltan como minimo esa cantidad de piezas.
		 * 	- Posee como minimo esa cantidad de kits de reparacion.
		*/
		if(self.tieneKits(cantidad) && self.faltanPiezas(cantidad)){
			kitsReparacion -= cantidad
			piezasPerdidas -= cantidad
		}
	}
	
	// Perder piezas del vehiculo.
	method perderPiezas(nroPerdidas) {
		piezasPerdidas += nroPerdidas
	}
	
	// Al viajar, el vehiculo sufre consecuencias.
	method viajar() {
		// En el camino, el vehiculo pierde una pieza.
		self.perderPiezas(1)
		// Al llegar a destino, es reparado con un kit de reparacion.
		self.reparar(1)
	}
}