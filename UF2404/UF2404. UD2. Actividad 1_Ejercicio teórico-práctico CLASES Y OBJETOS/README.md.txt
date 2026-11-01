# Proyecto Series y Videojuegos - Programación Orientada a Objetos

## Descripción

Este proyecto es una implementación práctica del **Paradigma de Orientación a Objetos (POO)** en Java. Consiste en un sistema que permite gestionar dos tipos de elementos multimedia: **Series** y **Videojuegos**, los cuales comparten un comportamiento común mediante una interfaz llamada `Entregable`.

El proyecto ha sido desarrollado como parte de la Unidad Formativa **UF2404** del módulo de Desarrollo de Aplicaciones con Tecnologías Web.

---

## Objetivos

- Aplicar los fundamentos del paradigma orientado a objetos.
- Implementar **interfaces** y **polimorfismo**.
- Trabajar con **constructores**, **encapsulación** y **sobrescritura de métodos**.
- Utilizar `this` para diferenciar atributos de parámetros.
- Practicar el **casting** de objetos.

---

## Estructura del Proyecto
ProyectoSeriesVideojuegos/
│
├── Entregable.java # Interfaz con el comportamiento común
├── Serie.java # Clase que representa una serie
├── Videojuego.java # Clase que representa un videojuego
├── Main.java # Clase principal con pruebas
├── ejecutar_proyecto.bat # Script para compilar y ejecutar (Windows)
└── README.md # Este archivo
---

## Clases e Interfaz

### Interfaz `Entregable`
Define el comportamiento común para objetos que pueden ser entregados y devueltos:
- `entregar()` → Marca el elemento como entregado.
- `devolver()` → Marca el elemento como devuelto.
- `isEntregado()` → Devuelve el estado actual.

### Clase `Serie`
Representa una serie de televisión con los siguientes atributos:
| Atributo | Tipo | Valor por defecto |
|----------|------|-------------------|
| título | String | "" |
| númeroTemporadas | int | 3 |
| entregado | boolean | false |
| genero | String | "" |
| creador | String | "" |

### 🔹 Clase `Videojuego`
Representa un videojuego con los siguientes atributos:
| Atributo | Tipo | Valor por defecto |
|----------|------|-------------------|
| título | String | "" |
| horasEstimadas | int | 10 |
| entregado | boolean | false |
| genero | String | "" |
| compañia | String | "" |

---

## ⚙️ Requisitos Previos

- **Java Development Kit (JDK)** versión 8 o superior.
- Verificar la instalación con:
  ```bash
  java -version
  javac -versión

---

## Cómo Compilar y Ejecutar
Opción 1: Usando el script .bat (Windows)
Simplemente haz doble clic en el archivo ejecutar_proyecto.bat o ejecútalo desde la consola:
ejecutar_proyecto.bat

Opción 2: Manualmente desde la terminal
Compilar:
javac Entregable.java Serie.java Videojuego.java Main.java
Ejecutar:
java Main

--

## Ejemplo de Uso
// Crear una serie con constructor por defecto
Serie serie1 = new Serie();

// Crear una serie con título y creador
Serie serie2 = new Serie("Breaking Bad", "Vince Gilligan");

// Crear un videojuego con todos los atributos
Videojuego juego1 = new Videojuego("Zelda", 50, "Aventura", "Nintendo");

// Usar la interfaz Entregable (polimorfismo)
juego1.entregar();
System.out.println(juego1.isEntregado()); // true

juego1.devolver();
System.out.println(juego1.isEntregado()); // false

// Comparar series
System.out.println(serie2.compareTo(serie1)); // 1 (más temporadas)

--

## Salida Esperada
Comparando series: -1
Comparando videojuegos: 1
Serie entregada: true
Serie devuelta: false
Serie{titulo='Breaking Bad', numeroTemporadas=3, entregado=false, genero='', creador='Vince Gilligan'}
Serie{titulo='Stranger Things', numeroTemporadas=4, entregado=false, genero='Ciencia Ficcion', creador='Los Duffer'}
Serie{titulo='', numeroTemporadas=3, entregado=false, genero='', creador=''}
Videojuego{titulo='Zelda', horasEstimadas=50, entregado=false, genero='Aventura', compania='Nintendo'}

--

## Conceptos POO Aplicados
Concepto		Dónde se aplica
Clases y Objetos	Serie, Videojuego
Encapsulación		Atributos privados + getters/setters
Constructores		Por defecto, parcial y completo
Interfaces		Entregable
Polimorfismo		Array de tipo Entregable
Sobrescritura		Método toString()	
Casting			En el método compareTo()
Uso de this		En constructores y métodos

--

## Autor
Desarrollado como actividad práctica de la UF2404
Módulo: Desarrollo de Aplicaciones con Tecnologías Web
Tema: Clases y Objetos - Paradigma de Orientación a Objetos
By Sara Lopez Figueredo Sainz

--

## Fecha
Septiembre 2026

--

## Referencias
Documentos de apoyo UF2404 (UD1, UD2, UD4, UD6, UD7, UD9)
Bertrand Meyer - Object Oriented Software Construction
Timothy Budd - An Introduction to OO Programming