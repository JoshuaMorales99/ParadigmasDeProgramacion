# PdeP Cargas.
## Trabajo Practico.

PdeP Cargas es una empresa que se dedica al transporte de carga (era medio obvio, ¿no? 😝) en todo el pais. Nos pidieron que desarrollemos una aplicacion para **controlar los gastos** que tiene la empresa a medida que los camiones realizan viajes.

![](PdePCargas.jpg)

### Vehiculos:
Para sus operaciones habituales PdeP Cargas cuenta con los siguientes vehiculos (¡pero esta en proceso de agregar mas!):

- 🥬 **Verdurin**: el clasico camion que transporta cajones de verduras. Si bien solo quienes cargan este vehiculo pueden saber la cantidad de cajones con los que viaja, si se le puede indicar en cualquier momento la cantidad de cajones para transportar. Inicialmente lleva 10 cajones y pesan 50 kg cada uno. Sabemos que su velocidad maxima es de 80 km/h restando un km/h por cada 500 kg de carga y que su kilometraje se encuentra actualmente en 700.000 kms.
- 🚀 **Scanion 5000**: camion de ultima generacion que transporta combustibles liquidos. Como es tan potente, siempre esta cargado a su maxima capacidad (5.000 litros). El peso de la carga depende de la densidad del liquido transportado (1) Su velocidad maxima siempre es de 140 km/h.
- 🌽 **Cerealitas**: un camion cerealero muy muy viejo. Tiene un nivel de deterioro el cual inicialmente es 0 y que aumenta al hacer viajes (no puede modificarse externamente). Su velocidad maxima depende de su deterioro, si este es menor a 10 la velocidad es 40 km/h. Sino, es de 60 km/h menos su nivel de deterioro. Para cada viaje que realiza se determina la cantidad de carga que va a llevar.

Los camiones de PdeP Cargas van a tener que pasar por puestos de control para llegar a su destino. Los puestos pueden aplicar cargos a PdeP Cargas al dejar pasar a sus vehiculos (¡y este gasto es el que quiere controlar la empresa!). El monto dependera del camion que pase por ese puesto.
Por ahora, nos pidieron modelar un solo puesto, ya que es el mas utilizado en este momento:

- 🚏 **Rutatlantica**: cobra $7.000 por camion mas un adicional de 100 pesos por cada 1000 kg de carga que lleva el camion. Sabemos que el camion que pasa por este puesto **recorre** 400 kms y que debe ir a un maximo de 75 km/h.

Los camiones pueden recorrer una cierta cantidad de kilometros de una ruta a una cierta velocidad. Cuando esto ocurre con un camion cerealero, este aumenta su nivel de deterioro en 1 por cada kilometro por hora que se excede de los 45 km/h (no puede quedar un nivel negativo). El camion de verduras solo registra sus kilometros recorridos. Por ultimo, al Scanion 5000 esto no lo afecta en absoluto.

> (1) ¿No te acordas de la formula? No te preocupes, es peso = densidad * volumen.