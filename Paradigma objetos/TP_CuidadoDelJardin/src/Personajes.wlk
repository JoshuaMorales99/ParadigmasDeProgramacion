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
	
	// Establecer su nivel de relax (Para test)
	method relax(nuevoNivelRelax) {
		relax = nuevoNivelRelax
	}
}

object adriano {
	
}