import Emociones.*

// -----------------------------------------------------------------------
// 🔸 Recuerdos.
// -----------------------------------------------------------------------
// Molde para los recuerdos.
class Recuerdo {
	// Datos del recuerdo.
	const descripcion = ""
	const property fecha = new Date()
	const property emocion
	
	// Saber si el recuerdo es dificil de explicar (Posee mas de 10 palabras en su descripcion)
	method esDificil() = descripcion.words().size() > 10
	// Saber si el recuerdo contiene una palabra dada.
	method contiene(unaPalabra) = descripcion.contains(unaPalabra)
	// Saber si el recuerdo es rememorable.
	method esRememorable(unaChica) = new Date().year() - fecha.year() > unaChica.edad() / 2
	
	// Asentar el recuerdo en una persona dada.
	method asentarEn(unaChica) {
		// Al asentar un recuerdo, se tiene consecuencias dependiendo de la emocion del recuerdo.
		emocion.aplicarConcecuencias(unaChica, self)
	}
}
