# Memoria Técnica - Actividad 3 UF2405 UD3

**Proyecto:** actividad3-uf2405  
**Unidad Formativa:** UF2405 - Modelo de programación web y bases de datos  
**Unidad Didáctica:** UD3 - Lenguajes de programación web  
**Actividad:** Actividad 3 - Ejercicio teórico-práctico "Lenguajes Orientados a Objetos"  
**Fecha:** Octubre 2026  
**Autor:** Sara López Figueredo Sainz

---

## 1. Introducción y Objetivos

El presente proyecto implementa la **Actividad 3 de la UD3** de la UF2405, cuyo objetivo es aplicar los conceptos básicos del modelo de programación web mediante la creación de una página web que integre HTML, CSS y JavaScript, aplicando el principio de **separación de responsabilidades** y el patrón **Modelo-Vista-Controlador (MVC)** con tecnologías Java EE.

### Objetivos específicos:
- **Actividad 1:** Reproducir una página web con fondo amarillo, imagen, encabezados, enlaces, párrafos y texto con formato (cursiva y negrita).
- **Actividad 2:** Añadir interactividad mediante JavaScript con un botón que muestre un mensaje al pulsarlo.
- **Separación de responsabilidades:** HTML (estructura), CSS (presentación), JavaScript (comportamiento) y Java Servlet (control).
- **Despliegue aislado:** Sin instalar Maven ni Tomcat en el sistema operativo.
- **Cumplimiento del criterio CE1.8:** Aplicar características de lenguajes orientados a objetos (JSP, Servlets) a la preparación de la capa de presentación.

---

## 2. Arquitectura del Sistema

### 2.1. Stack Tecnológico

| Componente | Tecnología | Versión | Función |
|-----------|-----------|---------|---------|
| **Lenguaje de servidor** | Java (JSP/Servlet) | JDK 8+ | Controlador MVC |
| **Servidor web** | Apache Tomcat (embebido) | 7.0.47 | Contenedor de aplicaciones |
| **Gestor de dependencias** | Apache Maven | 3.9.9 | Compilación y gestión |
| **Lenguaje de presentación** | HTML5 | - | Estructura semántica |
| **Hojas de estilo** | CSS3 | - | Diseño visual |
| **Scripting cliente** | JavaScript (ES5) | - | Interactividad |

### 2.2. Arquitectura MVC Aplicada

```
┌─────────────────────────────────────────────────────────────┐
│                    CAPA DE PRESENTACIÓN                      │
│  (index.jsp + estilos.css + script.js)                       │
└──────────────────────────────┬──────────────────────────────┘
                               │ HTTP GET
┌──────────────────────────────▼──────────────────────────────┐
│                    CAPA DE CONTROL (Servlet)                 │
│                    (Actividad3Servlet.java)                  │
└──────────────────────────────┬──────────────────────────────┘
                               │ forward()
┌──────────────────────────────▼──────────────────────────────┐
│                    CAPA DE VISTA (JSP)                       │
│                    (index.jsp procesado por Tomcat)          │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Estructura del Proyecto

```
actividad3-uf2405/
├── pom.xml                              # Configuración de Maven
├── instalar_maven_local.bat             # Script de instalación aislada
├── lanzar_proyecto.bat                  # Script de compilación y ejecución
── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── empresa/
        │           └── web/
        │               └── Actividad3Servlet.java  # Controlador
        │
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml              # Descriptor de despliegue
            ├── css/
            │   └── estilos.css          # Hoja de estilos (PRESENTACIÓN)
            ├── js/
            │   └── script.js            # JavaScript (COMPORTAMIENTO)
            └── index.jsp                # Vista (ESTRUCTURA HTML + JSP)
```

---

## 4. Descripción de Componentes

### 4.1. Capa de Control: `Actividad3Servlet.java`

Servlet que actúa como controlador MVC. Recibe peticiones HTTP GET y las redirige a la vista `index.jsp` mediante `RequestDispatcher.forward()`.

**Características orientadas a objetos:**
- Herencia: extiende de `HttpServlet`.
- Polimorfismo: sobrescribe los métodos `doGet()` y `doPost()`.
- Encapsulamiento: los atributos son privados y se acceden mediante métodos.

### 4.2. Capa de Presentación: `index.jsp`

Archivo JSP que combina HTML5 estático con expresiones Java dinámicas. Contiene:
- Estructura semántica HTML5.
- Expresión JSP `<%= new java.util.Date() %>` para mostrar la fecha del servidor.
- Enlaces a recursos externos CSS y JS.

### 4.3. Capa de Estilo: `css/estilos.css`

Hoja de estilos CSS3 que define:
- Fondo amarillo (`#FFFF00`) como en la imagen original.
- Tipografía Times New Roman.
- Estilos para encabezados, párrafos, enlaces y botón.
- Diseño responsive básico.

### 4.4. Capa de Comportamiento: `js/script.js`

Script JavaScript que aporta:
- Función `mostrarMensaje()` solicitada en la Actividad 2.
- Mensajes de diagnóstico en consola.
- Inicialización de eventos al cargar la página.

### 4.5. Configuración: `pom.xml` y `web.xml`

- **pom.xml:** Define dependencias (javax.servlet-api) y plugins (maven-compiler, tomcat7-maven-plugin).
- **web.xml:** Configura el archivo de bienvenida (`Actividad3Servlet`).

---

## 5. Cumplimiento de los Objetivos de la Actividad

### Actividad 1: Código HTML
Se ha reproducido la web solicitada con:
- ✅ Fondo amarillo.
- ✅ Imagen centrada.
- ✅ Líneas horizontales separadoras.
- ✅ Enlace web ("Nombre del vínculo").
- ✅ Encabezados `<h1>` y `<h2>`.
- ✅ Enlace de correo electrónico (`mailto:`).
- ✅ Párrafos de texto.
- ✅ Texto en cursiva y negrita sin salto de párrafo.

### Actividad 2: Código JavaScript
Se ha añadido:
- ✅ Botón con evento `onclick`.
- ✅ Función `mostrarMensaje()` que ejecuta `alert("Mensaje mostrado al pulsar el botón")`.
- ✅ Separación del JS en archivo externo (`script.js`).

### Criterio CE1.8: Lenguajes orientados a objetos
Se demuestra mediante:
- **Servlet Java:** Clase que extiende `HttpServlet` (herencia).
- **JSP:** Generación dinámica de contenido en servidor.
- **Separación de capas:** MVC aplicado correctamente.

---

## 6. Conclusiones

El proyecto cumple satisfactoriamente con todos los objetivos de la Actividad 3 de la UD3:
1. Reproducción fiel de la página web solicitada.
2. Implementación de interactividad con JavaScript.
3. Aplicación del principio de separación de responsabilidades.
4. Uso de tecnologías orientadas a objetos (Java Servlet, JSP).
5. Despliegue 100% aislado sin afectar al sistema operativo.

---

*Memoria Técnica - Actividad 3 UF2405 UD3 - Octubre 2026*
