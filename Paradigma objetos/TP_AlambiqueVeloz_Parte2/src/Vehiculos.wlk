/*================================================================
🔸 Vehiculos.
================================================================*/
// Vehiculo de Like y del Oso Miedoso.
object alambiqueVeloz {
	// Cantidad de combustible en tanque.
	var combustible = 100
	
	// Obtener la capacidad maxima del tanque de combustible (100 es la capacidad maxima por default)
	method maximoTanque() = 100
	// Obtener el tiempo que tarda en llegar a destino (Capacidad maxima del tanque / cantidad de combustible)
	method tiempo() = self.maximoTanque() / combustible
	
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
}

// Vehiculo de Mafio y su pandilla.
object antiguallaBlindada {
	// Cantidad de integrantes.
	const integrantes = ['Clyde', 'Ring-A-Ding', 'Mac', 'Danny', 'Rug-Bug-Benny', 'Willy', 'Kirby']
	
	// Obtener la velocidad (Cantidad de letras de todos los nombres de los integrantes)
	method velocidad() = integrantes.sum{integrante => integrante.size()}
	// Obtener el tiempo que tarda en llegar a destino (Igual a su velocidad)
	method tiempo() = self.velocidad()
	
	// Saber si puede desplazarse (Tiene cantidad par de integrantes)
	method puedeDesplazarse() = integrantes.size().even()
	// Saber si es rapido (Velocidad mayor a 30)
	method rapido() = self.velocidad() > 30
	
	// Eliminar un integrante.
	method eliminar(integrante){
		integrantes.remove(integrante)
	}
	
	// Agregar un integrante.
	method agregar(integrante) {
		integrantes.add(integrante)
	}
	
	// Viajar.
	method viajar() {
		// Pierde el primer integrante.
		self.eliminar(integrantes.first())
	}
	
	// Obtener los integrantes (Para test)
	method integrantes() = integrantes
}

// Vehiculo de Pierre Nodoyuna y Patán.
object superPerrari { 
	// Cantidad de trampas colocadas.
	var trampasColocadas = 0
	
	// Obtener el tiempo que tarda en llegar a destino ((Cantidad de trampas colocadas + 1) * 20)
	method tiempo() = (trampasColocadas + 1) * 20
	
	// Saber si son tramposos (Colocaron trampas en el camino)
	method tramposo() = trampasColocadas > 0
	// Saber si puede desplazarse (Cantidad de trampas colocadas menor a 3)
	method puedeDesplazarse() = trampasColocadas < 3
	// Saber si es rapido (No son tramposos)
	method rapido() = not self.tramposo()
	
	// Colocar una cantidad dada de trampas en el camino.
	method colocarTrampas(cantidad){
		trampasColocadas = trampasColocadas + cantidad
	}
	
	// Viajar.
	method viajar() {
		// Colocan 2 trampas.
		self.colocarTrampas(2)
	}
	
	// Obtener la cantidad de trampas colocadas (Para test)
	method trampasColocadas() = trampasColocadas
}

// Vehiculo del profesor Locovich.
object autoSuperConvertible {
	// Posibles vehiculos para imitar.
	const posiblesImitados = [antiguallaBlindada, superPerrari]
	
	// Imagen del vehiculo actual imitado.
	var vehiculoImitado = superPerrari
	
	// Obtener el tiempo que tarda en llegar a destino (Doble del vehiculo original)
	method tiempo() = vehiculoImitado.tiempo() * 2
	
	// Saber si puede imitar un vehiculo dado.
	method puedeImitar(vehiculo) = posiblesImitados.contains(vehiculo)
	// Saber si puede desplazarse (Si vehiculo imitado puede desplazarse)
	method puedeDesplazarse() = vehiculoImitado.puedeDesplazarse()
	// Saber si es rapido (Si vehiculo imitando es rapido)
	method rapido() = vehiculoImitado.rapido()
	
	// Imitar a un vehiculo dado (Si esta entre los posibles vehiculos para imitar)
	method imitar(vehiculo){
		if(self.puedeImitar(vehiculo)) vehiculoImitado = vehiculo
	}
	
	// Al viajar imita a un vehiculo de la lista de posibles a imitar.
	method viajar() {
		self.imitar(posiblesImitados.anyOne())
	}
	
	// Obtener la imagen del vehiculo actual imitado (Para test)
	method vehiculoImitado() = vehiculoImitado
}