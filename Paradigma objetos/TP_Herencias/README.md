# Herencia.
## Trabajo Practico.

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
En un mundo... (🎶 CHAN CHAN CHAN 🎶) más alla de las profundidades del planeta Terrastoria... (🎶 CHAN CHAN CHAN 🎶) donde el tiempo no transcurre y la energia no se acaba... (🎶 CHAAAAAAN 🎶) Habitan numerosas criaturas capaces de forjar herramientas miticas. Dichas criaturas presentan un nivel de fuerza constante que utilizan para llevar a cabo sus ideales. Debido a alteraciones geneticas presentes en algunas de estas especies, parte de su poblacion posee poderes magicos con los cuales son capaces de crear a otras criaturas. Estos seres especiales poseen un nivel de poder magico equivalente a su fuerza * cant. de alteraciones geneticas + un nivel de poder dado.
	
Dentro de estas especies magicas, se destacan dos especies altamente poderosas, las criaturas manipuladoras de oscuridad y las criaturas manipuladoras de luz. Sus ideales son la destruccion y construccion de galaxias enteras respectivamente.
	
Sus caracteristicas:
- 🌑 Oscuridad: Estas criaturas magicas especiales, poseen un nivel de fuerza igual a 1000 y su poder magico destructor se determina calculando su fuerza * cant. de alteraciones geneticas + su poder magico. Dicho poder magico, se calcula de la misma manera que las criaturas magicas convencionales. Su objetivo es destuir toda galaxia que sea una amenza para el orden espacial. Sin embargo, hay momentos de 'amsiedad' y comienzan a destrir sin razon alguna.
- 💡 Luz: Estas criaturas magicas especiales, poseen un nivel de fuerza menor que las de oscuridad, siendo este, 100. No obstante, son muy habiles en lo que hacen, por lo que construir galaxias no les presenta ningun tipo de dificultad.

❓ Modelar las clases de nuestros distintos tipos de criaturas posibles del planeta Terrastoria. <br>
❓ Realizar los test necesarios para probar la funcionalidad.