// -------------------------------------------------------------
// 🔸 La parrilla del nuevo Miguelito. 
// -------------------------------------------------------------
object parrillaMiguelito {
	// Ingresos de la parrilla.
	var ingresos = 0
	// Menu de la parrilla.
	const menu = #{}
	// Historial de comensales atendidos (Property para tests)
	const property historialComensales = #{}
	
	// Obtener del menu los platillos validos que puede comprar un comensal dado.
	method platillosValidosPara(comensal) = menu.filter{platillo => comensal.puedeComprar(platillo)}
	// GETTER: Obtener los ingresos de la parrilla (Para tests)
	method ingresos() = ingresos
	// Obtener la cantidad total de dinero a entregar a cada comensal registrado en el historial.
	method cantTotalPromocion(cantidad) = self.cantComensalesRegistrados() * cantidad
	// Obtener la cantidad de comensales registrados en el historial.
	method cantComensalesRegistrados() = historialComensales.size()
	
	// Ofrecer menu a un comensal dado.
	method ofrecerMenuA(comensal) {
		// Verificamos que haya algun platillo que pueda comprar.
		self.verificarMenu(comensal)
		// Comprar el platillo de maxima valoracion del menu.
		self.cobrar(comensal)
		// Agregar al comensal al historial de comensales.
		self.agregarAlHistorial(comensal)
	}
	
	// Cobrar al comensal dado el plato elegido.
	method cobrar(comensal) {
		// Elegir platillo valido del menu (El platillo valido es aquel que puede comprar)
		const platillo = comensal.elegirPlatillo(self.platillosValidosPara(comensal))
		// Descontar dinero de la compra hecha.
		comensal.pagar(platillo.precio())
		// Ingresar el dinero de la compra a los ingresos de la parrilla.
		self.agregarFondos(platillo.precio())
	}
	
	// Agregar fondos a los ingresos de la parrilla.
	method agregarFondos(cantidad) {
		ingresos = ingresos + cantidad
	}
	
	// Quitar fondos a los ingresos de la parrilla.
	method quitarFondos(cantidad) {
		ingresos = ingresos - cantidad
	}
	
	// Hacer una promocion (Regala una cantidad de dinero a todos los comensales registrados en el historial de comensales) // TODO test
	method hacerPromocion(cantidad) {
		// Obtener la cantidad total de dinero a entregar.
		const totalAEntregar = self.cantTotalPromocion(cantidad)
		// Verificar que haya suficientes ingresos para realizar la promocion.
		self.verificarIngresos(totalAEntregar)
		// Descontar de los ingresos la cantidad total de la promocion.
		self.quitarFondos(totalAEntregar)
		// Entregar la cantidad de dinero dada a cada comensal registrado en el historial.
		self.entregarPromocion(cantidad)
	}
	
	// Entregar la cantidad de dinero dada a cada comensal registrado en el historial.
	method entregarPromocion(cantidad) {
		historialComensales.forEach{comensal => comensal.recibirPromocion(cantidad)}
	}
	
	// Verificar que haya algun platillo que pueda comprar el comensal dado.
	method verificarMenu(comensal) {
		if(self.platillosValidosPara(comensal).isEmpty()){
			throw new Exception(message = "No existe plato valido en el menu que pueda comprar el comensal dado")
		}
	}
	
	// Verificar que haya suficientes ingresos para realizar la promocion.
	method verificarIngresos(totalAEntregar) {
		if(totalAEntregar > ingresos) {
			throw new Exception(message = "No hay suficientes ingresos para realizar la promocion")
		}
	}
	
	// Agregar comidas dadas al menu.
	method agregarAMenu(platillos) {
		menu.addAll(platillos)
	}
	
	// Agregar a un comensal dado al historial de comensales.
	method agregarAlHistorial(comensal) {
		historialComensales.add(comensal)
	}
}