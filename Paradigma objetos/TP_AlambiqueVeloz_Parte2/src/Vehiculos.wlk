// Vehiculo de Like y del Oso Miedoso.
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