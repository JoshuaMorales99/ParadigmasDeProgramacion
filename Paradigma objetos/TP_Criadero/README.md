# Criaderos 🐶.
## Trabajo Practico 2022.

Necesitamos modelar la forma en que los criaderos de perros se comportan a la hora de cruzar sus animales con los perros que llevan sus clientes.

Ya tenemos representados a los perros, para los cuales registramos su ```velocidad```, su ```fuerza```, si ```esAdulto``` y si ```esHembra```. Ademas nos interesa conocer su ```status``` que es la suma entre la fuerza y velocidad, como puede verse en el codigo inicial.

Sabemos que los criaderos pueden cruzar perros en base a estilos de cruza diversos, lo cual impacta, entre otras cosas, en las caracteristicas que tendra la cria de ambos perros en caso de que la cruza sea exitosa.

![](Perritos.jpg)

___
### Parte 1: Estilos de cruza 🧬
Sabemos que hay diferentes resultados para la cruza entre 2 perros dependiendo del estilo de cruza que se use. A su vez pueden diferir las precondiciones para que la cruza en cuestion sea exitosa.

Decimos que la cruza es exitosa si los 2 perros cumplen con los requisitos para cruzarse de acuerdo a ese estilo de cruza que se explican mas adelante, y como resultado se obtiene la cria: un perro joven cuya velocidad y fuerza derivan de la velocidad y fuerza de los padres.

> 💡 El sexo de la cria no es deterministico, hay un 50% de chances de que nazca hembra o macho independientemente del estilo de cruza que se use. Esto ya esta resuelto en la inicializacion por defecto del atributo booleano ```esHembra```.

Respecto a los requisitos, para cualquier estilo de cruza debe cumplirse que los perros a cruzar sean compatibles: ambos deben ser adultos y tener sexos opuestos.

A continuacion se detallan cuales son los distintos estilos de cruza a representar, con sus particularidades:
- ```cruzaPareja```: la cria resultante de la cruza deberia ser un perro cuyos valores para velocidad y fuerza equivalgan a la suma de los valores correspondientes de sus padres dividido 2. Por ejemplo, si la madre tiene velocidad 8 y el padre tiene velocidad 6, la cria tendra velocidad 7.

- ```underdog```: la cria resultante de la cruza deberia ser un perro cuyos valores para velocidad y fuerza equivalgan al minimo valor correspondiente de sus padres, multiplicado por 2. Por ejemplo, si la madre tiene velocidad 8 y el padre tiene velocidad 5, la cria tendra velocidad 10.

- ```hembraDominante```: la cria resultante de la cruza deberia ser un perro cuyos valores para velocidad y fuerza equivalgan al valor correspondiente de la madre sumado al 5% del valor correspondiente del padre. Por ejemplo, si la madre tiene velocidad 8 y el padre tiene velocidad 10, la cria tendra velocidad 8.5.

Ademas, para este estilo de cruza en particular, no alcanza con que los perros sean compatibles. Es necesario tambien que **la fuerza de la hembra supere a la fuerza del macho** para que la cruza sea exitosa.

Para resolver este requerimiento se espera que todos los estilos de cruza entiendan el mensaje: ```cruzar(perro1, perro2)```.


> Tene en cuenta que:
> 
> - No deberia importar el orden en el que se parametricen el macho y la hembra al estilo de cruza, el resultado deberia ser equivalente.
> - Determinar cual es el comportamiento esperado cuando la cruza no es exitosa forma parte de los objetivos de este trabajo 😉

___
### Pruebas automaticas 🧪
Para que el ejercicio este completo, mas alla de implementar lo pedido, se debe pasar los tests unitarios.

Tene en cuenta que deben completarse los siguientes tests acorde a las decisiones que hayas tomado para resolver lo pedido para los estilos de cruza:
- La cruza basada en hembra dominante de perros adultos con hembra debil no es exitosa.
- La cruza de dos machos no es exitosa para cualquier estilo de cruza.
- La cruza de dos hembras no es exitosa para cualquier estilo de cruza.
- La cruza de dos perros no es exitosa si alguno no es adulto para cualquier estilo de cruza.

> 💡 Para los ultimos escenarios que deberian validarse para todos los estilos de cruza, se propone usar el siguiente metodo auxiliar que ya se encuentra definido para simplificar la tarea:
> ```
> method paraTodoEstiloDeCruzaSeVerificaQue(bloqueConAsercion) {
>   #{cruzaPareja, hembraDominante, underdog}.forEach(bloqueConAsercion)
> }
> ```
> De esa forma alcanza con que pienses cual es la validacion que harias para cualquiera de esos objetos guiandote por la explicacion de cada test a completar.

___
### Parte 2: Cruzas en el criadero 🐶🐶🐶
Como se explico anteriormente, queremos poder cruzar un perro con alguno de los multiples perros que tenga el criadero. Para resolver este requerimiento se espera que los criaderos entiendan el mensaje ```cruzar(estiloDeCruza, perroACruzar)``` y que, en caso de que pueda cruzar exitosamente al perro recibido basandose en ese estilo de cruza indicado, retorne a la cria obtenida.

El proceso para realizar la cruza en el criadero no es trivial y podria fallar por motivos diversos. A continuacion se detalla el comportamiento esperado:

En primer lugar, necesitamos asegurar que el criadero solo intente cruzar perros que sean compatibles (por tener distinto sexo y ser adultos como se explico anteriormente). Por ese motivo, como punto de partida solo se consideraran como **potenciales parejas** a los perros del criadero que sean compatibles con el que se solicito cruzar.

Luego, con esas potenciales parejas, el criadero tendra **3 intentos para cruzar al perro** en cuestion con distintas potenciales parejas, por lo que se tratara de beneficiar a los perros de mas status probando primero con el de mayor status, luego con el que le sigue, y asi.

En caso de que los primeros 3 intentos de cruza no sean exitosos, se espera que la operacion del criadero falle con una excepcion de tipo ```IntentosDeCruzaAgotadosException```.

Si no se llega a conseguir una cria probando hasta 3 cruzas a raiz de no tener suficientes parejas potenciales para el perro solicitado, la operacion deberia fallar con una excepcion del tipo ```NecesitaMasPerrosException```.

**Ejemplos**
Para ilustrar mejor los distintos escenarios a grandes razgos (los tests provistos son mas puntuales, no olvides revisarlos si te quedan dudas 😉), se plantea la siguiente situacion:

- Dado un criadero que tiene los siguientes perros:
    - Un macho adulto con velocidad 15 y fuerza 10 (status: 25)
    - Una hembra adulta con velocidad 5 y fuerza 10 (status: 15)
    - Una hembra adulta con velocidad 15 y fuerza 7 (status: 22)
    - Otras 2 hembras adultas que tienen menor status y fuerza que las anteriores
    - Varios machos y hembras jovenes, con status mayor a 30.

- Por otro lado tenemos a los siguientes perros que podriamos querer cruzar en el criadero:
    - Bobby: un macho adulto con velocidad 3 y fuerza 9.
    - Trancos: un macho adulto con velocidad 15 y fuerza 20.
    - Nina: una hembra adulta con velocidad 10 y fuerza 5
    - Pip: un macho joven con velocidad 10 y fuerza 17.

1. Si se quisiera cruzar con un estilo de **cruza pareja** a Bobby, la cruza seria exitosa obteniendo una cria con velocidad 9 y fuerza 8, ya que deberia elegirse como pareja a la hembra adulta de status 22.

2. Si se intentara la misma cruza pero con un estilo **hembra dominante**, se trataria de cruzar a Bobby primero con la hembra de status 22, pero al no ser mas fuerte la hembra que el macho ese primer intento no seria exitoso. Sin embargo al probar con la segunda pareja posible, la hembra de status 15, si se podria realizar la cruza obteniendo como resultado la cria con velocidad y fuerza similares a los de la madre.

3. Si se intentara cruzar a Trancos con un estilo **hembra dominante** no se podria cruzar exitosamente: fallaria por intentar cruzar a Trancos mas de 3 veces sin lograr obtener una cria con las hembras que dispone.

4. Si se intentara cruzar a Nina con un estilo de **hembra dominante** no se podria cruzar exitosamente: fallaria por no tener suficientes machos adultos luego de fallar en su primer intento.

5. Si se intentara cruzar a Pip con un estilo de cruza pareja no se podria cruzar exitosamente, porque Pip no es adulto, con lo cual no habran potenciales parejas con las cuales intentar cruzarlo.

___
### Pruebas automaticas 🧪
Para que el ejercicio este completo deben pasar los tests unitarios.