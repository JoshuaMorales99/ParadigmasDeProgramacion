// -----------------------------------------------------------------------
// 🔸 Recuerdos.
// -----------------------------------------------------------------------
// Molde para los recuerdos.
class Recuerdo {
	// Datos del recuerdo.
	const descripcion = ""
	const fecha = new Date()
	const emocion
	
	// Saber si el recuerdo es dificil de explicar (Posee mas de 10 palabras en su descripcion)
	method esDificil() = descripcion.words().size() > 10
	
	// Asentar el recuerdo en una persona dada.
	method asentarEn(chica) {
		// Al asentar un recuerdo, se tiene consecuencias dependiendo de la emocion del recuerdo.
		emocion.aplicarConcecuencias(chica, self)
	}
}
