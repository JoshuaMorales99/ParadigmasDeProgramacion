# PdeP Cargas.
## Trabajo Práctico 2023.

PdeP Cargas es una empresa que se dedica al transporte de carga (era medio obvio, ¿no? 😝) en todo el país. Nos pidieron que desarrollemos una aplicación para **controlar los gastos** que tiene la empresa a medida que los camiones realizan viajes.

![](PdePCargas.jpg)

### Vehículos 🚛🚚
Para sus operaciones habituales PdeP Cargas cuenta con los siguientes vehículos (¡pero está en proceso de agregar más!):

- 🥬 **Verdurín**: El clásico camión que transporta cajones de verduras. Si bien sólo quienes cargan este vehículo pueden saber la cantidad de cajones con los que viaja, sí se le puede indicar en cualquier momento la cantidad de cajones para transportar. Inicialmente lleva 10 cajones y pesan 50 kg cada uno. Sabemos que su velocidad máxima es de 80 km/h restando un km/h por cada 500 kg de carga y que su kilometraje se encuentra actualmente en 700.000 kms.
- 🚀 **Scanion 5000**: Camión de última generación que transporta combustibles líquidos. Como es tan potente, siempre está cargado a su máxima capacidad (5.000 litros). El peso de la carga depende de la densidad del líquido transportado (1) Su velocidad máxima siempre es de 140 km/h.
- 🌽 **Cerealitas**: Un camión cerealero muy muy viejo. Tiene un nivel de deterioro el cual inicialmente es 0 y que aumenta al hacer viajes (no puede modificarse externamente). Su velocidad máxima depende de su deterioro, si éste es menor a 10 la velocidad es 40 km/h. Sino, es de 60 km/h menos su nivel de deterioro. Para cada viaje que realiza se determina la cantidad de carga que va a llevar.

### Puestos de control 🚦
Los camiones de PdeP Cargas van a tener que pasar por puestos de control para llegar a su destino. Los puestos pueden aplicar cargos a PdeP Cargas al dejar pasar a sus vehículos (¡y este gasto es el que quiere controlar la empresa!). El monto dependerá del camión que pase por ese puesto.
Por ahora, nos pidieron modelar un solo puesto, ya que es el más utilizado en este momento:

- 🚏 **Rutatlántica**: Cobra $7.000 por camión más un adicional de 100 pesos por cada 1000 kg de carga que lleva el camión. Sabemos que el camión que pasa por este puesto **recorre** 400 kms y que debe ir a un máximo de 75 km/h.

Los camiones pueden recorrer una cierta cantidad de kilómetros de una ruta a una cierta velocidad. Cuando esto ocurre con un camión cerealero, éste aumenta su nivel de deterioro en 1 por cada kilómetro por hora que se excede de los 45 km/h (no puede quedar un nivel negativo). El camión de verduras sólo registra sus kilómetros recorridos. Por último, al Scanion 5000 esto no lo afecta en absoluto.

> (1) ¿No te acordás de la fórmula? No te preocupes, es `Peso = Densidad * Volúmen`.