// --------------------------------------------------
// 🔸 Chats.
// --------------------------------------------------
// Molde para los chats clasicos.
class Chat {
	// Participantes del chat.
	const participantes = #{}
	// Mensajes almacenados (Property para test)
	const property mensajes = []
	
	// Saber si un usuario dado es un participante del chat.
	method esParticipante(usuario) = participantes.contains(usuario)
	// Saber si cada participante posee espacio suficiente en memoria.
	method espacioSuficiente(cantAOcupar) = participantes.all{participante => participante.hayMemoriaSuficiente(cantAOcupar)}
	// Saber si el chat posee algun mensaje que contenga un texto dado.
	method contiene(texto) = mensajes.any{mensaje => mensaje.contiene(texto)}
	
	// Obtener la cantidad de mensajes almacenados.
	method cantMensajes() = mensajes.size()
	// PUNTO 1: Obtener el espacio que ocupa el chat (Suma de todos los pesos de los mensajes)
	method peso() = mensajes.sum{mensaje => mensaje.peso()}
	
	// PUNTO 2: Enviar un mensaje dado.
	method enviar(mensaje) {
		// Verificar si se cumplen las restricciones del chat.
		self.verificarRestricciones(mensaje)
		
		// Reducir la memoria de los participantes.
		self.reducirMemoriaUsuarios(mensaje.peso())
		// Almacenar mensaje en el chat.
		self.almacenarMensaje(mensaje)
	}
	
	// Almacenar mensaje.
	method almacenarMensaje(mensaje) {
		mensajes.add(mensaje)
	}
	
	// Reducir la memoria de los participantes.
	method reducirMemoriaUsuarios(cantidad) {
		participantes.forEach{participante => participante.reducirMemoria(cantidad)}
	}
	
	// Verificar restricciones del chat.
	method verificarRestricciones(mensaje) {
		// Verificar que el usuario emisor del mensaje este entre los participantes del chat.
		self.verificarParticipantes(mensaje.emisor())
		// Verificar que cada participante del chat tenga espacio suficiente en memoria.
		self.verificarMemorias(mensaje.peso())
	}
	
	// Verificar que el usuario dado este entre los participantes del chat.
	method verificarParticipantes(usuario) {
		if(not self.esParticipante(usuario)) throw new Exception(message = "El usuario emisor no es un participante del chat")
	}
	
	// Verificar que cada participante del chat tenga espacio suficiente en memoria.
	method verificarMemorias(cantAOcupar) {
		if(not self.espacioSuficiente(cantAOcupar)) throw new Exception(message = "Algun participante no posee espacio suficiente en memoria")
	}
	
	// Agregar participantes al chat.
	method agregarParticipante(usuario) {
		// Agregar al usuario.
		participantes.add(usuario)
		// Unirse al chat.
		usuario.unirse(self)
	}
	
	// Eliminar participante del chat.
	method eliminarParticipante(usuario) {
		// Eliminar al usuario.
		participantes.remove(usuario)
		// Salir del chat.
		usuario.salir(self)
	}
}

// Molde para los chats premiums.
class ChatPremium inherits Chat {
	// Duenio del chat.
	const property duenio
	// Restricciones.
	var otraRestriccion
	
	// SETTER: Cambiar restriccion.
	method otraRestriccion(restriccion) {
		otraRestriccion = restriccion
	}
	
	// Verificar las restricciones del chat.
	override method verificarRestricciones(mensaje) {
		// Verificar las restricciones de un chat clasico.
		super(mensaje)
		// Verificar la restriccion adicional.
		self.verificarRestriccionAdicional(mensaje)
	}
	
	// Verificar la restriccion adicional.
	method verificarRestriccionAdicional(mensaje) {
		if(not otraRestriccion.cumpleRestriccion(self, mensaje)) throw new Exception(message = "No cumple con la restriccion del chat premium")
	}
}

// --------------------------------------------------
// 🔸 Restricciones de los chats premium.
// --------------------------------------------------
object difusion {
	// Saber si un chat dado cumple la restriccion (Solo el duenio del chat puede mandar mensajes)
	method cumpleRestriccion(chat, mensaje) = chat.duenio() == mensaje.emisor()
}

// Molde para las restricciones con un limite de mensajes.
class Restringido {
	// Limite de mensajes permitidos.
	const limite
	
	// Saber si un chat dado cumple la restriccion (Mientras la cantidad de mensajes del chat sea menor a su limite)
	method cumpleRestriccion(chat, mensaje) = chat.cantMensajes() + 1 <= limite
}

// Molde para las restricciones con un peso maximo en mensajes.
class Ahorro {
	// Peso maximo de los mensajes permitidos.
	const pesoMaximo
	
	// Saber si un chat dado cumple la restriccion (Mientras no se exceda el peso maximo de mensajes establecido)
	method cumpleRestriccion(chat, mensaje) = mensaje.peso() <= pesoMaximo
}