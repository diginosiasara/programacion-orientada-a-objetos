# Tarea: Herencia en Java



## Descripción del Proyecto



Este proyecto implementa un sistema de clases en Java que demuestra el concepto de \*\*herencia\*\* mediante la creación de una jerarquía de vehículos. Se define una clase base `Vehiculo` y dos clases derivadas: `Coche` y `Bicicleta`.



## Objetivos



- Implementar una clase base (`Vehiculo`) con atributos y métodos comunes.

- Crear clases hijas (`Coche` y `Bicicleta`) que hereden de la clase padre.

- Demostrar el uso de `super()` en los constructores.

- Mostrar la reutilización de código mediante herencia.

- Responder preguntas teóricas sobre herencia y herencia múltiple.



## Estructura del Proyecto

Tarea\_Herencia/

│

├── Vehiculo.java # Clase padre (base)

├── Coche.java # Clase hija de Vehiculo

├── Bicicleta.java # Clase hija de Vehiculo

├── Main.java # Clase principal con método main()

├── ejecutar.bat # Script para compilar y ejecutar en Windows

└── README.md # Este archivo





## Requisitos



- \*\*Java Development Kit (JDK)\*\* versión 8 o superior

- Variable de entorno `JAVA\_HOME` configurada correctamente

- `javac` y `java` disponibles en el PATH del sistema



### Verificar instalación de Java

Abre una terminal (CMD o PowerShell) y ejecuta:


java -version

javac -versión


Cómo Ejecutar el Proyecto

Opción 1: Usando el archivo .bat (Recomendado para Windows)

Coloca todos los archivos .java y el archivo ejecutar.bat en la misma carpeta.

Haz doble clic en ejecutar.bat o ejecútalo desde la terminal:



# Compilar todos los archivos Java

javac Vehiculo.java Coche.java Bicicleta.java Main.java



# Ejecutar el programa

java Main



&#x20;Salida Esperada

Vehículo original: Vehiculo{color=1, numeroSerie=1001}

Vehículo modificado: Vehiculo{color=2, numeroSerie=2002}



Coche original: Coche{color=3, numeroSerie=3001, cilindrada=1600}

Coche modificado: Coche{color=4, numeroSerie=4004, cilindrada=2000}



Bicicleta original: Bicicleta{color=5, numeroSerie=5001}

Bicicleta modificada: Bicicleta{color=6, numeroSerie=6006}



escripción de las Clases

Clase Vehiculo (Clase Padre)

Atributos:

color (int): Color del vehículo

numeroSerie (int): Número de serie único

Métodos:

cambiaNumeroSerie(int nuevoNumero): Modifica el número de serie

pinta(int nuevoColor): Cambia el color del vehículo

getColor(), getNumeroSerie(): Getters

toString(): Representación en texto del objeto

Clase Coche (Clase Hija)

Hereda de Vehiculo y añade:

Atributo propio: cilindrada (int)

Métodos propios: getCilindrada(), setCilindrada(int)

Clase Bicicleta (Clase Hija)

Hereda de Vehiculo sin añadir nuevos atributos ni métodos.

Demuestra que la herencia funciona incluso sin extensiones.


# Autor
Proyecto desarrollado como parte de la tarea de Herencia del módulo de Programación Orientada a Objetos.
By Sara Lopez Figueredo Sainz

# Fecha
Septiembre 2026

# Licencia
Material educativo de uso libre para fines académicos.