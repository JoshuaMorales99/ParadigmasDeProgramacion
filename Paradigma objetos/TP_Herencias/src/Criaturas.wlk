// ----------------------------------------------------------------
// 🔸 Criaturas.
// ----------------------------------------------------------------
// Molde para nuestras criaturas.
class Criatura {
	// Fuerza de la criatura.
	const fuerza
	
	// Obtener la fuerza.
	method fuerza() = fuerza
}

// Molde para criaturas magicas.
class Magica inherits Criatura {
	// Cantidad de alteraciones geneticas.
	const alteraciones
	
	// Obtener el poder magico dado un nivel de poder.
	method poderMagico(nivelPoder) = self.fuerza() * alteraciones + nivelPoder
}

// Molde para las criaturas manipuladoras de oscuridad.
class Oscuridad inherits Magica {
	// Obtener el poder magico destructor.
	override method poderMagico(nivelPoder) = super(super(nivelPoder))
	// Obtener la fuerza.
	override method fuerza() = 1000
}

// Molde para las criaturas manipuladoras de luz.
class Luz inherits Magica(fuerza = 100) {
	
}