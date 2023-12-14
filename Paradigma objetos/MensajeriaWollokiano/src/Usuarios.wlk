// --------------------------------------------------
// 🔸 Usuarios.
// --------------------------------------------------
// Molde para los usuarios.
class Usuario {
	// Nombre de usuario.
	const nombre
	// Cantidad de espacio en la memoria (En KB)
	var cantMemoria
	// Chats.
	const chats = #{}
	
	// Saber si hay memoria suficiente (cantidad de KB a ocupar es menor o igual a la cantidad de memoria)
	method hayMemoriaSuficiente(cantAOcupar) = cantMemoria >= cantAOcupar
	// Saber si el nombre del usuario contiene un texto dado.
	method contiene(texto) = nombre.contains(texto)
	
	// GETTER: Obtener la cantidad de memoria (Para test)
	method cantMemoria() = cantMemoria
	// PUNTO 3 - Obtener los chats que posean algun mensaje con un texto dado.
	method buscarChatsCon(texto) = chats.filter{chat => chat.contiene(texto)}
	// PUNTO 4 - Obtener sus mensajes mas pesados (Mensaje más pesado de cada uno de sus chat)
	method mensajesMasPesados() = chats.map{chat => chat.mensajeMasPesado()}
	
	// Unirse a un chat dado.
	method unirse(chat) {
		chats.add(chat)
	}
	
	// Salir de un chat dado.
	method salir(chat) {
		chats.remove(chat)
	}
	
	// Reducir una cantidad de memoria dada.
	method reducirMemoria(cantidad) {
		cantMemoria = 0.max(cantMemoria - cantidad)
	}
}