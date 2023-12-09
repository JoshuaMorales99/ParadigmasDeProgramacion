// --------------------------------------------------
// 🔸 Chats.
// --------------------------------------------------
// Molde para los chats.
class Chat {
	// Participantes del chat.
	const participantes = #{}
	// Mensajes almacenados.
	const mensajes = []
	
	// Saber si un usuario dado es un participante del chat.
	method esParticipante(usuario) = participantes.contains(usuario)
	// Saber si cada participante posee espacio suficiente en memoria.
	method espacioSuficiente(cantAOcupar) = participantes.all{participante => participante.hayMemoriaSuficiente(cantAOcupar)}
	
	// Enviar un mensaje dado.
	method enviar(mensaje) {
		// Verificar que el usuario emisor del mensaje este entre los participantes del chat.
		self.verificarParticipantes(mensaje.emisor())
		// Verificar que cada participante del chat tenga espacio suficiente en memoria.
		self.verificarMemorias(mensaje.pesoMensaje())
		
		// Almacenar mensaje en el chat.
		self.almacenarMensaje(mensaje)
	}
	
	// Almacenar mensaje.
	method almacenarMensaje(mensaje) {
		mensajes.add(mensaje)
	}
	
	// Verificar que el usuario dado este entre los participantes del chat.
	method verificarParticipantes(usuario) {
		if(not self.esParticipante(usuario)) throw new Exception(message = "El usuario emisor no es un participante del chat")
	}
	
	// Verificar que cada participante del chat tenga espacio suficiente en memoria.
	method verificarMemorias(cantAOcupar) {
		if(not self.espacioSuficiente(cantAOcupar)) throw new Exception(message = "Algun participante no posee espacio suficiente en memoria")
	}
}