/*========================================
 🔸 CARRITO.
=========================================*/
// Molde para los carritos de compras.
class Carrito {
	// Productos en el carrito.
	const productos = []
	
	// PUNTO 2.b: Obtener la cantidad de productos en el carrito.
	method cantidadDeProductos() = productos.size()
	// PUNTO 2.c: Obtener el total a abonar.
	method totalAbonar() = productos.sum{producto => producto.precioAbonar()}
	// PUNTO 2.d: Obtener el producto mas caro de los agregados.
	method productoMasCaro() = productos.max{producto => producto.precioAbonar()}
	
	// PUNTO 2.a: Saber si el carrito esta vacio.
	method estaVacio() = productos.isEmpty()
	
	// PUNTO 1: Agregar un producto dado a la lista de la compra.
	method agregar(producto) {
		productos.add(producto)
	}
}
