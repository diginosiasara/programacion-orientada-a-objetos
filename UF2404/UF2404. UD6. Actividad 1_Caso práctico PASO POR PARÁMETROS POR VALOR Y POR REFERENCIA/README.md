# Proyecto: Paso por Parámetros (Por Valor y Por Referencia) en Java

Este proyecto es una implementación práctica y teórica sobre cómo el lenguaje Java maneja el paso de argumentos a los métodos. Dado que en Java **todos los parámetros se pasan por valor**, este proyecto demuestra el comportamiento real con tipos primitivos y presenta tres soluciones de diseño para simular el "paso por referencia" y lograr que un método modifique el valor de una variable externa.

Este ejercicio forma parte de las prácticas de la Unidad Formativa **UF2404** (Principios de la programación orientada a objetos).

##  Tabla de Contenidos
- [Objetivos del Proyecto](#-objetivos-del-proyecto)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Requisitos Previos](#-requisitos-previos)
- [Instrucciones de Ejecución](#-instrucciones-de-ejecución)
- [Descripción de las Clases](#-descripción-de-las-clases)
- [Respuestas Teóricas (Tarea)](#-respuestas-teóricas-tarea)
- [Salida Esperada](#-salida-esperada)

---

## Objetivos del Proyecto
1. Comprender el mecanismo de paso de parámetros en Java (Por Valor).
2. Analizar por qué los tipos primitivos (`int`, `double`, etc.) no se modifican al ser pasados a un método.
3. Implementar tres estrategias diferentes para simular el paso por referencia en Java:
   - Uso de una clase contenedora (Wrapper).
   - Uso de un array de un solo elemento.
   - Uso del valor de retorno (Enfoque funcional).

## Estructura del Proyecto

ProyectoParametros/
│
├── README.md               <-- Este archivo
├── ejecutar.bat            <-- Script para compilar y ejecutar en Windows
│
└── src/                    <-- Carpeta de código fuente
    ├── Main.java           <-- Clase principal (Punto de entrada y demostraciones)
    ├── Contenedor.java     <-- Clase Wrapper para simular paso por referencia
    └── Solucion.java       <-- Clase con las 3 soluciones propuestas

---

## Requisitos Previos
Para poder compilar y ejecutar este proyecto, necesitas tener instalado en tu sistema:
Java Development Kit (JDK) versión 8 o superior.
La variable de entorno PATH configurada para reconocer los comandos javac y java.

---

## Instrucciones de Ejecución
Opción 1: Usando el script automático (Recomendado en Windows)
Abre la terminal o el explorador de archivos.
Navega hasta la carpeta raíz ProyectoParametros.
Haz doble clic en ejecutar.bat o ejecútalo desde la consola:

	ejecutar.bat

Opción 2: Compilación y ejecución manual (Multiplataforma)
Abre una terminal en la carpeta raíz ProyectoParametros y ejecuta los siguientes comandos:
1. Compilar las clases:

	javac src/*.java

2. Ejecutar el programa:

	java -cp src Main

---

## Descripción de las Clases
Main (Clase de Prueba)
Contiene el método main. Aquí se ejecuta el código original del enunciado para demostrar el paso por valor, y posteriormente se invocan las tres soluciones propuestas para demostrar cómo modificar variables desde un método.
Contenedor (Clase Wrapper)
Es una clase diseñada específicamente para encapsular un tipo primitivo (int). Al pasar un objeto de esta clase a un método, Java pasa el valor de la referencia (que apunta al mismo objeto en memoria), permitiendo que el método modifique el estado interno del objeto y que este cambio sea visible fuera del método.

---

## Solucion (Clase de Métodos)
Contiene los métodos estáticos que implementan las tres estrategias para modificar valores:
incrementarPorReferencia(Contenedor): Modifica el objeto wrapper.
incrementarConArray(int[]): Modifica el contenido de un array.
incrementarConRetorno(int): Calcula y devuelve el nuevo valor.

---

## Respuestas Teóricas (Tarea)
Pregunta 1: ¿Cuál es el valor de salida que produce el código anterior?
Salida del código original:
	Valor de n en main antes de llamar al método:1
	Valor de n en el método después incrementar:2
	Valor de n en main después de llamar al método:1

---

## Respuestas Teóricas (Tarea)
Pregunta 1: ¿Cuál es el valor de salida que produce el código anterior?
Salida del código original:
	Valor de n en main antes de llamar al método:1
	Valor de n en el método después incrementar:2
	Valor de n en main después de llamar al método:1

---

## Explicación:
En Java, los tipos primitivos (int, double, boolean, etc.) siempre se pasan por valor. Cuando se llama a incrementar(n), Java crea una copia exacta del valor de n (que es 1) y se la asigna al parámetro local del método. Dentro del método, n++ incrementa esa copia local a 2. Sin embargo, la variable original n en el método main permanece intacta e inalterada. Al salir del método, la copia se destruye y el main sigue viendo el valor 1.
Pregunta 2: Proponer una solución para que se puedan modificar los valores dentro de la función simulando un paso por referencia.
Java no soporta el paso por referencia nativo (como el ref de C# o los punteros de C++), pero podemos simularlo de tres formas:
Solución 1: Usar una Clase Contenedora (Wrapper) - Recomendada (OOP)
Creamos una clase (Contenedor) que envuelva el tipo primitivo. Los objetos en Java se pasan por "valor de su referencia". Esto significa que se copia la dirección de memoria, pero ambas referencias apuntan al mismo objeto. Por lo tanto, si el método modifica el estado interno del objeto (contenedor.valor++), el cambio es visible para quien llamó al método.
Solución 2: Usar un Array de un elemento
Los arrays en Java son objetos. Si pasamos un int[] array = {1} a un método, se pasa la referencia al array. El método no puede cambiar a qué array apunta la variable original, pero sí puede modificar el contenido de esa posición de memoria (array[0]++). Es un truco muy común, aunque menos elegante que la Solución 1.
Solución 3: Retornar el nuevo valor (Enfoque Funcional)
En lugar de intentar modificar la variable desde dentro, el método calcula el nuevo valor y lo devuelve mediante return. En el main, reasignamos el valor: n = incrementarConRetorno(n);. Es la forma más limpia, segura y libre de "efectos secundarios" (side-effects), aunque solo sirve para modificar una variable a la vez.


---

## Salida Esperada
Al ejecutar el programa correctamente, deberías obtener la siguiente salida en la consola, que demuestra la diferencia entre el paso por valor nativo y las simulaciones de paso por referencia:

========================================
EJEMPLO ORIGINAL (PASO POR VALOR)
========================================
Valor de n en main antes de llamar al método: 1
  [Original] Valor de n en el método después incrementar: 2
Valor de n en main después de llamar al método: 1

========================================
SOLUCIÓN 1: CLASE CONTENEDORA (Objeto)
========================================
Valor en main antes: 1
  [Solución 1] Valor dentro del método: 2
Valor en main después: 2

========================================
SOLUCIÓN 2: ARRAY DE UN ELEMENTO
========================================
Valor en main antes: 1
  [Solución 2] Valor dentro del método: 2
Valor en main después: 2

========================================
SOLUCIÓN 3: RETORNANDO EL VALOR
========================================
Valor en main antes: 1
  [Solución 3] Valor dentro del método: 2
Valor en main después: 2
========================================

