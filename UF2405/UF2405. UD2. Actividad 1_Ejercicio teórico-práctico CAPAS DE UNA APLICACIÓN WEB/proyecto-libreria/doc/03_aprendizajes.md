# Aprendizajes obtenidos

## 1. Reutilización de la arquitectura MVC

Al desarrollar el proyecto «Librería» después del proyecto «Usuarios», se comprobó la utilidad de la arquitectura MVC.

El cambio del dominio de negocio, de usuarios a libros, requirió modificar principalmente las clases del modelo (`Libro.java`) y del acceso a datos (`LibroDAO.java`). El controlador y los scripts de despliegue se mantuvieron prácticamente iguales.

Esto demuestra la importancia de la **separación de responsabilidades (SoC)** y de diseñar componentes reutilizables.

## 2. Inicialización de H2 Database

Se aprendió que H2 permite ejecutar instrucciones SQL al establecer una conexión mediante la cláusula `INIT` en la URL JDBC.

Ejemplo utilizado en `LibroDAO`:

```java
String url = "jdbc:h2:mem:libreria;DB_CLOSE_DELAY=-1;INIT=CREATE TABLE IF NOT EXISTS libros...";
```

Este mecanismo facilita la inicialización automática de una base de datos en memoria y reduce la necesidad de mantener scripts SQL externos para el entorno de pruebas.

## 3. Gestión de rutas en Windows

Se consolidó el conocimiento sobre la ejecución de scripts `.bat` y la gestión de rutas que contienen espacios.

Se aprendió a:

- Utilizar `cd /d "%~dp0"` para acceder a la carpeta del script, incluso si se encuentra en otra unidad.
- Utilizar comillas en las asignaciones de variables de entorno.
- Añadir herramientas locales al `PATH` sin modificar permanentemente la configuración del sistema.

Ejemplo:

```bat
set "PATH=%cd%\tools\apache-maven-3.9.6\bin;%PATH%"
```

## 4. Despliegue limpio

Se comprendió la importancia de excluir del paquete de entrega las carpetas generadas durante la compilación (`target/`) y las herramientas locales (`tools/`).

Esta práctica reduce el tamaño de la entrega y permite comprobar que el proyecto puede compilarse a partir del código fuente.

## 5. Depuración de scripts por lotes

Se aprendió que el comando `pause`, colocado después de cada bloque lógico, permite identificar el punto en el que falla un script.

Este método facilita comprobar por separado la detección de Java, la localización de Maven y la ejecución de los comandos de compilación.

## 6. Conclusión general

El desarrollo del proyecto permitió reforzar conocimientos de Java, Maven, JDBC, bases de datos relacionales, arquitectura MVC y despliegue web.

También puso de manifiesto la importancia de documentar los errores, mantener una estructura organizada y separar la lógica de negocio del acceso a datos y de la presentación.