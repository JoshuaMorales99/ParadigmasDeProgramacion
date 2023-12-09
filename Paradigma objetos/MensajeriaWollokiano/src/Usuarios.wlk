// --------------------------------------------------
// 🔸 Usuarios.
// --------------------------------------------------
// Molde para los usuarios.
class Usuario {
	// Cantidad de espacio en la memoria (En KB)
	var cantMemoria
	// Chats.
	const chats = #{}
	
	// Saber si hay memoria suficiente (cantidad de KB a ocupar es menor o igual a la cantidad de memoria)
	method hayMemoriaSuficiente(cantAOcupar) = cantMemoria >= cantAOcupar
	
	// Unirse a un chat.
	method unirse(chat) {
		chats.add(chat)
	}
}