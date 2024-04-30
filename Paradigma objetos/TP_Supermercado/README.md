# Supermercado 🛒 🍫.
## Trabajo Practico 2022.

Queremos hacer un sistema para hacer compras online de modo que se puedan agregar productos al carrito de compras, y hacer diversas consultas para analizar el estado de la compra.

![](Supermercado.jpg)

Debemos contemplar dos tipos de productos distintos:
- De venta unitaria, a los cuales nos interesa poder configurarles el nombre del producto y el precio unitario.<br>
> Por ejemplo, un producto podria tener como nombre ```"Aceite de girasol"``` y como precio unitario el valor ```60.75```.
- De venta por peso, que nos interesa poder configurarles el nombre del producto, el precio por kilo y el peso (en kilogramos) que se esta comprando. El precio a abonar por estos productos sería el precio por kilo multiplicado por el peso del producto.<br>
> Por ejemplo, podriamos querer tener un producto por peso cuyo nombre sea ```"Queso cremoso"```, el precio por kilo sea ```320``` y el peso sea ```0.3``` kilos. Por ende el valor que se deberia abonar por ese producto deberia ser: ```320 * 0.3 => 96```.

### Requerimientos.
1. Necesitamos poder **agregar productos al carrito**, considerando que debe ser posible agregar un mismo producto al carrito varias veces, lo cual implica que se desea comprar esa cantidad del producto en cuestion.

2. Queremos poder determinar:
    - Si el carrito está vacio, que se cumple cuando no se le agrego ningun producto.
    - Cuantos productos hay en el carrito en total (si se agrega 2 veces un mismo producto, debe contabilizarse 2 veces).
    - Cual  es el total a abonar por los productos agregados al carrito.
    - Cual es el producto más caro de los que se agregaron al carrito.

3. Ademas queremos obtener el **detalle de la compra**, que deberia ser una lista con las descripciones de los productos que se agregaron al carrito, considerando que el detalle de la compra no deberia tener descripciones repetidas, y se espera que esten en orden alfabetico.

    Las descripciones de los productos dependen del tipo de producto que sea:

    - Para un producto unitario, la descripcion es simplemente su nombre.
    - Para un producto de venta por peso, la descripcion es un String con el formato: ```"<nombre del producto> x <peso del droducto> kg"```.

    > Por ejemplo, si tenemos un producto de venta por peso cuyo nombre es ```"Queso cremoso"``` y su peso es ```0.3``` kilos, la descripcion deberia ser: ```"Queso cremoso x 0.3 kg"```.

Los puntos de entrada para estos requerimientos ya están definidos. Dado un objeto ```carrito```, que sera unico en el programa, se espera que se le puedan enviar los siguientes mensajes:
```
>>> carrito.agregar(producto)
>>> carrito.estaVacio()
>>> carrito.cantidadDeProductos()
>>> carrito.totalAAbonar()
>>> carrito.productoMasCaro()
>>> carrito.detalleDeCompra()
```
___
### Test automaticos 🧪.
Para que el ejercicio este completo se debe agregar lo necesario para que los tests funcionen, considerando que:

- Debe existir el metodo ```crearProductoDeVentaUnitaria(nombre, precioUnitario)```
- Debe existir el metodo ```crearProductoDeVentaPorPeso(nombre, precioPorKilo, peso)```

Lo esperado para estos metodos es que creen y retornen el producto con la configuracion adecuada para usarlos desde los tests que ya se encuentran definidos.