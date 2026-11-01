# Proyecto Login: arquitectura multicapa J2EE

**Unidad formativa:** UF2405 — Modelo de programación web y bases de datos  
**Módulo formativo:** MF0227_3 — Programación orientada a objetos  
**Certificado de profesionalidad:** IFCD0112 — Programación de lenguajes orientados a objetos y bases de datos relacionales

---

## 1. Introducción

`proyecto-login` es una aplicación web de autenticación de usuarios y gestión de sesiones desarrollada con tecnologías Java. Su objetivo es aplicar los principios de la programación web en capas y el patrón arquitectónico **Modelo-Vista-Controlador (MVC)**.

La aplicación separa la presentación, el control de las peticiones, la lógica de negocio y el acceso a los datos para facilitar el mantenimiento y la comprensión del código.

El proyecto incorpora scripts para automatizar la preparación del entorno y la ejecución en Windows. La estrategia de instalación local de Maven permite evitar modificaciones permanentes en las variables de entorno del sistema operativo.

> **Nota:** la ejecución aislada depende de la configuración real de los scripts y de las dependencias. Es necesario disponer de Java y de conexión a Internet cuando deban descargarse herramientas o bibliotecas.

## 2. Características principales

- **Arquitectura multicapa:** separación de las responsabilidades de presentación, lógica de negocio y acceso a datos.
- **Patrón MVC:** utilización de servlets como controladores para gestionar las peticiones HTTP.
- **Validación de formularios:** comprobaciones en el cliente mediante JavaScript y validación en el servidor mediante Java, si ambas están implementadas.
- **Gestión de sesiones:** utilización de `HttpSession` para mantener la información de sesión del usuario autenticado.
- **Acceso a datos desacoplado:** centralización de las operaciones de consulta de usuarios en `UsuarioDAO`.
- **Entorno de ejecución local:** scripts de Windows para preparar Maven y lanzar la aplicación sin necesidad de instalar Maven globalmente.
- **Documentación técnica:** archivos Markdown con información sobre arquitectura, incidencias, aprendizajes y despliegue.

## 3. Tecnologías utilizadas

| Categoría | Tecnología | Finalidad |
|---|---|---|
| Lenguaje | Java | Implementación de la lógica de la aplicación |
| Tecnologías web | Servlets y JSP | Gestión de peticiones y generación de vistas |
| Frontend | HTML5, CSS3 y JavaScript | Presentación e interacción con el usuario |
| Compilación | Apache Maven | Gestión de dependencias y construcción del proyecto |
| Servidor web | Apache Tomcat | Ejecución de la aplicación web |
| Acceso a datos | DAO y objetos Java | Organización de las operaciones sobre los datos |
| Persistencia | Simulación en memoria | Almacenamiento de usuarios de prueba |

**Consideraciones técnicas:**

- Java debe ser compatible con las versiones declaradas en `pom.xml`.
- Las versiones de Maven, Tomcat y Servlet API deben confirmarse en la configuración real.
- La versión documentada utiliza datos simulados en memoria, salvo que se haya incorporado posteriormente una base de datos.
- La simulación en memoria no equivale a una persistencia permanente: los datos pueden perderse al reiniciar la aplicación.

## 4. Estructura del proyecto

El proyecto sigue la estructura convencional de una aplicación web Maven:

```text
proyecto-login/
├── README.md
├── pom.xml
├── instalar_maven_local.bat
├── lanzar_proyecto.bat
│
├── doc/
│   ├── 01_memoria_tecnica.md
│   ├── 02_bitacora_errores.md
│   ├── 03_aprendizajes.md
│   ├── 04_guia_despliegue.md
│   ├── 05_manual_usuario.md
│   └── 06_manual_tecnico_desarrollador.md
│
└── src/
    └── main/
        ├── java/
        │   └── com/empresa/login/
        │       ├── model/Usuario.java
        │       ├── dao/UsuarioDAO.java
        │       ├── service/LoginService.java
        │       └── web/LoginServlet.java
        │
        └── webapp/
            ├── WEB-INF/web.xml
            ├── css/estilos.css
            ├── js/script.js
            ├── login.jsp
            ├── bienvenida.jsp
            └── error.jsp
```

> **Importante:** esta estructura es una referencia documental. Comprueba que los directorios y archivos indicados existen realmente en el proyecto antes de la entrega. Los manuales 05 y 06 deben incluirse únicamente si ya se han creado.

## 5. Requisitos previos

Para ejecutar la aplicación se recomienda disponer de los siguientes elementos:

- **Sistema operativo:** Windows 10 u 11.
- **Java Development Kit (JDK):** versión compatible con la configuración del proyecto.
- **Terminal de Windows:** para comprobar la instalación y diagnosticar posibles errores.
- **Navegador web:** Chrome, Firefox, Edge u otro navegador moderno.
- **Conexión a Internet:** necesaria para descargar Maven y las dependencias que no estén disponibles localmente.

Para comprobar que Java está instalado, abre una terminal y ejecuta:

```bat
java -version
```

Si el comando no se reconoce, revisa la instalación de Java y la configuración de la variable `PATH`.

## 6. Instalación y ejecución

### 6.1. Preparar Maven

Si el proyecto incluye el script `instalar_maven_local.bat`:

1. Abre la carpeta raíz `proyecto-login`.
2. Ejecuta `instalar_maven_local.bat`.
3. Espera a que finalice la descarga y extracción de Maven.
4. Comprueba que los archivos se han instalado en la ubicación configurada por el script.

Este paso solo será necesario de nuevo si la instalación local se elimina o deja de funcionar.

### 6.2. Compilar y arrancar el servidor

1. Ejecuta `lanzar_proyecto.bat` desde la carpeta raíz.
2. Espera a que se comprueben los requisitos y se descarguen las dependencias necesarias.
3. Comprueba que la compilación finaliza correctamente.
4. Verifica que el servidor se inicia sin errores.

El mensaje de inicio depende de la configuración y de la versión del servidor. Si se produce un error, consulta `doc/02_bitacora_errores.md`.

### 6.3. Acceder a la aplicación

Si el proyecto está configurado para utilizar el puerto `8080` y el contexto `proyecto-login`, abre la siguiente dirección en el navegador:

**http://localhost:8080/proyecto-login/**

Si no se puede acceder, comprueba el puerto, el nombre de contexto, el mapeo del servlet y los mensajes de la consola.

Para obtener instrucciones más detalladas, consulta `doc/04_guia_despliegue.md`.

## 7. Credenciales y pruebas de autenticación

La capa DAO puede incluir usuarios de prueba para comprobar los diferentes resultados del proceso de autenticación.

| Usuario | Contraseña de prueba | Resultado esperado |
|---|---|---|
| `admin` | `1234` | Acceso autorizado, si está configurado |
| `usuario` | `pass` | Acceso autorizado, si está configurado |
| `cualquiera` | `incorrecta` | Acceso denegado, si las credenciales no existen |

**Antes de realizar las pruebas**, confirma las credenciales y los roles en `UsuarioDAO.java`. Los valores anteriores son ejemplos documentados y no deben considerarse verificados sin revisar el código.

### 7.1. Pruebas recomendadas

- Enviar el formulario con los campos vacíos.
- Introducir una contraseña que no cumpla los requisitos de longitud definidos.
- Probar unas credenciales válidas.
- Probar unas credenciales incorrectas.
- Comprobar que se muestra la vista correspondiente al resultado.
- Verificar el comportamiento de la sesión tras la autenticación.

La validación del navegador mejora la experiencia de usuario, pero las comprobaciones de seguridad deben realizarse también en el servidor.

## 8. Documentación del proyecto

La carpeta `doc/` centraliza la documentación técnica y funcional de la aplicación.

| Archivo | Contenido |
|---|---|
| `01_memoria_tecnica.md` | Arquitectura, componentes y tecnologías utilizadas |
| `02_bitacora_errores.md` | Incidencias, causas y soluciones |
| `03_aprendizajes.md` | Aprendizajes técnicos y conclusiones |
| `04_guia_despliegue.md` | Requisitos, instalación, ejecución y pruebas |
| `05_manual_usuario.md` | Instrucciones de uso para el usuario final, si está disponible |
| `06_manual_tecnico_desarrollador.md` | Información técnica para mantenimiento y desarrollo, si está disponible |

## 9. Detención del servidor

Para detener la aplicación y liberar el puerto de ejecución:

1. Vuelve a la ventana de consola donde se está ejecutando el servidor.
2. Pulsa `Ctrl + C`.
3. Si Windows solicita confirmación para finalizar el proceso por lotes, sigue las instrucciones que aparezcan en pantalla.
4. Comprueba que el servidor ha terminado antes de volver a iniciarlo.

## 10. Seguridad y mejoras futuras

El proyecto constituye una base práctica para estudiar la autenticación y la programación web multicapa. Antes de utilizarlo en un entorno real, conviene incorporar las siguientes mejoras:

- Sustituir los datos simulados por persistencia real cuando sea necesario.
- Almacenar contraseñas mediante algoritmos de hash seguros.
- Validar los datos recibidos en el servidor.
- Gestionar de forma segura las sesiones y el cierre de sesión.
- Evitar la exposición de información técnica en los mensajes de error.
- Incorporar pruebas automatizadas para los principales flujos.
- Revisar las versiones de Java, Maven, Tomcat y las bibliotecas utilizadas.

## 11. Contexto académico

Este proyecto se desarrolla como actividad práctica relacionada con los siguientes contenidos formativos:

- **Unidad formativa:** UF2405 — Modelo de programación web y bases de datos.
- **Módulo formativo:** MF0227_3 — Programación orientada a objetos.
- **Certificado de profesionalidad:** IFCD0112 — Programación de lenguajes orientados a objetos y bases de datos relacionales.

La denominación oficial y la correspondencia entre unidades formativas, módulos y certificado deben contrastarse con la documentación de la acción formativa.

---

**Proyecto:** `proyecto-login`  
**Documentación:** `README.md` y carpeta `doc/`  
**Finalidad:** práctica académica de arquitectura multicapa y desarrollo web Java.