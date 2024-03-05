/*================================================================
🔸 Vehiculos.
================================================================*/
object alambiqueVeloz {
	// Cantidad de combustible en tanque.
	var combustible = 100
	
	// Obtener la capacidad maxima del tanque de combustible (100 es la capacidad maxima por default)
	method maximoTanque() = 100
	
	// Saber si el vehiculo tiene tanque lleno.
	method tanqueLleno() = combustible == self.maximoTanque()
	// Saber si se puede desplazar (El vehículo debe tener el tanque lleno)
	method puedeDesplazarse() = self.tanqueLleno()
	// Saber si el vehiculo es rapido (Siempre es rapido por default)
	method rapido() = true
	
	// Modificar combustible respetando limitaciones (No puede ser menor a cero y mayor a la capacidad maxima del tanque)
	method combustible(nuevoCombustible) {
		combustible = nuevoCombustible.max(0).min(self.maximoTanque())
	}
	
	// Consumir combustible del tanque del vehiculo.
	method consumirCombustible(consumo) {
		self.combustible(combustible - consumo)
	}
	
	// Viajar.
	method viajar() {
		// Consume 10 de combustible.
		self.consumirCombustible(10)
	}
	
	// Obtener la cantidad de combustible en el tanque (Para test)
	method combustible() = combustible
	
	// Cargar combustible del tanque del vehiculo (Para test)
	method cargarCombustible(carga) {
		self.combustible(combustible + carga)
	}
}

object rocomovil {
	// Numero de mejoras del vehiculo.
	var mejorasHechas = 0
	
	// Saber si se puede desplazar (Siempre puede desplazarse por dafault)
	method puedeDesplazarse() = true
	// Saber si el vehiculo es rapido (Tiene mas de 5 mejoras)
	method rapido() = mejorasHechas > 5
	
	// Realizar una cantidad dada de mejoras al vehiculo.
	method hacerMejoras(nroMejoras){
		mejorasHechas = mejorasHechas + nroMejoras
	}
	
	// Viajar.
	method viajar() {
		// Cada que llega a un lugar, recibe una mejora.
		self.hacerMejoras(1)
	}
	
	// Obtener la cantidad de mejoras hechas (Para test)
	method mejorasHechas() = mejorasHechas
}

object superheterodino {
	// Piezas perdidas por el camino.
	var piezasPerdidas = 0
	
	// Saber si esta en buen estado (Perdio menos de 10 piezas por el camino)
	method buenEstado() = piezasPerdidas < 10
	// Saber si se puede desplazar (Esta en buen estado)
	method puedeDesplazarse() = self.buenEstado()
	// Saber si el vehiculo es rapido (Esta en buen estado)
	method rapido() = self.buenEstado()
	
	// Perder una cantidad dada de piezas del vehiculo.
	method perderPiezas(cantPerdida) {
		piezasPerdidas = piezasPerdidas + cantPerdida
	}
	
	// Viajar.
	method viajar() {
		// En el camino, el vehiculo pierde una pieza.
		self.perderPiezas(1)
	}
	
	// Saber la cantidad de piezas perdidas por el camino (Para test)
	method piezasPerdidas() = piezasPerdidas
}