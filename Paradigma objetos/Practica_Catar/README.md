# Catar 2022
## Parcial 2022

___
**Catar**
1. tr. Probar, gustar algo para examinar su sabor o sazón. 
2. sp. Lugar donde se juega la copa del mundo.
3. pdep. Parcial de objetos.

**Queremos modelar un sistema en el que los cocineros se ocupan de preparar y catar platos**
___

Hay diferentes platos: 
- Las entradas nunca tienen azúcar y siempre son bonitas.
- Los principales pueden tener una cantidad de azúcar o nada, y pueden o no ser bonitos.
- Los postres siempre llevan 120g de azúcar, y son bonitos cuando tienen más de 3 colores.

Por ahora, los cocineros pueden ser pasteleros o chefs. Todo cocinero, además de cocinar, también sabe catar un plato (o sea, calificarlo).
- Cada pastelero tiene un nivel deseado de dulzor, y luego de catar un plato, otorga una calificación que se calcula como 5 * la cantidad de azúcar del plato / dulzor deseado (máximo 10).
- Un chef al catar un plato, da una calificación de 10 en caso que sea bonito y además tenga hasta cierta cantidad de calorías (definida por cada chef). Lo califica con 0 en caso contrario.

Se pide la codificación completa en Wollok de los siguientes puntos, utilizando las herramientas del paradigma de objetos:
1. Conocer las calorías de un plato. Las calorías de cualquier plato se calculan como 3 * la cantidad de azúcar que contiene + 100 de base.
2. Catar un plato. Cuando un plato es catado, se obtiene la calificación que le da el catador.
3. Que un cocinero pueda cambiar de especialidad (por ejemplo, pasar de ser chef a ser pastelero).
4. Agregar la especialidad souschef. El souschef es como el chef pero cuando no se cumplen las expectativas la calificación que pone es la cantidad de calorías del plato / 100 (máximo 6).
5. Hacer que un cocinero cocine, lo cual crea un plato y lo retorna.
    - Los pasteleros crean postres con tantos colores como su nivel de dulzor deseado dividido 50.
    - Los chefs crean platos principales bonitos con una cantidad de azúcar igual a la cantidad de calorías preferida del cocinero.
    - Los souschefs crean entradas.
6. Existen torneos, que tienen catadores.
    - Hacer que un cocinero participe en un torneo: al participar cocina y presenta su plato al torneo.
    - Encontrar el cocinero ganador del torneo, que es aquél que haya presentado el plato que obtiene la mayor puntuación del torneo (la suma de las calificaciones individuales de cada catador). Cuidado: si no se presenta ningún cocinero al torneo, no se puede establecer al ganador. 
7. Escribir los tests necesarios para probar la calificación otorgada por un pastelero. Se esperan tantos tests como clases de equivalencia, bien nombrados.

> Aunque en el ámbito de los nombres propios (antropónimos y topónimos) es frecuente el uso de grafías originarias no adaptadas o —si los nombres provienen de lenguas que emplean otro alfabeto u otro sistema de escritura, como el árabe, el hebreo o el chino— de transliteraciones de las grafías originarias al alfabeto latino, sin adaptaciones ulteriores, en el caso de los topónimos mayores, como son los nombres de países, es conveniente usar grafías plenamente adaptadas a la ortografía del español. Por ello, aplicando la misma norma que para los nombres comunes, se recomienda emplear con preferencia las grafías Catar e Irak para los nombres de esos dos países árabes, mejor que Qatar e Iraq, transcripciones de los originales árabes que presentan un uso de la q ajeno al sistema ortográfico del español. Real Academia Española (https://www.rae.es/espanol-al-dia/en-espanol-cuorum-y-catar-en-lugar-de-quorum-y-qatar)
