\# Guía de Instalación, Ejecución y Verificación



\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Unidad Formativa:\*\* UF2405 – Modelo de programación web y bases de datos  

\*\*Unidad Didáctica:\*\* UD3 – Identificación de códigos de cada lenguaje de programación web  

\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Fecha:\*\* Octubre de 2026  

\*\*Versión del documento:\*\* 1.0



\---



\## 1. Introducción



Esta guía describe los requisitos, los pasos de instalación y el procedimiento de ejecución del proyecto `gestion-tareas`.



Su objetivo es facilitar que otra persona pueda preparar el entorno, compilar la aplicación, iniciar el servidor y comprobar su funcionamiento.



Las instrucciones se basan en la estructura prevista del proyecto. Antes de seguirlas, deben verificarse las rutas, los scripts y las versiones que existen realmente en la carpeta de trabajo.



\## 2. Requisitos previos



\### 2.1. Requisitos de software



| Componente | Requisito |

|---|---|

| Sistema operativo | Windows 10/11, según el entorno previsto |

| Java JDK | Versión compatible con el proyecto |

| Apache Maven | Distribución local o instalación disponible |

| Navegador web | Chrome, Firefox, Edge u otro compatible |

| Conexión a Internet | Habitualmente necesaria la primera vez para descargar dependencias |

| Espacio en disco | Suficiente para las herramientas, dependencias y compilación |



La versión exacta del JDK debe contrastarse con `pom.xml` y con los complementos utilizados. No se debe asumir que cualquier versión de Java es compatible con una configuración antigua de Tomcat.



\### 2.2. Comprobar Java



Abre una ventana de comandos de Windows y ejecuta:



```cmd

java -version

javac -version

```



El primer comando muestra la versión del entorno de ejecución. El segundo permite comprobar si está disponible el compilador del JDK.



Si alguno de los comandos no se reconoce, revisa la instalación de Java y la configuración del `PATH`.



Si necesitas instalar Java, consulta las distribuciones disponibles en:



https://adoptium.net/



Selecciona una versión compatible con el proyecto y con las dependencias configuradas.



\## 3. Comprobar la estructura del proyecto



La carpeta principal debería contener, como mínimo, los archivos necesarios para compilar y ejecutar la aplicación.



```text

gestion-tareas/

├── pom.xml

├── instalar\_maven\_local.bat

├── lanzar\_proyecto.bat

├── actividad\_1\_ejemplos/

│   ├── ejemplo\_python.py

│   ├── ejemplo\_php.php

│   ├── ejemplo\_asp.asp

│   └── SOLUCION\_ACTIVIDAD\_1.md

├── doc/

│   ├── 01\_memoria\_tecnica.md

│   ├── 02\_bitacora\_errores.md

│   ├── 03\_aprendizajes.md

│   └── 04\_guia\_despliegue.md

└── src/

&#x20;   └── main/

&#x20;       ├── java/

&#x20;       └── webapp/

&#x20;           ├── WEB-INF/

&#x20;           │   └── web.xml

&#x20;           ├── css/

&#x20;           │   └── estilos.css

&#x20;           ├── js/

&#x20;           │   └── script.js

&#x20;           └── index.jsp

```



La estructura es orientativa. Los directorios `tools/`, `target/` y otros recursos pueden crearse durante la preparación o la compilación.



Antes de continuar, confirma que `pom.xml`, los archivos Java y los recursos web corresponden a la misma versión del proyecto.



\## 4. Preparar Maven local



\### 4.1. Ejecutar el instalador



Si el proyecto incluye `instalar\_maven\_local.bat` y su contenido se ha revisado, sigue estos pasos:



1\. Abre la carpeta raíz `gestion-tareas`.

2\. Ejecuta el script.

3\. Espera a que termine la descarga y extracción.

4\. Comprueba que existe el ejecutable local de Maven.



Ruta prevista:



```text

tools/apache-maven-3.9.9/bin/mvn.cmd

```



No es necesario ejecutar el instalador como administrador si solo descarga y extrae archivos dentro de una carpeta en la que tienes permisos de escritura.



\### 4.2. Verificar Maven



Desde la raíz del proyecto, ejecuta:



```bat

tools\\apache-maven-3.9.9\\bin\\mvn.cmd -version

```



Comprueba que Maven muestra su versión y reconoce el entorno Java.



Si aparece un error, revisa la existencia del archivo, los permisos, la conexión a Internet cuando corresponda y la configuración de Java.



\## 5. Revisar la configuración de Maven



Antes de iniciar la aplicación, comprueba `pom.xml`.



Los principales elementos que debes revisar son:



\- Identificador del proyecto.

\- Versión de Java.

\- Dependencias.

\- Complementos de compilación.

\- Configuración del servidor, si se utiliza un complemento de Tomcat.

\- Puerto de ejecución.

\- Contexto de la aplicación.

\- Tipo de empaquetado.



Si el proyecto utiliza el complemento `tomcat7-maven-plugin`, verifica su compatibilidad con las versiones de Java y de las dependencias utilizadas.



No cambies las versiones de forma aislada: una actualización puede requerir ajustes adicionales en la configuración o en el código.



\## 6. Compilar el proyecto



Desde la carpeta raíz, ejecuta:



```bat

tools\\apache-maven-3.9.9\\bin\\mvn.cmd clean package

```



Este comando limpia los resultados anteriores, compila el código y genera el artefacto configurado en Maven si el proceso finaliza correctamente.



\### Resultado esperado



La consola debería mostrar:



```text

BUILD SUCCESS

```



Si aparece `BUILD FAILURE`, revisa el primer error relevante y las líneas anteriores. No basta con observar el resumen final.



Para separar la compilación de la generación del paquete, también puedes utilizar:



```bat

tools\\apache-maven-3.9.9\\bin\\mvn.cmd clean compile

```



\## 7. Iniciar el servidor



Si `lanzar\_proyecto.bat` está configurado correctamente para compilar e iniciar Tomcat, puedes utilizarlo para arrancar la aplicación.



Pasos:



1\. Abre la carpeta del proyecto.

2\. Ejecuta `lanzar\_proyecto.bat`.

3\. Espera a que termine la compilación, si está incluida.

4\. Comprueba los mensajes de inicio del servidor.

5\. No cierres la consola mientras quieras mantener la aplicación en ejecución.



Si se utiliza el complemento de Tomcat para Maven, la forma exacta de inicio dependerá de la configuración del proyecto.



\### URL de acceso



Si el servidor utiliza el puerto 8080 y el contexto `/gestion-tareas`, la dirección prevista es:



http://localhost:8080/gestion-tareas/



Si has configurado otro puerto o contexto, utiliza los valores efectivos del proyecto.



\## 8. Verificar el funcionamiento



La comprobación debe incluir el servidor, la vista y los recursos del navegador.



\### 8.1. Verificar JSP



Si la página incluye la expresión:



```jsp

<%= new java.util.Date() %>

```



debería mostrar una fecha generada en el servidor.



La fecha exacta cambiará según el momento de ejecución y la configuración horaria del entorno.



Esta comprobación permite verificar que la expresión JSP se procesa, siempre que el resultado no haya sido generado por otro mecanismo.



\### 8.2. Verificar JavaScript



1\. Abre la aplicación en el navegador.

2\. Pulsa `F12`.

3\. Selecciona la pestaña \*\*Console\*\*.

4\. Comprueba si aparece el mensaje definido en `script.js`.

5\. Prueba las interacciones implementadas.



Ejemplo de mensaje, si existe en el archivo:



```javascript

console.log(

&#x20;   "JavaScript ejecutándose en el navegador"

);

```



Si aparecen errores, revisa su ubicación y el archivo al que hacen referencia.



\### 8.3. Verificar CSS



Comprueba que:



\- Se aplican los colores y la tipografía previstos.

\- Las tarjetas y los bloques de código mantienen su presentación.

\- La página se adapta a diferentes tamaños de pantalla, si se ha implementado el diseño responsive.

\- Los recursos CSS se cargan sin errores.



En la pestaña \*\*Network\*\* de las herramientas de desarrollo, comprueba que `estilos.css` se solicita correctamente.



\### 8.4. Verificar la estructura de los recursos



Las rutas de CSS y JavaScript deben coincidir con la ubicación real de los archivos.



Si se utiliza JSP, es recomendable generar las rutas considerando el contexto de la aplicación:



```jsp

<link rel="stylesheet"

&#x20;     href="${pageContext.request.contextPath}/css/estilos.css">



<script

&#x20;   src="${pageContext.request.contextPath}/js/script.js"

&#x20;   defer></script>

```



\## 9. Detener el servidor



Para detener la aplicación:



1\. Vuelve a la consola en la que se está ejecutando el servidor.

2\. Utiliza `Ctrl + C`.

3\. Sigue las indicaciones que aparezcan en la consola.



Si el puerto continúa ocupado después de detener el servidor, comprueba qué proceso sigue utilizándolo antes de finalizarlo.



\## 10. Resolución de problemas frecuentes



\### 10.1. Maven no se reconoce



\*\*Causa probable:\*\* ruta incorrecta o distribución no disponible.



\*\*Acciones:\*\*



1\. Comprueba que existe `tools\\apache-maven-3.9.9\\bin\\mvn.cmd`.

2\. Ejecuta Maven mediante su ruta completa.

3\. Verifica que Java está disponible.



\### 10.2. Error HTTP 404



\*\*Causa probable:\*\* contexto incorrecto, aplicación no desplegada o recurso no encontrado.



\*\*Acciones:\*\*



1\. Comprueba la URL.

2\. Revisa los mensajes de despliegue.

3\. Verifica la ubicación de `index.jsp`.

4\. Revisa el contexto configurado.

5\. Comprueba que la aplicación se ha iniciado correctamente.



\### 10.3. Error `cannot find symbol`



\*\*Causa probable:\*\* clase inexistente, import incorrecto, dependencia ausente o paquete incoherente.



\*\*Acciones:\*\*



1\. Lee el nombre de la clase que no se encuentra.

2\. Comprueba su ubicación y declaración `package`.

3\. Revisa los imports y las dependencias.

4\. Ejecuta una compilación limpia.



```bat

tools\\apache-maven-3.9.9\\bin\\mvn.cmd clean compile

```



\### 10.4. La ventana se cierra



\*\*Causa probable:\*\* el script termina antes de mostrar el resultado o se produce un error.



\*\*Acciones:\*\*



1\. Abre CMD manualmente.

2\. Accede a la carpeta del proyecto.

3\. Ejecuta el script desde esa consola.

4\. Lee el mensaje completo y registra el error.



\### 10.5. Puerto 8080 ocupado



\*\*Causa probable:\*\* otro proceso está utilizando el puerto.



\*\*Acciones:\*\*



1\. Comprueba los mensajes de error del servidor.

2\. Identifica el proceso que utiliza el puerto.

3\. Detén el proceso solo si es seguro hacerlo o configura otro puerto.

4\. Actualiza la URL de acceso.



\### 10.6. CSS o JavaScript no funcionan



\*\*Causa probable:\*\* rutas incorrectas, recursos no desplegados o errores de ejecución.



\*\*Acciones:\*\*



1\. Comprueba la ubicación de los archivos.

2\. Revisa la pestaña Network.

3\. Revisa la consola JavaScript.

4\. Actualiza la página sin utilizar la caché mediante `Ctrl + F5`.



\## 11. Trasladar el proyecto a otro ordenador



Para preparar el proyecto en otro equipo:



1\. Copia la carpeta del proyecto y sus archivos necesarios.

2\. Comprueba que el equipo dispone de una versión compatible del JDK.

3\. Ejecuta el instalador local de Maven, si está incluido.

4\. Ejecuta la compilación.

5\. Inicia el servidor.

6\. Comprueba la URL y los recursos.



Las carpetas `target/` y `tools/` pueden regenerarse si existen los scripts y las condiciones necesarias. No obstante, antes de excluirlas de una entrega, comprueba si el procedimiento de instalación depende de ellas.



Las dependencias de Maven pueden necesitar descargarse de nuevo. El acceso a Internet y la disponibilidad de los repositorios correspondientes pueden afectar a la primera ejecución.



\## 12. Generar el archivo WAR



Si el proyecto está configurado para empaquetarse como aplicación web, ejecuta:



```bat

tools\\apache-maven-3.9.9\\bin\\mvn.cmd clean package

```



Si el tipo de empaquetado es `war`, el archivo resultante suele generarse en:



```text

target/gestion-tareas.war

```



El nombre definitivo depende de los valores de `artifactId`, `version` y `finalName` configurados en Maven.



Antes de desplegarlo en otro servidor Tomcat, comprueba que las versiones de Java, Servlet API y Tomcat son compatibles con la aplicación.



\## 13. Documentación relacionada



Para ampliar la información sobre el proyecto, consulta:



\- `doc/01\_memoria\_tecnica.md`: arquitectura, tecnologías y estructura.

\- `doc/02\_bitacora\_errores.md`: incidencias y procedimientos de diagnóstico.

\- `doc/03\_aprendizajes.md`: aprendizajes y reflexión técnica.



\## 14. Lista final de comprobación



Antes de entregar el proyecto, verifica los siguientes puntos:



\- \[ ] La estructura de directorios coincide con la documentación.

\- \[ ] Java está disponible y su versión es compatible.

\- \[ ] Maven puede ejecutarse.

\- \[ ] `pom.xml` contiene la configuración correcta.

\- \[ ] La compilación termina correctamente.

\- \[ ] El servidor inicia sin errores.

\- \[ ] La URL de la aplicación es accesible.

\- \[ ] JSP genera el contenido dinámico esperado.

\- \[ ] CSS y JavaScript se cargan correctamente.

\- \[ ] Las incidencias se han documentado con resultados verificables.

\- \[ ] Los cuatro documentos Markdown están en la carpeta `doc/`.

\- \[ ] La documentación no atribuye al proyecto funcionalidades que no estén implementadas.



\---



\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Documento:\*\* Guía de despliegue – UF2405, UD3  



