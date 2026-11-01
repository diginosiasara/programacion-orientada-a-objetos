# Memoria técnica: sistema de login multicapa (J2EE)

**Proyecto:** `proyecto-login`  
**Unidad formativa:** UF2405 — Modelo de programación web y bases de datos  
**Ámbito:** UD2 — Programación en capas

---

## 1. Introducción

Este documento describe la arquitectura, el diseño y la implementación de la aplicación web `proyecto-login`. El proyecto tiene como objetivo aplicar de forma práctica el patrón **Modelo-Vista-Controlador (MVC)** y una arquitectura organizada por capas, separando la presentación, el control de las peticiones, la lógica de negocio y el acceso a los datos.

## 2. Arquitectura del sistema

La aplicación sigue una arquitectura multicapa. Cada componente tiene una responsabilidad definida, lo que facilita el mantenimiento, las pruebas y la evolución del sistema.

### 2.1. Patrón Modelo-Vista-Controlador (MVC)

- **Modelo (Model):** representa los datos y las entidades del dominio. En este proyecto, se utiliza `Usuario.java`.
- **Vista (View):** presenta la información y permite la interacción con el usuario mediante JSP, HTML, CSS y JavaScript.
- **Controlador (Controller):** recibe las peticiones HTTP, coordina la lógica de negocio y determina la respuesta. Esta función corresponde a `LoginServlet.java`.

### 2.2. Capas y componentes

1. **Capa de presentación:** incluye `login.jsp`, `bienvenida.jsp`, `error.jsp`, `css/estilos.css` y `js/script.js`. Gestiona la interfaz y las validaciones del lado del cliente.
2. **Capa de control web:** incluye `LoginServlet.java`. Recibe las peticiones HTTP y coordina el proceso de autenticación.
3. **Capa de lógica de negocio:** incluye `LoginService.java`. Aplica las reglas de validación y coordina las operaciones necesarias.
4. **Capa de acceso a datos (DAO):** incluye `UsuarioDAO.java`. Consulta los usuarios y valida las credenciales. En la versión descrita, los datos se simulan en memoria.
5. **Capa de modelo:** incluye `Usuario.java`, que representa los datos del usuario mediante un JavaBean.

## 3. Tecnologías utilizadas

- **Lenguaje de programación:** Java, JDK 8 o superior.
- **Tecnologías web:** Java Servlets 3.1 y JavaServer Pages (JSP).
- **Tecnologías cliente:** HTML5, CSS3 y JavaScript.
- **Gestión de dependencias y compilación:** Apache Maven 3.9.x.
- **Servidor web:** Apache Tomcat, ejecutado mediante la configuración del proyecto.
- **Persistencia:** simulación en memoria mediante objetos Java; no se utiliza una base de datos real en esta versión.

> **Nota técnica:** las versiones efectivas de Java, Servlet API, Maven y Tomcat deben confirmarse en `pom.xml` y en la configuración de ejecución del proyecto.

## 4. Estructura del proyecto

La organización sigue la estructura convencional de un proyecto web Maven:

```text
proyecto-login/
├── pom.xml
├── instalar_maven_local.bat
├── lanzar_proyecto.bat
├── doc/
│   ├── 01_memoria_tecnica.md
│   ├── 02_bitacora_errores.md
│   ├── 03_aprendizajes.md
│   └── 04_guia_despliegue.md
└── src/
    └── main/
        ├── java/
        │   └── com/empresa/login/
        │       ├── model/Usuario.java
        │       ├── dao/UsuarioDAO.java
        │       ├── service/LoginService.java
        │       └── web/LoginServlet.java
        └── webapp/
            ├── WEB-INF/web.xml
            ├── css/estilos.css
            ├── js/script.js
            ├── login.jsp
            ├── bienvenida.jsp
            └── error.jsp
```

## 5. Flujo de autenticación

1. El usuario introduce sus credenciales en `login.jsp` y envía el formulario mediante una petición HTTP POST.
2. El navegador envía la petición a la ruta configurada para `LoginServlet`.
3. `LoginServlet` obtiene los parámetros `username` y `password`.
4. El controlador invoca el método de autenticación de `LoginService`.
5. `LoginService` aplica las validaciones y solicita a `UsuarioDAO` que compruebe las credenciales.
6. Si las credenciales son válidas, la aplicación guarda los datos del usuario en la sesión HTTP y muestra `bienvenida.jsp`.
7. Si las credenciales no son válidas, la aplicación dirige al usuario a `error.jsp`.

## 6. Consideraciones y mejoras futuras

- Sustituir la simulación en memoria por una base de datos y una implementación JDBC.
- Almacenar contraseñas mediante un algoritmo de hash seguro, nunca en texto plano.
- Añadir controles de seguridad, gestión de errores y pruebas automatizadas.
- Revisar las versiones de las dependencias y del servidor para mantener la compatibilidad.

## 7. Conclusiones

La aplicación permite demostrar los fundamentos de la programación web en Java mediante una arquitectura que separa responsabilidades y facilita el mantenimiento. La evolución hacia una persistencia real y una autenticación reforzada permitiría aproximar el proyecto a un entorno de producción.