import TipoVenta.*

/*========================================
 🔸 SUPERMERCADO.
=========================================*/
object supermercado {
	// Obtener un producto de venta unitaria dado su nombre y precio.
	method crearProductoDeVentaUnitaria(nombre, precio) = new VentaUnitaria(nombre = nombre, precio = precio)
	// Obtener un producto de venta por peso dado su nombre, precio y peso.
	method crearProductoDeVentaPorPeso(nombre, precio, peso) = new VentaPorPeso(nombre = nombre, precio = precio, peso = peso)
}
