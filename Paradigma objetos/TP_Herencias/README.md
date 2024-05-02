# Herencia.
## Trabajo Práctico 2023.

Dado el siguiente código:
```
class A {
	const x 
	method m1() = x
}

class B inherits A {
	const y
	method m2(z) = self.m1() * y + z
}

class C inherits B {
	override method m2(z) = super(super(z))
	override method m1() = 1000
}

class D inherits B(x = 100) {

}
```
### Realizar los siguientes puntos:
1. Escribir una posible consigna para esta solución, en un dominio inventado.
2. Sin cambiar la lógica, reescribir el código con nombres más expresivos, acordes al dominio.
3. Hacer tests que prueben la funcionalidad planteada.<br>

___
### PUNTO 1: **LAS CRIATURAS DE TERRASTORIA.**
En un mundo... (🎶 CHAN CHAN CHAN 🎶) más alla de las profundidades del planeta Terrastoria... (🎶 CHAN CHAN CHAN 🎶) donde el tiempo no transcurre y la energia no se acaba... (🎶 CHAAAAAAN 🎶) Habitan numerosas criaturas capaces de forjar herramientas míticas. Dichas criaturas presentan un nivel de fuerza constante que utilizan para llevar a cabo sus ideales. Debido a alteraciones genéticas presentes en algunas de estas especies, parte de su población posee poderes mágicos con los cuales son capaces de crear a otras criaturas. Estos seres especiales poseen un nivel de poder mágico equivalente a su `Fuerza * Cant. de alteraciones genéticas + Nivel de poder dado`.
	
Dentro de estas especies mágicas, se destacan dos especies altamente poderosas, las criaturas manipuladoras de oscuridad y las criaturas manipuladoras de luz. Sus ideales son la destrucción y construcción de galáxias enteras respectivamente.
	
Sus características:
- 🌑 Oscuridad: Estas criaturas mágicas especiales, poseen un nivel de fuerza igual a 1000 y su poder mágico destructor se determina calculando su `Fuerza * Cant. de alteraciones genéticas + Poder mágico`. Dicho poder mágico, se calcula de la misma manera que las criaturas mágicas convencionales. Su objetivo es destruir toda galáxia que sea una amenza para el orden espacial. Sin embargo, hay momentos de 'amsiedad' y comienzan a destruir sin razón alguna.
- 💡 Luz: Estas criaturas mágicas especiales, poseen un nivel de fuerza menor que las de oscuridad, siendo este, 100. No obstante, son muy hábiles en lo que hacen, por lo que construir gálaxias no les presenta ningún tipo de dificultad.

❓ Modelar las clases de nuestros distintos tipos de criaturas posibles del Planeta Terrastoria. <br>
❓ Realizar los test necesarios para probar la funcionalidad.