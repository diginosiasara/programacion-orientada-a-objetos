# EstructuraDatos - Análisis de Equilibrio de Paréntesis

## Descripción

Proyecto desarrollado en **Java** que resuelve tres cuestiones fundamentales
sobre estructuras de datos y paradigma orientado a objetos:

1. **Pregunta 1:** Verificación de equilibrio de paréntesis en una expresión
   mediante una **pila (stack)**.
2. **Pregunta 2:** Explicación teórica de la gestión de memoria en la creación
   y destrucción de objetos.
3. **Pregunta 3:** Enumeración y definición de las estructuras de datos más
   habituales, distinguiendo las propias de los lenguajes orientados a objetos.

---

## Estructura del proyecto

```
EstructuraDatos/
├── src/
│   ├── Programa.java        ← Clase principal (main)
│   ├── Pila.java            ← Implementación genérica de pila
│   └── Explicaciones.java   ← Respuestas teóricas en comentarios
├── bin/                     ← Archivos .class generados
├── ejecutar.bat             ← Script Windows
├── ejecutar.sh              ← Script Linux/Mac
└── README.md
```

---

## Cómo ejecutar

### En Windows
```bash
ejecutar.bat
```

### En Linux / macOS
```bash
chmod +x ejecutar.sh
./ejecutar.sh
```

### Manualmente
```bash
mkdir bin
javac -d bin src/*.java
java -cp bin Programa
```

---

## Algoritmo utilizado (Pregunta 1)

| Paso | Acción |
|------|--------|
| 1 | Recorrer la expresión carácter a carácter. |
| 2 | Si se encuentra `(` → **apilar**. |
| 3 | Si se encuentra `)` → **desapilar** (si la pila está vacía → no equilibrada). |
| 4 | Al terminar, la pila debe estar **vacía** para considerar la expresión equilibrada. |

**Complejidad:** O(n) en tiempo y O(n) en espacio (peor caso).

---

## Respuestas teóricas

### Pregunta 2 — Gestión de memoria
- **Creación:** operador `new` → reserva en el **heap** + invocación del constructor.
- **Destrucción:** automática mediante el **Garbage Collector** (algoritmos Mark-Sweep,
  Copying, Reference Counting, generacional).
- No existe liberación manual como en C/C++.

### Pregunta 3 — Estructuras de datos
- **Lineales:** arrays, listas, pilas, colas.
- **No lineales:** árboles (binarios, AVL, B), grafos.
- **Dispersión:** tablas hash, conjuntos.
- **En Java (OO):** framework `java.util.Collections` con interfaces `List`,
  `Set`, `Queue`, `Map` y sus implementaciones.

---

## Requisitos

- JDK 8 o superior.
- Variables de entorno `JAVA_HOME` y `PATH` configuradas correctamente.

---

## Autoría

Desarrollado como actividad formativa del módulo **Programación Orientada a Objetos**
(UF2404).
By Sara Lopez Figueredo Sainz 

---

## Resumen de lo entregado


Elemento			Ubicación
Clase principal Programa	src/Programa.java
Implementación de Pila		src/Pila.java
Respuestas teóricas (P2 y P3)	src/Explicaciones.java
Script de ejecución Windows	ejecutar.bat
Documentación del proyecto	README.md
