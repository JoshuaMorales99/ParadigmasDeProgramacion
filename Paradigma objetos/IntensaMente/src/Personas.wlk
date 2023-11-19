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
	var dominante
	
	// Recuerdos del dia.
	const property recuerdosDelDia = [] // Property para los Test.
	// Pensamientos centrales (No tienen un orden particular y no tienen repetidos)
	const property pensamientosCentrales = #{}
	
	// GETTER: Saber la felicidad de la chica.
	method felicidad() = felicidad
	
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
	
	// - PUNTO 1: Vivir un evento.
	method vivirEvento(unaDescripcion) {
		// Registrar recuerdo asociado (incluye una descripción, fecha y la emoción dominante en ese momento)
		const recuerdo = new Recuerdo(descripcion = unaDescripcion, emocion = dominante)
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
}

// Riley es una chica de 11 anios que tiene una felicidad inicial de 1000 (Se puso como dominante a la alegria para los test)
const riley = new Chica(felicidad = 1000, dominante = alegria)