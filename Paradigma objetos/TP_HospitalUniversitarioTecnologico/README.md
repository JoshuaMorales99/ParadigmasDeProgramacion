# Hospital Universitario Tecnologico.
## Trabajo Practico.

El Departamento de Diagnóstico del Hospital Universitario Tecnológico nos pidió que les diéramos una mano con un sistema que les ayude a hacer su trabajo. Después de una interconsulta con distintos docentes de la materia optamos por modelarlo en objetos y llegamos a esta solución hasta ahora..

<img src="Diagrama_1.jpg" alt="Diagrama de clases 1" width="800px">

### PARTE 1. Enfermedades.
La directora del hospital nos llamó para actualizarnos sobre los requerimientos.<br>
Los médicos saben atender a cualquier persona enferma dándoles una dosis de medicamento propia de cada médico. Cuando la persona recibe un medicamento las enfermedades que tiene en el cuerpo se atenúan (cada una se atenúa en la cantidad de medicamento recibida, multiplicada por 15), y se curan en el caso de que no afecten a más células.<br>
1. Hacer que cualquier enfermedad pueda atenuarse.
> Por ejemplo que la primera malaria se atenúe en 100 células y el lupus en 500 células.

2. Hacer que las enfermedades puedan resistirse al tratamiento
   - Al atenuarse, en los casos de las enfermedades infecciosas, en lugar de tomar recibir la dosis entera estas se resisten en 20ml
   - Las enfermedades autoinmunes no tienen resistencia
   - Otras enfermedades podrían tener diferente resistencia.


### PARTE 2. Medicos.
1. Hacer que un médico atienda a una persona.
> Por ejemplo que Cameron, una doctora que administra dosis de 100 ml, atienda a Logan.

2. Existen médicos que son jefes de departamento. Cuando tienen que atender a un paciente, no le administran medicación sino que les dicen a uno sus subordinados que lo hagan.
> Por ejemplo hacer que Cuddy atienda a Cameron (Sí, los médicos son personas y pueden enfermarse)

3. Hacer que cuando un médico contraiga una enfermedad, éste trate de curarse atendiéndose a sí mismo.
> Por ejemplo hacer que Cameron contraiga malaria, hacer que Cuddy contraiga malaria, y pensar en el method lookup en ambos casos.

<img src="Diagrama_2.jpg" alt="Diagrama de clases 2" width="800px">

### PARTE 3. Hipotermia.
Agregar la **hipotermia** y probarla haciendo que Cuddy contraiga la hipotermia. La hipotermia actúa disminuyendo toda la temperatura de la persona y no se atenúa con ningún medicamento. No afecta ninguna célula (no tiene sentido, ya que afecta a la persona entera) y es extremadamente agresiva.

<img src="Diagrama_3.jpg" alt="Diagrama de clases 3" width="800px">

### PARTE 4. Especialidades.
Agregar especialidades a los médicos. Según la especialidad, se hace un tratamiento extra al atender:
- **Enfermero**: Dá otra dosis de medicamento, a 10 unidades.
- **De guardia**: Estabiliza la temperatura, dejándola en 36°C.
- **Sin especialidad**.

Los médicos pueden cambiar de especialidad, además podrían haber más especialidades en el futuro.