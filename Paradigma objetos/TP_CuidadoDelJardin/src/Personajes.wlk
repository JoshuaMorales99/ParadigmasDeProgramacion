/*================================================================
🔸 Personajes.
================================================================*/
object olivia {
	// Nivel de relax de Olivia (Inicialmente 4)
	var relax = 4
	
	// Obtener la imagen de Olivia.
	method image() = "jardinera.png"
	// Obtener su nivel de relax.
	method relax() = relax
	
	// Trabajar en el jardin.
	method trabajarEnJardin(unJardin) {
		// Si el jardin esta desprolijo al inicio, se estresa 2 puntos.
		if(unJardin.desprolijo()) self.estresar(2)
		// Emprolija el jardin con un nivel equivalente al doble de su nivel de relax.
		unJardin.emprolijar(relax * 2)
		// Se estresa un punto.
		self.estresar(1)
	}
	
	// Estresar en una cantidad de estres (Su nivel de relax no puede ser menor a 1)
	method estresar(nivelEstres) {
		relax = 1.max(relax - nivelEstres)
	}
	
	// Desestresar en una cantidad de desestres.
	method desestresar(nivelDesestres) {
		relax = relax + nivelDesestres
	}
	
	// Tomar un banio de vapor por un tiempo dado.
	method banioVapor(tiempo) {
		self.desestresar(tiempo / 5)
	}
	
	// Recibir masajes.
	method masajes() {
		self.desestresar(3)
	}
	
	// Establecer su nivel de relax (Para test)
	method relax(nuevoNivelRelax) {
		relax = nuevoNivelRelax
	}
}

object adriano {
	// Cantidad de contracturas de Adriano (Inicialmente no tiene)
	var property contracturas = 0
	
	// Obtener la imagen de Adriano.
	method image() = "jardinero.png"
	// Obtener la cantidad de contracturas que posee.
	method contracturas() = contracturas
	
	// Saber si Adriano esta lastimado (Tiene mas de 10 contracturas)
	method lastimado() = contracturas > 10
	
	// Trabajar en un jardin.
	method trabajarEnJardin(unJardin) {
		// Almacenar el esfuerzo que realizó en el trabajo.
		const esfuerzoEjercido = unJardin.malezas()
		
		// Emprolijar el jardin dependiendo si esta lastimado o no.
		if(self.lastimado()) unJardin.emprolijar(1) else unJardin.emprolijar(5)
		// Aumentar la cantidad de contracturas.
		self.contracturar(esfuerzoEjercido)
	}
	
	// Contracturar dado una cantidad de contracturas.
	method contracturar(cantidadContracturas) {
		contracturas = contracturas + 7.min(cantidadContracturas)
	}
	
	// Establecer su cantidad de contracturas.
	method contracturas(nuevoNivelContractura) {
		contracturas = nuevoNivelContractura
	}
}