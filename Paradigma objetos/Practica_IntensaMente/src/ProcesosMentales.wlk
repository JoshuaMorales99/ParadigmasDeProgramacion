// -----------------------------------------------------------------------
// 🔸 Procesos mentales.
// -----------------------------------------------------------------------
object asentamiento {
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Asentar todos los recuerdos del dia.
		unaChica.asentarRecuerdos(unaChica.recuerdosDelDia())
	}
}

// Molde para los diferentes tipos de asentamiento selectivo.
class AsentamientoSelectivo {
	const palabra
	
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Asentar todos los recuerdos del dia que posean la palabra establecida.
		unaChica.asentarRecuerdos(unaChica.recuerdosCon(palabra))
	}
}

object profundizacion {
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Agregar los recuerdos profundos a la memoria de largo plazo.
		unaChica.agregarLargoPlazo(unaChica.recuerdosProfundos())
	}
}

object controlHormonal {
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Si hay un desequilibrio hormonal, generarlo.
		if(unaChica.hayDesequilibrioHormonal()) unaChica.desequilibrioHormonal()
	}
}

object restauracionCognitiva {
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Aumentar el nivel de felicidad en 100.
		unaChica.aumentarFelicidad(100)
	}
}

object liberacion {
	// Desencadenar proceso mental.
	method desencadenarEn(unaChica) {
		// Todos los recuerdos del dia se liberan.
		unaChica.liberarRecuerdosDelDia()
	}
}