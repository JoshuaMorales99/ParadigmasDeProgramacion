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
	// Fecha de nacimiento.
	const fechaDeNacimiento
	// Pensamiento actual.
	var pensamientoActual = null
	
	// Recuerdos del dia.
	const property recuerdosDelDia = []
	// Pensamientos centrales (No tienen un orden particular y no tienen repetidos)
	const property pensamientosCentrales = #{}
	// Memoria a largo plazo (Property para test)
	const property memoriaLargoPlazo = []
	// Procesos mentales en la mente de la chica.
	const procesosMentales = []
	
	// Obtener su nivel de felicidad.
	method felicidad() = felicidad
	// Obtener su edad.
	method edad() = new Date().year() - fechaDeNacimiento.year()
	// Obtener los recuerdos del dia que contengan una palabra dada.
	method recuerdosCon(unaPalabra) = recuerdosDelDia.filter{recuerdoDelDia => recuerdoDelDia.contiene(unaPalabra)}
	// Obtener de los recuerdos del dia los que son profundos.
	method recuerdosProfundos() = recuerdosDelDia.filter{recuerdoDelDia => self.esRecuerdoProfundo(recuerdoDelDia)}
	// Obtener el pensamiento central mas antiguo.
	method pensamientoCentralMasAntiguo() = pensamientosCentrales.min{pensamientoCentral => pensamientoCentral.fecha()}
	
	// Saber si se hay un desequilibrio hormonal (Hay pensamiento central en memoria a largo plazo o misma emocion dominante en todos los recuerdos del dia)
	method hayDesequilibrioHormonal() = self.pensamientoCentralEnLargoPlazo() or self.mismaEmocionEnElDia()
	// Saber si un recuerdo dado es un pensamiento central.
	method esPensamientoCentral(unRecuerdo) = pensamientosCentrales.contains(unRecuerdo)
	// Saber si un recuerdo dado es profundo (Recuerdos no centrales del dia y no negados por el estado de animo actual)
	method esRecuerdoProfundo(unRecuerdo) = not self.esPensamientoCentral(unRecuerdo) and not self.niega(unRecuerdo)
	// Saber si hay un pensamiento central en la memoria a largo plazo.
	method pensamientoCentralEnLargoPlazo() = pensamientosCentrales.any{pensamientoCentral => memoriaLargoPlazo.contains(pensamientoCentral)}
	// Saber si hubo misma emocion dominante en todos los recuerdos del dia.
	method mismaEmocionEnElDia() = recuerdosDelDia.all{recuerdoDelDia => recuerdoDelDia.emocion() == recuerdosDelDia.head().emocion()}
	
	// Agregar recuerdo a los pensamientos centrales.
	method agregarPensamientoCentral(unRecuerdo) {
		pensamientosCentrales.add(unRecuerdo)
	}
	
	// Verificar nivel de felicidad (No debe se menor a 1)
	method verificarFelicidad() {
		// Si es menor a 1, se lanza una excepcion.
		if(felicidad < 1) throw new Exception(message = "La felicidad de la chica esta por debajo de 1")
	}
	
	// Disminuir nivel de felicidad en un determinado porcentaje.
	method disminuirFelicidad(porcentaje) {
		// Disminuir nivel de felicidad.
		felicidad = felicidad - felicidad * porcentaje
		// Verificar su nivel de felicidad.
		self.verificarFelicidad()
	}
	
	// Asentar todos los recuerdos dados.
	method asentarRecuerdos(unosRecuerdos) {
		unosRecuerdos.forEach{recuerdo => self.asentar(recuerdo)}
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
	
	// - PUNTO 1: Vivir un evento.
	method vivirEvento(unaDescripcion) {
		// Agregar a los recuerdos del dia.
		recuerdosDelDia.add(new Recuerdo(descripcion = unaDescripcion, emocion = emocionDominante))
	}
	
	// - PUNTO 2: Asentar recuerdo.
	method asentar(unRecuerdo) {
		unRecuerdo.asentarEn(self)
	}
	
	// - PUNTO 3: Obtener los recuerdos recientes del dia (Ultimos 5 recuerdos del dia)
	method recuerdosRecientes() = recuerdosDelDia.reverse().take(5)
	
	// - PUNTO 4: Obtener los pensamientos centrales.
	// Para esto, se agrego el property en el atributo 'pensamientosCentrales'.
	
	// - PUNTO 5: Obtener los pensamientos centrales dificiles de explicar.
	method pensamientosDificiles() = pensamientosCentrales.filter{pensamientoCentral => pensamientoCentral.esDificil()}
	
	// - PUNTO 6: Saber si puede negar un recuerdo dado.
	method niega(unRecuerdo) = emocionDominante.niega(unRecuerdo)
	
	// - PUNTO 7: Enviar a la chica a dormir (Desencadenar los procesos mentales dados)
	method dormir() {
		procesosMentales.forEach{procesoMental => procesoMental.desencadenarEn(self)}
	}
	
	// - PUNTO 8: Rememorar recuerdo de largo plazo.
	method rememorar() {
		pensamientoActual = memoriaLargoPlazo.findOrElse(
			// Rememorar algun recuerdo de largo plazo.
			{recuerdo => recuerdo.esRememorable(self)},
			// Si no hay recuerdo parar rememorar, se lanza una excepcion.
			{throw new Exception(message = "Sin recuerdos que rememorar")}
		)
	}
	
	// - PUNTO 9: Obtener la cantidad de repeticiones de un recuerdo en la memoria a largo plazo.
	method repeticionesEnMemoriaLargoPlazoDe(unRecuerdo) = memoriaLargoPlazo.occurrencesOf(unRecuerdo)
	
	// - PUNTO 10: Saber si tiene un deja vu (Esta pensando algo que es un recuerdo repetido en la memoria a largo plazo)
	method dejaVu() = memoriaLargoPlazo.contains(pensamientoActual)
	
	// Obtener el recuerdo que se encuentra en el pensamiento actual (Para Test)
	method pensamientoActual() = pensamientoActual
	
	// Agregar un proceso dado en los procesos mentales (Para Test)
	method agregarProcesoMental(unProceso) {
		procesosMentales.add(unProceso)
	}
}

// Riley es una chica de 11 anios que tiene una felicidad inicial de 1000 (Se puso como emocion dominante a la alegria para los test)
const riley = new Chica(felicidad = 1000, emocionDominante = alegria, fechaDeNacimiento = new Date().minusDays(4015))