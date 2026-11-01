# Proyecto: Gestión de Usuarios con Polimorfismo en Java

Este proyecto es una implementación práctica de los conceptos de **Herencia** y **Polimorfismo** en Java. Ha sido desarrollado como parte de la tarea de la Unidad Formativa **UF2404** (Principios de la programación orientada a objetos). 

El sistema simula la gestión de los miembros de una web, diferenciando sus roles y comportamientos mediante una jerarquía de clases.

## Tabla de Contenidos
- [Objetivos del Proyecto](#-objetivos-del-proyecto)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Requisitos Previos](#-requisitos-previos)
- [Instrucciones de Ejecución](#-instrucciones-de-ejecución)
- [Descripción de las Clases](#-descripción-de-las-clases)
- [Conceptos Demonstrados](#-conceptos-demonstrados)
- [Respuesta a la Pregunta Teórica](#-respuesta-a-la-pregunta-teórica)

---

## Objetivos del Proyecto
1. Implementar una jerarquía de clases utilizando **Herencia**.
2. Aplicar el concepto de **Polimorfismo** para tratar objetos de diferentes subclases de manera uniforme.
3. Demostrar el uso de **Encapsulamiento** y métodos `getter/setter` para la interacción entre clases.
4. Crear un script de automatización (`.bat`) para compilar y ejecutar el proyecto fácilmente.

## Estructura del Proyecto
```text
ProyectoPolimorfismo/
│
├── README.md               <-- Este archivo
├── ejecutar.bat            <-- Script para compilar y ejecutar en Windows
│
└── src/                    <-- Carpeta de código fuente
    ├── Usuario.java        <-- Superclase
    ├── Moderador.java      <-- Subclase
    ├── Administrador.java  <-- Subclase
    └── Main.java           <-- Clase principal (Punto de entrada)

---

## Requisitos Previos
Para poder compilar y ejecutar este proyecto, necesitas tener instalado en tu sistema:
Java Development Kit (JDK) versión 8 o superior.
La variable de entorno PATH configurada para reconocer los comandos javac y java.

---

##  Instrucciones de Ejecución
Opción 1: Usando el script automático (Recomendado en Windows)
Abre la terminal o el explorador de archivos.
Navega hasta la carpeta raíz ProyectoPolimorfismo.
Haz doble clic en ejecutar.bat o ejecútalo desde la consola:
   ejecutar.bat

Opción 2: Compilación y ejecución manual (Multiplataforma)
Abre una terminal en la carpeta raíz ProyectoPolimorfismo y ejecuta los siguientes comandos:
1. Compilar las clases:
javac src/*.java

2. Ejecutar el programa:
java -cp src Main
	
---

## Descripción de las Clases
Usuario (Superclase)
Representa a cualquier miembro genérico de la web.
Atributos privados: mensajes (int), correo (String), nick (String).
Métodos: incrementa(), decrementa(), modificaCorreo().
Moderador (Subclase)
Hereda de Usuario. Representa a un usuario con permisos de moderación.
Atributos adicionales: papelera (int).
Métodos adicionales: papelerainc().
Administrador (Subclase)
Hereda de Usuario. Representa al usuario con máximos permisos.
Atributos adicionales: papelera (int), baneos (int).
Métodos adicionales: papelerainc(), baneosinc(), cambiaNick().
Main (Clase de Prueba)
Contiene el método main. Aquí se instancia un array de tipo Usuario[] donde se almacenan objetos de las tres clases. Se recorre el array demostrando cómo el método incrementa() se comporta de forma polimórfica.

---

##  Conceptos Demonstrados
1. Herencia
Las clases Moderador y Administrador reutilizan el código de Usuario mediante la palabra clave extends, evitando la duplicidad de código (atributos como nick o correo y métodos como incrementa()).
2. Polimorfismo
En la clase Main, se utiliza un array de la superclase:
	
	Usuario[] usuarios = new Usuario[3];
	usuarios[0] = new Usuario(...);
	usuarios[1] = new Moderador(...);
	usuarios[2] = new Administrador(...);

Al iterar sobre el array y llamar a u.incrementa(), Java sabe automáticamente qué método ejecutar en tiempo de ejecución dependiendo del tipo real del objeto, sin necesidad de usar condicionales (if/else).

---

##Casting (Moldeo)
Para acceder a métodos específicos de las subclases (como papelerainc()), se utiliza el operador instanceof y el casting explícito:

	if (usuarios[1] instanceof Moderador) {
	    ((Moderador) usuarios[1]).papelerainc(); 
	}

---

## Respuesta a la Pregunta Teórica (Pregunta 2)
¿Qué es el polimorfismo y qué aporta?
Definición:
El polimorfismo (del griego "muchas formas") es la capacidad que tienen los objetos de una clase de responder al mismo mensaje o método de manera diferente según su tipo específico. En el contexto de la herencia, permite tratar a objetos de diferentes subclases (como Moderador o Administrador) como si fueran objetos de la superclase (Usuario).
Qué aporta al desarrollo de software:
Reutilización de código: Permite escribir código genérico (como un bucle for que recorre un array de Usuario) que funcionará automáticamente para todas las futuras subclases que se creen.
Extensibilidad: Es muy fácil añadir nuevos tipos de usuarios (por ejemplo, SuperAdministrador) sin tener que modificar el código existente que gestiona la lista de usuarios.
Simplicidad y Mantenibilidad: Simplifica la lógica del programa. En lugar de tener un if para cada tipo de usuario, podemos enviar el mismo mensaje (incrementa()) a todos y cada uno sabe cómo responder internamente.
Desarrollado como ejercicio práctico para la UF2404 - Principios de la programación orientada a objetos.

---
