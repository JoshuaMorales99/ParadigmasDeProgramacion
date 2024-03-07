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
	// Notificaciones pendientes (Property para Test)
	const property notificaciones = #{}
	
	// Saber si hay memoria suficiente (cantidad de KB a ocupar es menor o igual a la cantidad de memoria)
	method hayMemoriaSuficiente(cantAOcupar) = cantMemoria >= cantAOcupar
	// Saber si el nombre del usuario contiene un texto dado.
	method contiene(texto) = nombre.contains(texto)
	
	// PUNTO 3 - Obtener los chats que posean algun mensaje con un texto dado.
	method buscarChatsCon(texto) = chats.filter{chat => chat.contiene(texto)}
	// PUNTO 4 - Obtener sus mensajes mas pesados (Mensaje más pesado de cada uno de sus chat)
	method mensajesMasPesados() = chats.map{chat => chat.mensajeMasPesado()}
	// Obtener las notificaciones de un chat dado.
	method notificacionesDe(chat) = notificaciones.filter{notificacion => notificacion.chat() == chat}
	// PUNTO 5.c - Obtener las notificaciones sin leer.
	method notificacionesSinLeer() = notificaciones.filter{notificacion => not notificacion.leida()}
	
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
	
	// Recibir notificaciones de los chats.
	method notificar(notificacion) {
		notificaciones.add(notificacion)
	}
	
	// PUNTO 5.b - Leer un chat dado (Todas las notificaciones correspondientes a ese chat se marcan como leídas)
	method leer(chat) {
		self.notificacionesDe(chat).forEach{notificacion => notificacion.leer()}
	}
	
	// Obtener la cantidad de memoria (Para test)
	method cantMemoria() = cantMemoria
}