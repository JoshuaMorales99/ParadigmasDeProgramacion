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
Realizar los siguientes puntos:
1. Escribir una posible consigna para esta solución, en un dominio inventado.
2. Sin cambiar la lógica, reescribir el código con nombres más expresivos, acordes al dominio.
3. Hacer tests que prueben la funcionalidad planteada.
