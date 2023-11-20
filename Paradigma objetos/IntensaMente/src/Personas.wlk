import Recuerdos.*
import Emociones.*

// -----------------------------------------------------------------------
// 🔸 Chicas.
// -----------------------------------------------------------------------
// Molde para las chicas.
class Chica {
	// Nivel de felicidad.
	var felicidad
	// Emocion dominante (Puede cambiar en cualquier momento)
	var emocionDominante
	
	// Recuerdos del dia.
	const property recuerdosDelDia = []
	// Pensamientos centrales (No tienen un orden particular y no tienen repetidos)
	const property pensamientosCentrales = #{}
	// Memoria a largo plazo.
	const property memoriaLargoPlazo = [] // property para los Tests.
	// Procesos mentales en la mente de la chica.
	const procesosMentales = []
	
	// GETTER: Saber la felicidad de la chica.
	method felicidad() = felicidad
	// Saber los recuerdos del dia que contengan una palabra dada.
	method recuerdosCon(palabra) = recuerdosDelDia.filter{recuerdoDelDia => recuerdoDelDia.contiene(palabra)}
	// Saber si un recuerdo es un pensamiento central (Recuerdo contenido en el pensamiento central)
	method esPensamientoCentral(recuerdo) = pensamientosCentrales.contains(recuerdo)
	// Saber si un recuerdo es profundo (Recuerdos no centrales del dia y no negados por el estado de animo actual)
	method esRecuerdoProfundo(recuerdo) = not self.esPensamientoCentral(recuerdo) and not self.niega(recuerdo)
	// Saber los recuerdos profundos de los recuerdos dados.
	method recuerdosProfundos() = recuerdosDelDia.filter{recuerdoDelDia => self.esRecuerdoProfundo(recuerdoDelDia)}
	// Saber si se hay un desequilibrio hormonal (Hay pensamiento central en memoria a largo plazo o misma emocion dominante en todos los recuerdos del dia)
	method hayDesequilibrioHormonal() = self.pensamientoCentralEnLargoPlazo() or self.mismaEmocionEnElDia()
	// Saber si hay un pensamiento central en la memoria a largo plazo.
	method pensamientoCentralEnLargoPlazo() = pensamientosCentrales.any{pensamientoCentral => memoriaLargoPlazo.contains(pensamientoCentral)}
	// Saber si hubo misma emocion dominante en todos los recuerdos del dia.
	method mismaEmocionEnElDia() = recuerdosDelDia.all{recuerdoDelDia => recuerdoDelDia.emocion() == recuerdosDelDia.head().emocion()}
	// Saber el pensamiento central mas antiguo.
	method pensamientoCentralMasAntiguo() = pensamientosCentrales.min{pensamientoCentral => pensamientoCentral.fecha()}
	
	// Agregar recuerdo a los pensamientos centrales.
	method agregarPensamientoCentral(unRecuerdo) {
		pensamientosCentrales.add(unRecuerdo)
	}
	
	// Disminuir nivel de felicidad en un determinado porcentaje.
	method disminuirFelicidad(porcentaje) {
		// Disminuir nivel de felicidad.
		felicidad = felicidad - felicidad * porcentaje
		
		// Verificar que su nivel de felicidad no sea menor a 1.
		if(felicidad < 1) {
			// Si es menor a 1, se lanza una excepcion.
			throw new Exception(message = "La felicidad de la chica esta por debajo de 1")
		}
	}
	
	// Asentar todos los recuerdos dados.
	method asentarRecuerdos(recuerdos) {
		recuerdos.forEach{recuerdo => self.asentar(recuerdo)}
	}
	
	// Agregar los recuerdos a la memoria de largo plazo.
	method agregarLargoPlazo(unosRecuerdos) {
		memoriaLargoPlazo.addAll(unosRecuerdos)
	}
	
	// Generar un desequilibrio hormonal.
	method desequilibrioHormonal() {
		// Disminuir el nivel de felicidad un 15% (0.15)
		self.disminuirFelicidad(0.15)
		// Perder los tres pensamientos centrales mas antiguos.
		3.times{i => pensamientosCentrales.remove(self.pensamientoCentralMasAntiguo())}
	}
	
	// Aumentar el nivel de felicidad en una cantidad dada (No puede ser mayor a 1000)
	method aumentarFelicidad(cantidad) {
		felicidad = 1000.min(felicidad + cantidad)
	}
	
	// Liberar los recuerdos del dia.
	method liberarRecuerdosDelDia() {
		recuerdosDelDia.clear()
	}
	
	// Agregar un proceso dado en los procesos mentales (Para Test)
	method agregarProcesoMental(proceso) {
		procesosMentales.add(proceso)
	}
	
	// - PUNTO 1: Vivir un evento.
	method vivirEvento(unaDescripcion) {
		// Registrar recuerdo asociado (incluye una descripción, fecha y la emoción dominante en ese momento)
		const recuerdo = new Recuerdo(descripcion = unaDescripcion, emocion = emocionDominante)
		// Agregar a los recuerdos del dia.
		recuerdosDelDia.add(recuerdo)
	}
	
	// - PUNTO 2: Asentar recuerdo.
	method asentar(unRecuerdo) {
		unRecuerdo.asentarEn(self)
	}
	
	// - PUNTO 3: Conocer los recuerdos recientes del dia (Ultimos 5 recuerdos del dia)
	method recuerdosRecientes() = recuerdosDelDia.reverse().take(5)
	
	// - PUNTO 4: Conocer los pensamientos centrales.
	// Para esto, se agrego el property en el atributo 'pensamientosCentrales'.
	
	// - PUNTO 5: Conocer los pensamientos centrales dificiles de explicar.
	method pensamientosDificiles() = pensamientosCentrales.filter{pensamientoCentral => pensamientoCentral.esDificil()}
	
	// - PUNTO 6: Negar recuerdos.
	method niega(recuerdo) = emocionDominante.niega(recuerdo)
	
	// - PUNTO 7: Enviar a la chica a dormir (Desencadenar los procesos mentales dados)
	method dormir() {
		procesosMentales.forEach{procesoMental => procesoMental.desencadenarEn(self)}
	}
}

// Riley es una chica de 11 anios que tiene una felicidad inicial de 1000 (Se puso como emocion dominante a la alegria para los test)
const riley = new Chica(felicidad = 1000, emocionDominante = alegria)