# Proyecto Empleados - Programación Orientada a Objetos

## Descripción

Proyecto desarrollado en **Java** que aplica los fundamentos del **Paradigma Orientado a Objetos (POO)**, 
incluyendo los conceptos de:

- **Clases abstractas** (`Empleado`)
- **Herencia** (`Vendedor` y `Administrativo` extienden de `Empleado`)
- **Encapsulamiento** (atributos `private` con getters/setters)
- **Polimorfismo** (método `extrasSueldo()` implementado de forma distinta en cada subclase)
- **Sobrescritura de métodos** (`@Override` en `mostrarDatos()` y `extrasSueldo()`)

Este proyecto corresponde a la **UF2404 - Introducción al Paradigma Orientado a Objetos**, 
y cumple con los objetivos:

- **C1:** Dominar los conceptos fundamentales del paradigma OO.
- **C2:** Desarrollar clases aplicando los fundamentos del paradigma OO.
- **CE2.3:** Describir los mecanismos existentes para realizar la implementación de las relaciones entre clases.

---

## Estructura del proyecto

ProyectoEmpleados/
│
├── src/ # Código fuente
│ ├── Empleado.java # Clase abstracta padre
│ ├── Vendedor.java # Clase hija 1
│ ├── Administrativo.java # Clase hija 2
│ └── Principal.java # Clase con el método main
│
├── bin/ # Clases compiladas (.class) - se genera automáticamente
│
├── compilar.bat # Script para compilar
├── ejecutar.bat # Script para ejecutar
├── build_and_run.bat # Compila y ejecuta de una vez
├── limpiar.bat # Limpia las clases compiladas
└── README.md # Este archivo


---

## Cómo ejecutar el proyecto

### Requisitos previos

- Tener instalado el **JDK (Java Development Kit)** versión 8 o superior.
- Verificar la instalación ejecutando en una terminal:

	java -version
	javac -versión


### Opción 1: Usando los scripts `.bat` (Windows)

1. **Compilar** el proyecto:
   - Doble clic en `compilar.bat`

2. **Ejecutar** el proyecto:
   - Doble clic en `ejecutar.bat`

3. **Compilar y ejecutar de una vez**:
   - Doble clic en `build_and_run.bat`

4. **Limpiar** las clases compiladas:
   - Doble clic en `limpiar.bat`

### Opción 2: Desde la línea de comandos (CMD o PowerShell)
cmd
REM Compilar
javac -d bin src\Empleado.java src\Vendedor.java src\Administrativo.java src\Principal.java
REM Ejecutar
java -cp bin Principal


### Opción 3: En Linux / macOS

```bash
# Crear carpeta bin
mkdir -p bin

# Compilar
javac -d bin src/*.java

# Ejecutar
java -cp bin Principal

--
## Salida esperada

==============================================
   SISTEMA DE GESTIÓN DE EMPLEADOS (POO)
==============================================

--- DATOS INICIALES ---
======================================
Nombre completo: Ana García López
Edad: 30 años
Sueldo base: 1200,00 €
Puesto: Vendedor
Comisión: 30.0 %
...

--- APLICANDO EXTRAS DE SUELDO ---
  -> Extra de 200.0 € APLICADO (comisión 30.0 < 45).
  -> NO se aplica el extra: la comisión es >= 45.
  -> Extra de 150.0 € APLICADO (antigüedad 8 >= 5 años).
  -> NO se aplica el extra: antigüedad < 5 años.

...

==============================================
   Fin de la ejecución
==============================================

## Conceptos POO aplicados
Concepto		Dónde se aplica
Clase abstracta		Empleado no puede instanciarse y obliga a implementar extrasSueldo()
Herencia		Vendedor extends Empleado, Administrativo extends Empleado
Encapsulamiento		Atributos private + métodos getters/setters
Polimorfismo		Empleado[] plantilla = { v1, v2, a1, a2 }
Sobrescritura		@Override en extrasSueldo() y mostrarDatos()
Reutilización		Uso de super() y super.mostrarDatos()

## Referencias teóricas
UF2404_UD2 - Introducción al Paradigma Orientado a Objetos
Grady Booch - Análisis y Diseño Orientado a Objetos, Capítulos 2 y 3
UF2404_UD6 - Programación Estructurada vs. Orientada a Objetos

## Autor
Proyecto desarrollado como parte de la UF2404 - Programación Orientada a Objetos.
By Sara Lopez Figueredo Sainz


