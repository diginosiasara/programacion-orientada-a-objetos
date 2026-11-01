# Proyecto: Relaciones entre Clases en Java (UF2404)

## Descripción
Este proyecto es una implementación práctica de los fundamentos del **Paradigma Orientado a Objetos (POO)**. Ha sido desarrollado como resolución de la tarea *"Relaciones entre Clases"* del módulo formativo **UF2404**, aplicando los conceptos teóricos de Análisis y Diseño Orientado a Objetos (Grady Booch) y la notación estándar **UML**.

El sistema simula dos dominios de problema distintos para demostrar la correcta implementación de los mecanismos de asociación, agregación, composición, herencia, dependencia, realización y clases de asociación.

---

##  Estructura del Proyecto

```text
ProyectoRelacionesClases/
│
├── src/                            # Código fuente Java
│   ├── InterfaceA.java             # Interfaz (Contrato de comportamiento)
│   ├── Conductor.java              # Clase base (Asociación)
│   ├── Rueda.java                  # Clase base (Agregación)
│   ├── MedioDeTransporte.java      # Clase Abstracta (Superclase)
│   ├── Auto.java                   # Subclase (Herencia)
│   ├── Moto.java                   # Subclase (Herencia)
│   ├── Viaje.java                  # Clase (Implementación de Interfaz)
│   ├── Ruta.java                   # Clase Contenedora (Composición)
│   ├── Area.java                   # Clase Compuesta
│   ├── RutaViaje.java              # Clase de Asociación
│   ├── Empleado.java               # Clase Abstracta (Diagrama 2)
│   ├── Profesor.java               # Subclase (Diagrama 2)
│   ├── PAS.java                    # Subclase (Diagrama 2)
│   └── Main.java                   # Punto de entrada del programa
│
├── bin/                            # Archivos compilados (.class)
├── compilar.bat                    # Script de compilación automatizada
├── ejecutar.bat                    # Script de ejecución automatizada
└── README.md                       # Documentación del proyecto

---

## Diagramas y Relaciones Implementadas (Pregunta 2)
A continuación se detalla cómo se ha traducido la notación UML a código Java, siguiendo los principios de Grady Booch:

Diagrama 1: Sistema de Transporte
Identificador		Relación UML		Concepto POO (Grady Booch)		Implementación en Java
<<rel1>>		Asociación		Relación semántica			MedioDeTransporte posee un atributo de tipo Conductor.
<<rel2>>		Agregación		Relación "Todo-Parte" débil		MedioDeTransporte tiene un array de Rueda[]. Las ruedas pueden existir sin el vehículo.
<<rel3>>		Generalización		Herencia ("Es-un")			Auto y Moto extienden (extends) de MedioDeTransporte.
<<rel4>>		Clase de Asociación	Asociación con atributos		RutaViaje contiene referencias a Viaje y Ruta, modelando la relación entre ambos.
<<rel5>>		Composición		Relación "Todo-Parte" fuerte		Ruta contiene Area[]. Si se destruye la Ruta (destruirAreas()), las Area mueren con ella.
<<rel6>>		Dependencia		Uso temporal				Viaje utiliza MedioDeTransporte como parámetro en el método planificarViaje().
Realización		Interfaz		Contrato de comportamiento		Viaje implementa (implements) la interfaz InterfaceA.

--

##  Diagrama 2: Jerarquía de Empleados	Identificador
Relación UML		Concepto POO		Implementación en Java
Flecha vacía		Generalización		Herencia Simple
						Profesor y PAS extienden (extends) de la clase abstracta Empleado.

--

## Cómo Ejecutar el Proyecto

Opción 1: Usando los scripts de Windows (Recomendado)
Asegúrate de tener instalado el JDK (Java Development Kit) y configurado en el PATH de tu sistema.
Abre la carpeta del proyecto.
Haz doble clic en compilar.bat para generar los archivos .class en la carpeta bin/.
Haz doble clic en ejecutar.bat para lanzar el programa y ver la salida en consola.

--

## Salida Esperada en Consola
Al ejecutar el programa, se instanciarán los objetos y se probarán las relaciones, mostrando una salida similar a la siguiente:

=== SISTEMA DE TRANSPORTE ===

Conductor [nombre=Juan Pérez, licencia=B-12345]
Auto [marca=Toyota, numeroPuertas=4, ...]
Tipo de vehículo: Automóvil
Capacidad de pasajeros: 4

...
Ruta creada con 3 áreas
RutaViaje [viaje=Viaje [...], ruta=Ruta [...]]
Todas las áreas han sido destruidas
Áreas después de destruir: 0

=== SISTEMA DE EMPLEADOS ===

Profesor [nombre=Dr. García, dni=12345678A, salario=3500.0, departamento=Informática, especialidad=Programación]
Tipo: Profesor
Puesto: Imparte clases de Programación en el departamento de Informática

PAS [nombre=Ana López, dni=87654321B, salario=2200.0, area=Administración, cargo=Secretaria]
Tipo: Personal Administrativo y de Servicios
Puesto: Secretaria en el área de Administración

=== FIN DEL PROGRAMA ===

--

##  Objetivos Académicos Cubiertos
Este proyecto cumple con los criterios de evaluación del módulo UF2404 - Programación Orientada a Objetos:
C2: Desarrollar clases aplicando los fundamentos del paradigma Orientado a Objetos.
CE2.3: Describir e implementar los mecanismos existentes para realizar las relaciones entre clases (Clases contenedores, objetos colección, herencia, interfaces).
Fundamentación Teórica (Grady Booch)
El diseño de las clases respeta las métricas de calidad de una abstracción descritas por Booch:
Encapsulamiento: Los atributos son private y se accede a ellos mediante getters/setters, ocultando la implementación interna.
Cohesión: Cada clase tiene un propósito único y bien definido (Ej. Ruta gestiona áreas, MedioDeTransporte gestiona ruedas y conductor).
Acoplamiento: Se minimiza la dependencia entre clases no relacionadas, utilizando interfaces (InterfaceA) para desacoplar el comportamiento del Viaje.
Jerarquía: Uso correcto de clases abstractas (Empleado, MedioDeTransporte) para evitar duplicidad de código y fomentar la reutilización.

--

## Requisitos
Lenguaje: Java (Compatible con JDK 8 o superior).
Sistema Operativo: Windows (para los archivos .bat), aunque el código Java es multiplataforma.
Desarrollado como material de apoyo para el módulo UF2404.