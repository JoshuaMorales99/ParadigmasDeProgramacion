# Cuidado del jardin 💐 ✂️.
## Trabajo Practico 2022.

Queremos hacer un juego en el cual podremos controlar a uno de dos personajes: **Olivia** o **Adriano**.

Cada personaje tiene formas distintas de trabajar sobre un jardín para mantener las malezas bajo control, pero el trabajo es desgastante! Para compensar, pueden atenderse en un spa que les ayudará a recuperarse para volver a trabajar 💪

> Con la barra espaciadora podés cambiar el personaje para controlar a Olivia o a Adriano. Al pasar con el mouse por encima del jardín deberías poder ver la cantidad de malezas que tiene en ese momento y cómo se actualiza automáticamente 🤩

![](CuidadosJardin.jpg)

Se pide la codificacion de la solucion en Wollok para:

___
### Parte 1: Control de Malezas 🌿
En el jardín hay arbustos donde crecen malezas constantemente, y al pasar el tiempo tiende a quedar desprolijo por haber acumulado muchas malezas. Inicialmente el jardín tiene 30 malezas y, cada vez que crecen malezas, se debe incrementar en 5 la cantidad de malezas del jardín.

Decimos que el jardín está desprolijo si tiene más de 20 malezas. Por otro lado, necesitamos proveer algún mecanismo para emprolijar el jardín, lo cual dependerá del nivel de prolijidad con el cual se realize esta operación.
- Cuando se lo emprolija con un nivel de prolijidad mayor o igual a 10, el jardín queda sin malezas.
- Si el nivel de prolijidad se encuentra entre 3 y 9, la cantidad de malezas se reduce a la mitad.
- En cualquier otro caso no pasa nada.

Además, deben implementarse (como minimo) los siguientes tests:
- Al emprolijarlo con un nivel de prolijidad alto, queda sin malezas
- Al emprolijarlo con un nivel de prolijidad intermedio, las malezas bajan a la mitad
- Al emprolijarlo con un nivel de prolijidad bajo, no se reducen las malezas

___
### Parte 2: Olivia y el Jardín 💐
De Olivia conocemos qué tan relajada está mediante su nivel de relax que inicialmente es 4, el cual baja cuando trabaja porque se estresa.

Cuando Olivia trabaja en un jardín:
- Si el jardín está desprolijo al iniciar el trabajo se estresa dos puntos. Luego lo emprolija con un nivel de prolijidad equivalente al doble de su relax actual. Finalmente, siempre se estresa un punto más.

Estresarse implica disminuir su nivel de relax en la cantidad de puntos indicados, teniendo en cuenta que el mínimo valor de relax que puede tener es 1.

___
### Parte 3: Adriano y el Jardín ✂️
De Adriano conocemos qué tan contracturado está. Inicialmente no tiene contracturas, pero a medida que trabaja sus contracturas aumentan.

Cuando Adriano trabaja en un jardín, lo emprolija con un nivel de prolijidad de 1 si está lastimado, o de 5 si no lo está. Está lastimado cuando tiene más de 10 contracturas.

Al finalizar el trabajo sus contracturas aumentan en el mínimo entre 7 y la cantidad de malezas que tenía el jardín antes de que Adriano lo emprolijara.

___
### Parte 4: Atenciones en el Spa 🎍
Para cerrar, necesitamos que Olivia y Adriano puedan atenderse en el spa. Cuando el spa atiende una persona pasan tres cosas:

1. La persona se da un baño de vapor durante 5 minutos.
2. Recibe masajes.
3. Se da otro baño de vapor durante 15 minutos.

Sabemos que:
- Cuando Olivia recibe masajes, su nivel de relax aumenta en 3 puntos.
- Cuando Olivia se da un baño de vapor, su nivel de relax aumenta 1 punto cada 5 minutos que dura el baño de vapor.
- Cuando Adriano recibe masajes, sus contracturas disminuyen en 5 (teniendo en cuenta que el valor final no quede por debajo de 0).
- Cuando Adriano se da un baño de vapor, sólo si está lastimado sus contracturas disminuyen en 2, independientemente de la duración del baño.