# Supermercado.
## Trabajo Práctico 2022.

Queremos hacer un sistema para hacer compras online de modo que se puedan agregar productos al carrito de compras, y hacer diversas consultas para analizar el estado de la compra.

![](Supermercado.jpg)

Debemos contemplar dos tipos de productos distintos:
- De venta unitaria, a los cuales nos interesa poder configurarles el nombre del producto y el precio unitario.<br>
    > Por ejemplo, un producto podría tener como nombre `"Aceite de girasol"` y como precio unitario el valor `60.75`.
- De venta por peso, que nos interesa poder configurarles el nombre del producto, el precio por kilo y el peso (en kilogramos) que se está comprando. El precio a abonar por estos productos sería el precio por kilo multiplicado por el peso del producto.<br>
    > Por ejemplo, podríamos querer tener un producto por peso cuyo nombre sea `"Queso cremoso"`, el precio por kilo sea `320` y el peso sea `0.3` kilos. Por ende el valor que se debería abonar por ese producto debería ser: `320 * 0.3 => 96`.

### Requerimientos 💡
1. Necesitamos poder **agregar productos al carrito**, considerando que debe ser posible agregar un mismo producto al carrito varias veces, lo cual implica que se desea comprar esa cantidad del producto en cuestión.

2. Queremos poder determinar:
    - Si el carrito está vacío, que se cumple cuando no se le agregó ningún producto.
    - Cuántos productos hay en el carrito en total (si se agrega 2 veces un mismo producto, debe contabilizarse 2 veces).
    - Cuál es el total a abonar por los productos agregados al carrito.
    - Cuál es el producto más caro de los que se agregaron al carrito.

3. Además queremos obtener el **detalle de la compra**, que debería ser una lista con las descripciones de los productos que se agregaron al carrito, considerando que el detalle de la compra no debería tener descripciones repetidas, y se espera que estén en orden alfabético.

    Las descripciones de los productos dependen del tipo de producto que sea:
    - Para un producto unitario, la descripción es simplemente su nombre.
    - Para un producto de venta por peso, la descripción es un string con el formato: `"<nombre del producto> x <peso del droducto> kg"`.

    > Por ejemplo, si tenemos un producto de venta por peso cuyo nombre es `"Queso cremoso"` y su peso es `0.3` kilos, la descripción debería ser: `"Queso cremoso x 0.3 kg"`.

Los puntos de entrada para estos requerimientos ya están definidos. Dado un objeto `carrito`, se espera que se le puedan enviar los siguientes mensajes:
```
>>> carrito.agregar(producto)
>>> carrito.estaVacio()
>>> carrito.cantidadDeProductos()
>>> carrito.totalAbonar()
>>> carrito.productoMasCaro()
>>> carrito.detalleDeCompra()
```
___
### Pruebas automáticas 🧪
Para que el ejercicio esté completo se debe agregar lo necesario para que los tests funcionen, considerando que:

- Debe existir el método ```crearProductoDeVentaUnitaria(nombre, precioUnitario)```
- Debe existir el método ```crearProductoDeVentaPorPeso(nombre, precioPorKilo, peso)```

Lo esperado para estos métodos es que creen y retornen el producto con la configuración adecuada para usarlos desde los tests que ya se encuentran definidos.