\# Diario de Aprendizajes y Reflexión Técnica



\*\*Proyecto:\*\* `gestion-tareas`  

\*\*Unidad Formativa:\*\* UF2405 – Modelo de programación web y bases de datos  

\*\*Unidad Didáctica:\*\* UD3 – Identificación de códigos de cada lenguaje de programación web  

\*\*Autora:\*\* Sara López-Figueredo Sainz  

\*\*Fecha:\*\* Octubre de 2026  

\*\*Versión del documento:\*\* 1.0



\---



\## 1. Introducción



Este documento recoge los conocimientos técnicos y las reflexiones derivados del desarrollo de la actividad de identificación de lenguajes de programación web.



Además de reconocer fragmentos de código, el trabajo permite comprender cómo se relacionan las tecnologías que intervienen en una aplicación, qué función desempeña cada una y por qué resulta importante mantener una estructura organizada.



El aprendizaje se aborda desde una perspectiva práctica: identificar, comparar, implementar, comprobar y documentar.



\## 2. Identificación de los lenguajes web



\### 2.1. Aprendizaje principal



He aprendido a identificar diferentes tecnologías a partir de sus características sintácticas y de su finalidad.



| Tecnología | Características distintivas | Función principal |

|---|---|---|

| HTML | Etiquetas como `<html>`, `<head>` y `<body>` | Estructurar contenidos |

| CSS | Selectores, propiedades y valores | Definir la presentación visual |

| JavaScript | Funciones, variables y expresiones | Programar interacciones |

| JSP | Expresiones `<%= ... %>` y bloques `<% ... %>` | Generar páginas dinámicas con Java |

| Python | `def`, indentación y estructuras de control | Implementar lógica de programación |

| PHP | `<?php ... ?>`, variables con `$` | Programar aplicaciones de servidor |

| ASP clásico/VBScript | `Request.Form`, `If ... Then` y bloques ASP | Procesar peticiones en el servidor |



\### 2.2. Reflexión



Cada tecnología tiene unas convenciones que ayudan a reconocerla. Sin embargo, identificar correctamente un fragmento no consiste únicamente en buscar una palabra clave: también es necesario comprender el contexto en el que se ejecuta y la función que desempeña.



Este conocimiento resulta útil para leer código existente, mantener aplicaciones y colaborar en proyectos que combinan tecnologías diferentes.



\## 3. Diferencias entre cliente y servidor



\### 3.1. Aprendizaje principal



He comprendido que una aplicación web puede distribuir sus tareas entre el navegador y el servidor.



\*\*En el servidor\*\* se ejecutan las tecnologías que procesan las peticiones, aplican la lógica correspondiente y generan las respuestas. En este proyecto, JSP y Servlets forman parte de esa capa.



\*\*En el cliente\*\* el navegador interpreta el HTML, aplica los estilos CSS y ejecuta el JavaScript que se envía para proporcionar interactividad.



El flujo básico es el siguiente:



```text

Petición del usuario

&#x20;       |

&#x20;       v

Servidor web

&#x20;       |

&#x20;       v

Procesamiento mediante Java/JSP

&#x20;       |

&#x20;       v

Respuesta HTML

&#x20;       |

&#x20;       v

Navegador: HTML + CSS + JavaScript

```



\### 3.2. Ejemplo práctico



Una expresión JSP:



```jsp

<%= new java.util.Date() %>

```



se procesa en el servidor y produce un resultado que se incorpora al HTML enviado al navegador.



En cambio, una instrucción JavaScript como:



```javascript

console.log("Aplicación iniciada");

```



se ejecuta en el navegador cuando se interpreta el archivo correspondiente.



\### 3.3. Reflexión



Comprender esta diferencia permite determinar dónde debe implementarse cada funcionalidad y qué información debe permanecer en el servidor.



También he aprendido que Python y JavaScript no están limitados a un único entorno: pueden utilizarse en distintos contextos según las herramientas y la arquitectura de la aplicación.



\## 4. Separación de responsabilidades



\### 4.1. Aprendizaje principal



La organización del código en archivos diferenciados facilita su lectura, mantenimiento y evolución.



Una estructura habitual es:



```text

webapp/

├── index.jsp

├── css/

│   └── estilos.css

└── js/

&#x20;   └── script.js

```



Cada archivo tiene una finalidad concreta:



\- `index.jsp`: estructura de la vista y contenido dinámico.

\- `estilos.css`: presentación visual.

\- `script.js`: interacciones ejecutadas en el navegador.



\### 4.2. Ventajas



1\. \*\*Mantenibilidad:\*\* los cambios se realizan en el archivo correspondiente.

2\. \*\*Reutilización:\*\* los estilos y scripts pueden compartirse entre páginas.

3\. \*\*Legibilidad:\*\* la estructura del proyecto resulta más comprensible.

4\. \*\*Trabajo colaborativo:\*\* facilita que varias personas trabajen sobre componentes diferentes.

5\. \*\*Caché del navegador:\*\* los recursos externos pueden almacenarse en caché y reutilizarse, según la configuración.



\### 4.3. Reflexión



He comprendido que separar responsabilidades no es únicamente una cuestión estética. Es una decisión de organización que mejora la calidad del código y facilita la detección de errores.



\## 5. Gestión del proyecto mediante Maven



\### 5.1. Aprendizaje principal



Apache Maven permite gestionar dependencias, compilar el código y automatizar distintas fases del ciclo de desarrollo.



Entre los comandos habituales se encuentran:



```bat



