/*================================================================
🔸 Lugares.
================================================================*/
object jardin {
	// Cantidad de malezas que tiene el jardin (Inicialmente 30)
	var malezas = 30
	
	// Obtener la imagen del jardin (Depende si esta desprolijo o no)
	method image() = if(self.desprolijo()) "arbusto-desprolijo.png" else "arbusto.png"
	// Obtener la cantidad de malezas que tiene el jardin.
	method malezas() = malezas
	
	// Saber si el jardin esta desprolijo (Tiene una cantidad de malezas mayor a 20)
	method desprolijo() = malezas > 20	
	// Saber si el nivel de prolijidad es alto (Nivel de prolijidad >= 10)
	method nivelAltoProlijidad(nivelProlijidad) = nivelProlijidad >= 10
	// Saber si el nivel de prolijidad es medio (Nivel de prolijidad entre 3 y 9)
	method nivelMedioProlijidad(nivelProlijidad) = nivelProlijidad.between(3, 9)
	
	// Hacer crecer malezas (Incrementar en 5 la cantidad de malezas)
	method crecerMalezas() {
		malezas = malezas + 5
	}
	
	// Emprolijar el jardin.
	method emprolijar(nivelProlijidad) {
		// Si el nivel de prolijidad es alto, entonces se quitan todas las malezas.
		if(self.nivelAltoProlijidad(nivelProlijidad)) malezas = 0
		// Si el nivel de prolijidad es medio, entonces se quitan la mitad de las malezas.
		if(self.nivelMedioProlijidad(nivelProlijidad)) malezas = malezas.div(2)
	}
	
	// Establecer la cantidad de malezas que tiene el jardin (Para test)
	method malezas(nuevaCantidad) {
		malezas = nuevaCantidad
	}
}

object spa {
	
}