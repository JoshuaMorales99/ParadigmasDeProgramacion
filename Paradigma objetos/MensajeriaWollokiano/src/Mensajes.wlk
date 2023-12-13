// --------------------------------------------------
// 🔸 Mensajes.
// --------------------------------------------------
// Molde para los mensajes.
class Mensaje {
	// Usuario emisor del mensaje.
	const property emisor
	// Tipo de contenido (Puede ser Texto, Audio, Imagen o Contacto)
	const tipoContenido
	
	// Saber si mensaje posee un texto dado (Lo contiene si es parte del nombre del emisor o si el tipo de contenido lo contiene)
	method contiene(texto) = emisor.contiene(texto) or tipoContenido.contiene(texto)
	
	// Obtener el peso del mensaje (En KB) (Datos fijos de transferencia + peso del contenido * factor de la red)
	method peso() = self.cantDatosFijosDeTransferencia() + self.pesoContenido() * self.factorDeRed()
	// Obtener el peso del contenido.
	method pesoContenido() = tipoContenido.peso()
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
	
	// Saber si el contenido del mensaje posee un texto dado (El texto del mensaje es igual al texto dado)
	method contiene(texto) = mensaje.contains(texto)
	
	// Obtener el peso del contenido (1 KB por caracter)
	method peso() = 1 * self.cantCaracteres()
	// Obtener la cantidad de caracteres del mansaje.
	method cantCaracteres() = mensaje.size()
}

// Molde para los audios. 
class Audio {
	// Duracion del audio (En segundos)
	const duracion
	
	// Saber si el contenido del mensaje posee un texto dado (No lo posee)
	method contiene(texto) = false
	
	// Obtener el peso del contenido (1.2 KB por segundos)
	method peso() = 1.2 * duracion
}

// Molde para las imagenes.
class Imagen {
	// Alto de la imagen (En pixeles)
	const alto
	// Ancho de la imagen (En pixeles)
	const ancho
	// Modo de complesion (original, Variable o maxima)
	const modoCompresion
	
	// Saber si el contenido del mensaje posee un texto dado (No lo posee)
	method contiene(texto) = false
	
	// Obtener la cantidad total de pixeles (Ancho de la imagen * Alto de la imagen)
	method cantTotalPixeles() = ancho * alto
	// Obtener el peso del contenido (2 KB * cantidad de pixeles a enviar dependiendo del modo de compresion)
	method peso() = 2 * modoCompresion.cantAEnviar(self.cantTotalPixeles())
}

// Molde para los gif.
class Gif inherits Imagen {
	// Cantidad de cuadros.
	const cantCuadros
	
	// Obtener el peso del contenido (2 KB * Cantidad de pixeles a enviar dependiendo del modo de compresion * cantidad de cuadros)
	override method peso() = super() * cantCuadros
}

// Molde para los contactos.
class Contacto {
	// Usuario que se envia.
	const property usuario
	
	// Saber si el contenido del mensaje posee un texto dado (El usuario es igual al texto dado)
	method contiene(texto) = usuario.contiene(texto)
	
	// Obtener el peso del contenido (Siempre 3 KB)
	method peso() = 3
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