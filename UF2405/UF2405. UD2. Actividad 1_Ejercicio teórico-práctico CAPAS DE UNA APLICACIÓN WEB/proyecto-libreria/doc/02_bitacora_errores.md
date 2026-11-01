# Bitácora de errores y soluciones

## 1. Falta de la carpeta `tools`

**Síntoma:** El script `lanzar_libreria.bat` mostraba el mensaje `[ERROR] Maven no encontrado en la carpeta 'tools'`.

**Causa:** La carpeta `tools`, que contiene Maven, no se había copiado al nuevo proyecto porque se excluye de las entregas para reducir su tamaño.

**Solución:** Se creó el script `instalar_tools.bat`, que busca la carpeta `apache-maven-3.9.6` en el disco duro y la copia al proyecto. Como alternativa, se puede copiar manualmente desde otro proyecto.

## 2. Error HTTP 404 al acceder a `/libreria/`

**Síntoma:** Al acceder a `http://localhost:8080/libreria/`, Tomcat mostraba el mensaje «The requested resource is not available».

**Causa:** No existía el archivo `index.html` en la carpeta `src/main/webapp/`.

**Solución:** Se creó `src/main/webapp/index.html` con un enlace al servlet del catálogo:

```html
<a href="catalogo">Ver catálogo de libros</a>
```

## 3. Conflicto de puertos: puerto 8080 ocupado

**Síntoma:** El servidor no arrancaba y mostraba errores `BindException`.

**Causa:** El proyecto anterior, `proyecto-web-multicapa`, seguía ejecutándose y utilizaba el puerto 8080.

**Solución:** Cerrar la consola del proyecto anterior pulsando `Ctrl + C` antes de iniciar la aplicación Librería.

## 4. El archivo `.bat` se cierra inmediatamente

**Síntoma:** Al ejecutar `lanzar_libreria.bat`, la ventana se cerraba sin permitir leer el mensaje de error.

**Causa:** Podía existir un error de sintaxis en el script o faltar comillas en rutas con espacios.

**Solución:** Se modificó el script para mantener abierta la consola mediante `cmd /k`, permitiendo consultar los mensajes generados durante la ejecución.

## 5. Advertencias de Java 25 con Tomcat 7

**Síntoma:** La consola mostraba advertencias relacionadas con `sun.misc.Unsafe` y métodos nativos restringidos.

**Causa:** Se estaba utilizando una versión reciente de Java junto con una versión antigua de Tomcat.

**Solución aplicada:** Durante las pruebas descritas, las advertencias se consideraron informativas porque no impedían la compilación ni la ejecución. No obstante, conviene comprobar la compatibilidad de las versiones antes de utilizar el entorno en producción.

## 6. Conclusión

La resolución de estos problemas permitió mejorar la configuración del entorno, la gestión de dependencias, el diagnóstico de errores y la ejecución de la aplicación en Windows.