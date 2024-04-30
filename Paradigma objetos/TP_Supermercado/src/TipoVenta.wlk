/*========================================
 🔸 TIPO DE VENTAS.
=========================================*/
// Molde para las ventas unitarias.
class VentaUnitaria {
	// Nombre del producto.
	const nombre
	// Precio unitario del producto.
	const precio
	
	// Obtener el precio a abonar (Precio por kilo * Peso del producto)
	method precioAbonar() = precio
}

// Molde para las ventas por peso.
class VentaPorPeso {
	// Nombre del producto.
	const nombre
	// Precio de venta por peso.
	const precio
	// Peso del producto (En kilogramos)
	const peso
	
	// Obtener el precio a abonar (Precio por kilo * Peso del producto)
	method precioAbonar() = precio * peso
}