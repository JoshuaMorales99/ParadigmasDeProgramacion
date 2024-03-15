import Empresas.*

/*===================================================
🔸 CAMIONES.
===================================================*/

object verdurin {
	// Cantidad de cajones para transportar (Inicialmente 10 cajones)
	var cantCajones = 10
	// Kilometraje actual (Inicialmente 700000)
	var kilometraje = 700000
	
	// Obtener la empresa duenia del camion.
	method empresa() = pdepCargas
	// Obtener el peso total de la carga (Cada cajon pesa 50 kg)
	method pesoCarga() = cantCajones * 50
	// Obtener la velocidad maxima (80 km/h - 1 km/h por cada 500 kg)
	method velocidadMaxima() = 80 - self.pesoCarga().div(500)
	
	// Establecer la cantidad de cajones a transportar.
	method cantCajones(nroCajones) {
		cantCajones = nroCajones
	}
	
	// Sumar kilometros realizados al kilometraje.
	method sumarKilometros(cantidad) {
		kilometraje = kilometraje + cantidad
	}
	
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {
		self.sumarKilometros(distancia)
	}
	
	// Obtener el kilometraje actual (Para test)
	method kilometraje() = kilometraje
}

object scanion5000 {
	// Obtener la empresa duenia del camion.
	method empresa() = pdepCargas
	// Obtener la capacidad maxima de carga (Siempre carga 5000 litros)
	method capacidadMaxima() = 5000
	// Obtener la densidad del liquido transportado (Asumo que siempre es 10 indep. del liquido transportado)
	method densidadLiquido() = 10
	// Obtener el peso de la carga (Densidad * volumen)
	method pesoCarga() = self.densidadLiquido() * self.capacidadMaxima()
	// Obtener la velocidad maxima (Siempre es 140 km/h)
	method velocidadMaxima() = 140
	
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {
		// No le afecta en absoluto.
	}
}

object cerealitas {
	// Nivel de deterioro (Inicialmente 0) (Property para test)
	var property nivelDeterioro = 0
	// Cantidad de carga a transportar.
	var pesoCarga = 0
	
	// Saber si esta en buen estado (Nivel de deterioro < 10)
	method estaEnBuenEstado() = nivelDeterioro < 10
	
	// Obtener la empresa duenia del camion.
	method empresa() = pdepCargas
	// Obtener la velocidad maxima (Depende de su estado de deterioro)
	method velocidadMaxima() = if(self.estaEnBuenEstado()) self.velocidadPorBuenEstado() else self.velocidadPorMalEstado()
	// Obtener la velocidad maxima por buen estado (Igual a 40)
	method velocidadPorBuenEstado() = 40
	// Obtener la velocidad maxima por mal estado (60 - su nivel de deterioro)
	method velocidadPorMalEstado() = 0.max(60 - nivelDeterioro)
	// Obtener la velocidad excedida dada la velocidad maxima permitida (Velocidad maxima - velocidad permitida)
	method velocidadExcedida(velPermitida) = 0.max(self.velocidadMaxima() - velPermitida)
	
	// Determinar la cantidad de carga a llevar.
	method pesoCarga(kg) {
		pesoCarga = kg
	}
	
	// Recorrer cierta cantidad de kilometros a cierta velocidad.
	method recorrer(distancia, velocidad) {
		// Su nivel de deterioro aumenta al hacer viajes (Aumenta en 1 por cada 1 km/h que se excede de los 45 km/h)
		nivelDeterioro = nivelDeterioro + self.velocidadExcedida(45)
	}
	
}