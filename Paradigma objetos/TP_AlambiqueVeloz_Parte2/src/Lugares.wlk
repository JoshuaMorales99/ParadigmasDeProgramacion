import Vehiculos.*

/*================================================================
🔸 Lugares.
================================================================*/
object paris {
	// Saber si el vehiculo dado puede visitar el lugar (Debe poder desplazarse)
	method puedeVisitar(vehiculo) = vehiculo.puedeDesplazarse()
}

object buenosAires {
	// Saber si el vehiculo dado puede visitar el lugar (Debe ser rápido)
	method puedeVisitar(vehiculo) = vehiculo.rapido()
}

object bagdad {
	// Saber si el vehiculo dado puede visitar el lugar (No hay restricciones)
	method puedeVisitar(vehiculo) = true
}

object lasVegas {
	// Homenaje actual a otro pais (paris como homenaje predeterminado)
	var homenaje = paris
	
	// Saber si el vehiculo dado puede visitar el lugar (Misma restricción del lugar que se este homenajeando)
	method puedeVisitar(vehiculo) = homenaje.puedeVisitar(vehiculo)
	
	// Establecer el homenaje del lugar (Para test)
	method homenaje(nuevoHomenaje) {
		homenaje = nuevoHomenaje
	}
}