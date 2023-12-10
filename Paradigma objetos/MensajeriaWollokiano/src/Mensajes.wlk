// --------------------------------------------------
// 🔸 Mensajes.
// --------------------------------------------------
// Molde para los mensajes.
class Mensaje {
	// Usuario emisor del mensaje.
	const property emisor
	// Tipo de contenido (Puede ser Texto, Audio, Imagen o Contacto)
	const tipoContenido
	
	// Obtener el peso del mensaje (En KB) (Datos fijos de transferencia + peso del contenido * factor de la red)
	method pesoMensaje() = self.cantDatosFijosDeTransferencia() + self.pesoContenido() * self.factorDeRed()
	// Obtener el peso del contenido.
	method pesoContenido() = tipoContenido.pesoContenido()
	// Obtener la cantidad de datos fijos de transferencia.
	method cantDatosFijosDeTransferencia() = 5
	// Obtener el factor de la red.
	method factorDeRed() = 1.3
}

// --------------------------------------------------
// 🔸 Tipo de contenidos en mensajes.
// --------------------------------------------------
// Molde para los mensajes de texto.
class Texto {
	// Mensaje de texto.
	const mensaje
	
	// Obtener el peso del contenido (1 KB por caracter)
	method pesoContenido() = 1 * self.cantCaracteres()
	// Obtener la cantidad de caracteres del mansaje.
	method cantCaracteres() = mensaje.size()
}

// Molde para los audios. 
class Audio {
	// Duracion del audio (En segundos)
	const duracion
	
	// Obtener el peso del contenido (1.2 KB por segundos)
	method pesoContenido() = 1.2 * duracion
}

// Molde para las imagenes.
class Imagen {
	// Alto de la imagen (En pixeles)
	const alto
	// Ancho de la imagen (En pixeles)
	const ancho
	// Modo de complesion (original, Variable o maxima)
	const modoCompresion
	
	// Obtener la cantidad total de pixeles (Ancho de la imagen * Alto de la imagen)
	method cantTotalPixeles() = ancho * alto
	// Obtener el peso del contenido (2 KB * cantidad de pixeles a enviar dependiendo del modo de compresion)
	method pesoContenido() = 2 * modoCompresion.cantAEnviar(self.cantTotalPixeles())
}

// Molde para los gif.
class Gif inherits Imagen {
	// Cantidad de cuadros.
	const cantCuadros
	
	// Obtener el peso del contenido (2 KB * Cantidad de pixeles a enviar dependiendo del modo de compresion * cantidad de cuadros)
	override method pesoContenido() = super() * cantCuadros
}

// Molde para los contactos.
class Contacto {
	// Usuario que se envia.
	const property usuario
	
	// Obtener el peso del contenido (Siempre 3 KB)
	method pesoContenido() = 3
}

// --------------------------------------------------
// 🔸 Compresion de imagenes.
// --------------------------------------------------
object original {
	// Obtener la cantidad de pixeles a enviar (Se envian todos los pixeles)
	method cantAEnviar(pixeles) = pixeles
}

// Molde para la compresion variable de imagenes.
class Variable {
	// Porcentaje de compresion.
	const porcentaje
	
	// Obtener la cantidad de pixeles a enviar (Se envian el porcentaje de pixeles indicado)
	method cantAEnviar(pixeles) = pixeles * (porcentaje / 100)
}

object maxima {
	// Obtener el maximo de pixeles posible a enviar (Igual a 10000)
	method maxPixeles() = 10000
	
	// Obtener la cantidad de pixeles a enviar (Se envian hasta el maximo de pixeles posibles a enviar)
	method cantAEnviar(pixeles) = pixeles.min(self.maxPixeles())
}