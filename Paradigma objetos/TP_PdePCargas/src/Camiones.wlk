/*===================================================
 CAMIONES.
===================================================*/
object verdurin {
	// Cantidad de cajones para transportar (Inicialmente son 10 cajones)
	var cantCajones = 10
	// Kilometraje actual.
	var kilometraje = 700000
	
	// Saber el peso de la carga.
	method pesoCarga() = cantCajones * 50
	// Saber su velocidad maxima.
	method velocidadMaxima() = 80 - self.pesoCarga().div(500)
	
	// Indicar cantidad de cajones a transportar.
	method cantCajones(nroCajones) {
		cantCajones = nroCajones
	}
	// Sumar kilometros realizados.
	method sumarKilometros(cantidad) {
		kilometraje += cantidad
	}
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {
		self.sumarKilometros(distancia)
	}
	
}

object scanion5000 {
	// Siempre esta cargado a su maxima capacidad (5000 litros)
	const capacidadMaxima = 5000
	// Densidad del liquido transportado (Como no dice nada, asumo que es cte.)
	const densidadLiquido = 10
	
	// Saber el peso de la carga.
	method pesoCarga() = densidadLiquido * capacidadMaxima
	// Saber su velocidad maxima.
	method velocidadMaxima() = 140
	
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {}
	
}

object cerealitas {
	// Nivel de deterioro (Inicialmente es 0)
	var nivelDeterioro = 0
	// Para cada viaje, se determina la cantidad de carga a llevar.
	var property pesoCarga = 0
	
	// Saber la velocidad excedida (velocidadMaxima - 45)
	method velocidadExcedida(velPermitida) = 0.max(self.velocidadMaxima() - velPermitida)
	
	// Aumentar nivel de deterioro.
	method nivelDeterioro(nuevoNivelDeterioro) {
		nivelDeterioro = nuevoNivelDeterioro
	}
	// Saber su velocidad maxima.
	method velocidadMaxima() {
		// Si su nivel de deterioro es menor a 10, la velocidad es 40km/h.
		if(nivelDeterioro < 10) return 40
		// Sino, es de 60km/h - su nivel de deterioro.
		return 0.max(60 - nivelDeterioro)
	}
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {
		nivelDeterioro += self.velocidadExcedida(45)
	}
	
}