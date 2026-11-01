\# Memoria Técnica del Proyecto: Identificación de Lenguajes de Programación Web



\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Unidad Formativa:\*\* UF2405 – Modelo de programación web y bases de datos  

\*\*Unidad Didáctica:\*\* UD3 – Identificación de códigos de cada lenguaje de programación web  

\*\*Actividad:\*\* Actividad 1 – Ejercicio teórico-práctico  

\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Fecha:\*\* Octubre de 2026  

\*\*Versión del documento:\*\* 1.0



\---



\## 1. Introducción



El presente documento describe la arquitectura, las tecnologías, la estructura y las decisiones técnicas del proyecto `gestion-tareas`, desarrollado en el contexto de la UF2405, UD3.



El objetivo principal es demostrar la capacidad de identificar y diferenciar distintos lenguajes empleados en el desarrollo web mediante el análisis de su sintaxis, sus características y su función dentro de una aplicación.



Como complemento a la actividad teórica, el proyecto contempla una aplicación web basada en Java, JSP y Servlets, ejecutada en un entorno de servidor Tomcat y gestionada mediante Apache Maven.



La documentación se organiza en cuatro archivos complementarios: memoria técnica, bitácora de errores, diario de aprendizajes y guía de despliegue.



\## 2. Objetivos



\### 2.1. Objetivo general



Identificar y comprender las características de los principales lenguajes utilizados en el desarrollo web, relacionando cada tecnología con su función y entorno de ejecución.



\### 2.2. Objetivos específicos



\- Identificar fragmentos de código escritos en JSP, Python, PHP, JavaScript, HTML y ASP clásico con VBScript.

\- Diferenciar lenguajes de marcado, hojas de estilo y lenguajes de programación.

\- Comprender las diferencias entre ejecución en el cliente y ejecución en el servidor.

\- Desarrollar una aplicación web utilizando Java, JSP y Servlets.

\- Separar la presentación, los estilos y la interactividad mediante archivos independientes.

\- Gestionar la compilación y las dependencias mediante Maven.

\- Documentar la estructura del proyecto, las incidencias técnicas y el procedimiento de ejecución.

\- Utilizar un entorno portable que minimice los cambios en la configuración del sistema operativo.



\## 3. Alcance del proyecto



El proyecto comprende dos ámbitos relacionados:



1\. \*\*Ámbito didáctico:\*\* identificación y justificación de seis fragmentos de código correspondientes a diferentes tecnologías web.

2\. \*\*Ámbito práctico:\*\* desarrollo y ejecución de una aplicación web que presenta ejemplos explicativos de los lenguajes estudiados.



La aplicación utiliza Java, JSP y Servlets como tecnologías principales de servidor, junto con HTML, CSS y JavaScript para la presentación y la interacción con el usuario.



La identificación de Python, PHP y ASP/VBScript se realiza mediante ejemplos independientes. Su inclusión en la actividad no implica que estos lenguajes se ejecuten dentro de la aplicación Java.



La persistencia de datos mediante H2, la autenticación de usuarios y la integración con otras bases de datos quedan fuera del alcance funcional descrito, salvo que exista una implementación adicional verificable en el código.



\## 4. Arquitectura del sistema



\### 4.1. Tecnologías utilizadas



| Componente | Tecnología | Función |

|---|---|---|

| Lenguaje principal de servidor | Java | Lógica de la aplicación |

| Plantillas dinámicas | JSP | Generación de contenido HTML |

| Controlador web | Java Servlet | Recepción y gestión de peticiones HTTP |

| Servidor de aplicaciones | Apache Tomcat | Ejecución de la aplicación web |

| Gestión de dependencias | Apache Maven | Compilación y resolución de librerías |

| Estructura de contenidos | HTML5 | Organización semántica de la página |

| Presentación visual | CSS3 | Estilos, diseño y adaptación a pantallas |

| Interactividad | JavaScript | Comportamiento en el navegador |

| Entorno de referencia | Windows 10/11 | Sistema operativo de desarrollo |



\*\*Compatibilidad:\*\* las versiones efectivamente utilizadas deben confirmarse en `pom.xml`, en los scripts de ejecución y en el entorno Java instalado. La configuración original contempla Maven 3.9.9 y un complemento de Tomcat 7; conviene comprobar su compatibilidad con el JDK y las dependencias seleccionadas.



\### 4.2. Esquema de funcionamiento



```text

USUARIO

&#x20;  |

&#x20;  v

NAVEGADOR WEB

&#x20;  |

&#x20;  | Solicitud HTTP

&#x20;  v

SERVIDOR TOMCAT

&#x20;  |

&#x20;  v

SERVLET / JSP

&#x20;  |

&#x20;  | Generación de respuesta

&#x20;  v

HTML ENVIADO AL NAVEGADOR

&#x20;  |

&#x20;  +---- CSS: presentación visual

&#x20;  |

&#x20;  +---- JavaScript: interactividad

```



El navegador recibe el contenido generado por el servidor. El código JSP y Java que se ejecuta en el servidor no se envía como código fuente al usuario; se envía la respuesta resultante.



\### 4.3. Estrategia de despliegue portable



El proyecto contempla la posibilidad de utilizar una distribución local de Maven dentro de la carpeta `tools/`, sin necesidad de instalar Maven globalmente.



Esta estrategia reduce las modificaciones en el sistema anfitrión, aunque no supone un aislamiento absoluto: Java debe estar disponible y Maven puede necesitar conexión a Internet para descargar dependencias. Además, el repositorio local de Maven suele ubicarse en el perfil del usuario.



\## 5. Estructura del proyecto



La siguiente estructura representa la organización prevista de los archivos principales:



```text

gestion-tareas/

├── pom.xml

├── instalar\_maven\_local.bat

├── lanzar\_proyecto.bat

├── tools/

│   └── apache-maven-3.9.9/

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

&#x20;       │   └── com/

&#x20;       │       └── empresa/

&#x20;       │           └── web/

&#x20;       │               └── IdentificacionServlet.java

&#x20;       └── webapp/

&#x20;           ├── WEB-INF/

&#x20;           │   └── web.xml

&#x20;           ├── css/

&#x20;           │   └── estilos.css

&#x20;           ├── js/

&#x20;           │   └── script.js

&#x20;           └── index.jsp

```



\*\*Nota:\*\* la estructura debe ajustarse a los archivos reales del proyecto. Si existen clases de gestión de tareas, DAO o modelos de datos, deberán documentarse en esta memoria y reflejarse en el árbol definitivo.



\## 6. Descripción de los componentes



\### 6.1. Vista: `index.jsp`



Es la página principal de la aplicación.



Sus responsabilidades son:



\- Presentar la información mediante HTML.

\- Incorporar expresiones JSP cuando se requiera contenido dinámico.

\- Referenciar los archivos CSS y JavaScript.

\- Mostrar los ejemplos de código y sus explicaciones.



Ejemplo de expresión JSP:



```jsp

<%= new java.util.Date() %>

```



La expresión se evalúa en el servidor y su resultado se incorpora a la respuesta HTML.



\### 6.2. Hoja de estilos: `estilos.css`



Centraliza la presentación visual de la aplicación.



Puede incluir:



\- Colores, tipografías y espaciado.

\- Diseño de tarjetas y bloques de código.

\- Adaptación a distintos tamaños de pantalla mediante media queries.

\- Estados visuales y mejoras de legibilidad.



\### 6.3. JavaScript: `script.js`



Gestiona las interacciones que se ejecutan en el navegador, por ejemplo:



\- Mostrar mensajes informativos.

\- Validar determinados campos antes de enviar un formulario.

\- Facilitar la copia de fragmentos de código.

\- Añadir efectos de interacción accesibles.



La validación del navegador mejora la experiencia de uso, pero no sustituye a las comprobaciones de seguridad que deban realizarse en el servidor.



\### 6.4. Controlador: `IdentificacionServlet.java`



El Servlet recibe peticiones HTTP y puede gestionar el acceso a la vista principal.



Si únicamente redirige o reenvía la petición a `index.jsp`, su función de controlador es limitada. La lógica de negocio adicional deberá documentarse si está implementada.



El paquete Java declarado en el archivo debe coincidir con la estructura de directorios y con las referencias utilizadas por el proyecto.



\### 6.5. Configuración de Maven: `pom.xml`



Define los datos del proyecto, las dependencias y los complementos de compilación y ejecución.



Entre los aspectos que deben revisarse se encuentran:



\- `groupId` y `artifactId`.

\- Versión de Java de compilación.

\- Dependencias de Servlet API.

\- Complemento de Tomcat, si se utiliza.

\- Puerto y contexto de despliegue.

\- Tipo de empaquetado, por ejemplo `war`.



\### 6.6. Descriptor: `web.xml`



Se encuentra en `src/main/webapp/WEB-INF/` y puede definir la configuración de la aplicación web.



Si se utiliza una página de bienvenida, puede declararse así:



```xml

<welcome-file-list>

&#x20;   <welcome-file>index.jsp</welcome-file>

</welcome-file-list>

```



La ubicación de `index.jsp` debe permitir el acceso previsto. Si se utiliza como página principal pública, normalmente se sitúa directamente en `src/main/webapp/`, no dentro de `WEB-INF/`.



\## 7. Identificación de lenguajes web



\### 7.1. Fragmento 1: JSP



\*\*Ejemplo:\*\*



```jsp

<%= new java.util.Date() %>

```



\- \*\*Tecnología:\*\* JavaServer Pages (JSP).

\- \*\*Entorno:\*\* servidor.

\- \*\*Identificación:\*\* utiliza la sintaxis de expresiones JSP `<%= ... %>` e incorpora una expresión Java.

\- \*\*Función:\*\* generar contenido dinámico en la respuesta web.



JSP es una tecnología de páginas dinámicas basada en Java, no un lenguaje independiente de Java.



\### 7.2. Fragmento 2: Python



\*\*Ejemplo:\*\*



```python

def dibujar\_muneco(opcion):

&#x20;   print(opcion)

```



\- \*\*Lenguaje:\*\* Python.

\- \*\*Entorno:\*\* depende del programa y de su configuración.

\- \*\*Identificación:\*\* palabra reservada `def`, dos puntos y bloques definidos mediante indentación.

\- \*\*Función:\*\* implementar lógica de programación.



Python puede utilizarse en el servidor mediante frameworks web, pero también en aplicaciones locales, scripts y otros entornos.



\### 7.3. Fragmento 3: PHP



\*\*Ejemplo:\*\*



```php

<?php

$mensaje = "Hola";

echo $mensaje;

?>

```



\- \*\*Lenguaje:\*\* PHP.

\- \*\*Entorno habitual en aplicaciones web:\*\* servidor.

\- \*\*Identificación:\*\* delimitadores `<?php ... ?>`, variables precedidas por `$` e instrucción `echo`.

\- \*\*Función:\*\* procesar lógica de servidor y generar contenido dinámico.



\### 7.4. Fragmento 4: JavaScript



\*\*Ejemplo:\*\*



```html

<script>

&#x20;   console.log("JavaScript ejecutándose");

</script>

```



\- \*\*Lenguaje:\*\* JavaScript.

\- \*\*Entorno habitual del ejemplo:\*\* navegador.

\- \*\*Identificación:\*\* código incluido en una etiqueta `<script>`.

\- \*\*Función:\*\* proporcionar interactividad y manipular el contenido de la página.



JavaScript también puede ejecutarse en el servidor, por ejemplo mediante Node.js. Por tanto, su clasificación depende del entorno concreto.



\### 7.5. Fragmento 5: HTML



\*\*Ejemplo:\*\*



```html

<html>

<head>

&#x20;   <title>Mi página</title>

</head>

<body>

&#x20;   <h1>Hola</h1>

</body>

</html>

```



\- \*\*Tecnología:\*\* HTML.

\- \*\*Función:\*\* estructurar y organizar el contenido de una página web.

\- \*\*Identificación:\*\* etiquetas como `<html>`, `<head>`, `<body>` y `<h1>`.



HTML es un lenguaje de marcado, no un lenguaje de programación.



\### 7.6. Fragmento 6: ASP clásico con VBScript



\*\*Ejemplo:\*\*



```asp

<%

If Request.Form("tab") = "" Then

&#x20;   Response.Write("Sin selección")

End If

%>

```



\- \*\*Tecnología:\*\* ASP clásico con VBScript.

\- \*\*Entorno:\*\* servidor, habitualmente Microsoft IIS.

\- \*\*Identificación:\*\* delimitadores `<% ... %>`, estructura `If ... Then` y objeto `Request.Form`.

\- \*\*Función:\*\* procesar solicitudes y generar respuestas dinámicas.



ASP clásico es una tecnología de páginas de servidor; VBScript es el lenguaje de scripting utilizado en este ejemplo.



\## 8. Buenas prácticas aplicadas



El proyecto contempla los siguientes criterios:



\- Separación de HTML/JSP, CSS y JavaScript.

\- Organización coherente de los directorios.

\- Uso de Maven para gestionar dependencias y compilación.

\- Documentación de las incidencias y sus soluciones.

\- Uso de rutas coherentes entre los scripts, la configuración y la estructura del proyecto.

\- Comprobación del funcionamiento mediante pruebas de compilación y acceso desde el navegador.

\- Identificación de las limitaciones y dependencias del entorno de ejecución.



La aplicación de estas prácticas debe confirmarse mediante la revisión del código y las pruebas efectivamente realizadas.



\## 9. Conclusiones



El proyecto permite relacionar la sintaxis de diferentes tecnologías con su finalidad dentro del desarrollo web.



Los principales resultados de aprendizaje son:



1\. Reconocer los seis tipos de código estudiados.

2\. Diferenciar los lenguajes de marcado, las hojas de estilo y los lenguajes de programación.

3\. Comprender la diferencia entre ejecución en el cliente y ejecución en el servidor.

4\. Identificar el papel de JSP, Servlets, HTML, CSS y JavaScript en una aplicación Java web.

5\. Entender la utilidad de Maven y de una estructura de proyecto organizada.

6\. Documentar los problemas técnicos y las soluciones con criterios reproducibles.



La calidad final de la entrega dependerá de la correspondencia entre esta memoria, el código fuente, las pruebas realizadas y la configuración efectiva del entorno.



\---



\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Documento:\*\* Memoria técnica – UF2405, UD3  



