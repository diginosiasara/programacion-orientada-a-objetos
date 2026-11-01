\# Bitácora de Errores y Soluciones Técnicas



\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Unidad Formativa:\*\* UF2405  

\*\*Unidad Didáctica:\*\* UD3 – Identificación de lenguajes de programación web  

\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Fecha de referencia:\*\* Octubre de 2026  

\*\*Versión del documento:\*\* 1.0



\---



\## 1. Introducción



Esta bitácora recoge las incidencias técnicas identificadas durante el desarrollo, configuración y ejecución del proyecto.



Su finalidad es documentar cada problema mediante una estructura uniforme: descripción, causa probable, solución propuesta y comprobación del resultado.



Los estados de las incidencias deben actualizarse de acuerdo con las pruebas reales. La inclusión de una solución en este documento no demuestra, por sí sola, que se haya aplicado correctamente.



\## 2. Incidencia 1. Maven no se reconoce como comando



\### Descripción



Al ejecutar `lanzar\_proyecto.bat`, Windows puede mostrar:



```text

"mvn" no se reconoce como un comando interno o externo,

programa o archivo por lotes ejecutable.

```



\### Causa probable



Maven no está instalado, su ejecutable no se encuentra en el `PATH` o el script utiliza una ruta incorrecta.



\### Solución propuesta



Comprobar primero si existe el ejecutable local:



```text

tools\\apache-maven-3.9.9\\bin\\mvn.cmd

```



Si existe, configurar su ruta en el script:



```bat

set "MAVEN\_BIN=%\~dp0tools\\apache-maven-3.9.9\\bin"



if not exist "%MAVEN\_BIN%\\mvn.cmd" (

&#x20;   echo \[ERROR] No se encuentra Maven.

&#x20;   exit /b 1

)



call "%MAVEN\_BIN%\\mvn.cmd" -version

```



La variable `%\~dp0` permite obtener el directorio del archivo por lotes, lo que facilita localizar Maven independientemente del directorio de trabajo actual.



\### Verificación



Ejecutar el script y comprobar que Maven muestra su versión y la información del entorno Java.



\*\*Estado:\*\* pendiente de confirmar mediante ejecución, si no se dispone de evidencias.



\## 3. Incidencia 2. Error HTTP 404 en la página principal



\### Descripción



Al acceder a:



`http://localhost:8080/gestion-tareas/`



el servidor puede responder con un error HTTP 404.



\### Causas probables



\- La aplicación no se ha desplegado.

\- La URL no coincide con el contexto configurado.

\- `index.jsp` no se encuentra en la ubicación prevista.

\- No se ha configurado correctamente la página de bienvenida.

\- Se está ejecutando una aplicación o un artefacto distinto del esperado.



\### Solución propuesta



1\. Comprobar que la compilación finaliza correctamente.

2\. Revisar el contexto de despliegue configurado en `pom.xml`.

3\. Confirmar que `index.jsp` está en `src/main/webapp/` si debe ser accesible como página principal.

4\. Verificar la configuración de `web.xml`:



```xml

<welcome-file-list>

&#x20;   <welcome-file>index.jsp</welcome-file>

</welcome-file-list>

```



5\. Revisar los mensajes de inicio del servidor y la ruta de despliegue.



\### Verificación



Abrir la URL configurada y comprobar que se muestra la página principal.



\*\*Estado:\*\* pendiente de confirmar mediante prueba de acceso.



\## 4. Incidencia 3. Incompatibilidad entre el identificador del proyecto y los paquetes Java



\### Descripción



Durante la compilación pueden aparecer errores como:



```text

\[ERROR] cannot find symbol

symbol: class Tarea

```



También pueden surgir errores relacionados con imports, clases o paquetes no encontrados.



\### Causa probable



La configuración de Maven, los paquetes declarados y las referencias entre clases no coinciden.



Por ejemplo, puede existir una diferencia entre:



```xml

<groupId>com.empresa</groupId>

<artifactId>gestion-tareas</artifactId>

```



y una clase que utiliza un paquete diferente del esperado.



Es importante distinguir entre el identificador Maven del proyecto y el paquete Java: son elementos relacionados con la organización, pero no tienen que ser idénticos.



\### Solución propuesta



1\. Revisar los paquetes declarados al principio de los archivos `.java`.

2\. Comprobar que las rutas de los archivos coinciden con sus paquetes.

3\. Revisar los imports y los nombres reales de las clases.

4\. Verificar que `pom.xml` identifica el proyecto correcto.

5\. Eliminar referencias antiguas a otros proyectos únicamente cuando se confirme que no son necesarias.



Ejemplo:



```java

package com.empresa.tareas.web;

```



Esta declaración solo debe utilizarse si coincide con la organización real de la clase.



\### Verificación



Ejecutar una compilación limpia:



```bat

call tools\\apache-maven-3.9.9\\bin\\mvn.cmd clean compile

```



Comprobar que no aparecen errores de clases o símbolos sin resolver.



\*\*Estado:\*\* pendiente de confirmar mediante compilación.



\## 5. Incidencia 4. Rutas con espacios o caracteres especiales



\### Descripción



El proyecto puede presentar dificultades cuando se ejecuta desde directorios con espacios, tildes u otros caracteres especiales.



Ejemplo:



```text

D:\\central\\cursos2026\\Principios de la programación\\

```



\### Causa probable



Los scripts por lotes pueden interpretar incorrectamente las rutas que no están entre comillas. También pueden producirse problemas por el uso de rutas relativas o por configuraciones concretas de las herramientas.



Los espacios y las tildes no son necesariamente incompatibles con Java o Maven; el problema debe atribuirse a la configuración concreta que lo provoca.



\### Solución propuesta



Utilizar rutas entre comillas en los scripts:



```bat

set "PROJECT\_DIR=%\~dp0"



if not exist "%PROJECT\_DIR%pom.xml" (

&#x20;   echo \[ERROR] No se encuentra pom.xml.

&#x20;   exit /b 1

)

```



Si persisten errores, probar una ruta sencilla, por ejemplo:



```text

D:\\gestion-tareas\\

```



\### Verificación



Ejecutar los scripts desde la ubicación definitiva y comprobar que localizan `pom.xml`, Maven y los recursos del proyecto.



\*\*Estado:\*\* pendiente de confirmar.



\## 6. Incidencia 5. La ventana de comandos se cierra inmediatamente



\### Descripción



Al hacer doble clic en `lanzar\_proyecto.bat`, la ventana se cierra antes de poder leer el resultado.



\### Causa probable



El script termina por un error, finaliza su ejecución o no incluye un mecanismo para mantener visible la salida.



\### Solución propuesta



Añadir mensajes informativos y una pausa al final de la ejecución cuando sea necesario:



```bat

@echo off



