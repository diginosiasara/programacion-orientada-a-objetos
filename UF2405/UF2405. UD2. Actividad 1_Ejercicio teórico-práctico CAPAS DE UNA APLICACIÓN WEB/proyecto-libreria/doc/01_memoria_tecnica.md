# Memoria técnica: Librería Virtual J2EE

## 1. Objetivos del proyecto

Desarrollar una aplicación web para la gestión de un catálogo de libros mediante una **arquitectura multicapa** y el **patrón Modelo-Vista-Controlador (MVC)**.

El sistema está diseñado para ser portable y facilitar su ejecución sin necesidad de instalar manualmente un servidor de aplicaciones o una base de datos en el sistema operativo anfitrión.

## 2. Arquitectura del sistema

La aplicación se organiza en capas lógicas que separan la presentación, la lógica de negocio, el acceso a datos y la infraestructura.

```text
┌─────────────────────────────────────────────────────────────┐
│ CAPA DE PRESENTACIÓN                                        │
│ - index.html: página de inicio                              │
│ - LibroServlet.java: controlador /catalogo                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│ CAPA DE NEGOCIO                                             │
│ - LibroService.java: servicios y reglas de negocio           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│ CAPA DE DATOS                                               │
│ - LibroDAO.java: conexión JDBC y consultas SQL               │
│ - Libro.java: entidad y JavaBean                             │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│ CAPA DE INFRAESTRUCTURA                                     │
│ - H2 Database: base de datos relacional en memoria           │
└─────────────────────────────────────────────────────────────┘
```

## 3. Tecnologías utilizadas

| Tecnología | Versión | Función |
|---|---|---|
| Java JDK | 25.0.4.1 | Lenguaje de programación |
| Apache Maven | 3.9.6 | Gestión de dependencias y compilación |
| Apache Tomcat | 7.0.47 (embebido) | Servidor de aplicaciones |
| H2 Database | 2.2.224 | Base de datos relacional en memoria |
| Servlet API | 3.1.0 | API para el desarrollo de servlets |

## 4. Características principales

### 4.1. Inicialización automática de la base de datos

La clase `LibroDAO` utiliza la cláusula `INIT=` en la URL JDBC para crear la tabla `libros` e insertar tres registros de prueba:

- El Quijote.
- 1984.
- Cien años de soledad.

### 4.2. Herramientas locales

Se utiliza una instalación local de Maven en la carpeta `tools/`, evitando modificar las variables de entorno globales de Windows.

### 4.3. Empaquetado ligero

Los paquetes de entrega excluyen las carpetas `target/` y `tools/` para reducir el tamaño de los archivos y distribuir principalmente el código fuente y los recursos necesarios.

## 5. Conclusión

El proyecto permite aplicar los principios de programación orientada a objetos, separación de responsabilidades, arquitectura multicapa y despliegue de aplicaciones web Java mediante herramientas de compilación y ejecución integradas.