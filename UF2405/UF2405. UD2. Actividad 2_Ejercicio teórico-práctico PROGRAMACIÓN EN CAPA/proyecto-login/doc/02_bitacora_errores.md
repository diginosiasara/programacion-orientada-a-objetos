# Bitácora de errores y soluciones

**Proyecto:** `proyecto-login`  
**Unidad formativa:** UF2405 — Modelo de programación web y bases de datos  
**Finalidad:** registrar las incidencias, sus causas y las soluciones aplicadas durante el desarrollo y la ejecución.

---

## 1. Error HTTP 404: recurso no disponible

### 1.1. Descripción

Al acceder a la aplicación o a una página JSP, el servidor devuelve un error HTTP 404.

### 1.2. Causas posibles

- La URL no coincide con el nombre de contexto configurado en el proyecto.
- El nombre final del artefacto definido en `pom.xml` no coincide con la ruta utilizada en el navegador.
- Los archivos JSP están dentro de `WEB-INF/`, directorio al que no se puede acceder directamente desde el navegador.
- La ruta del servlet o la configuración de bienvenida no coincide con la petición.

### 1.3. Solución

- Comprobar el nombre final del artefacto y la URL de acceso.
- Mantener las páginas JSP en una ubicación adecuada dentro de `src/main/webapp/`.
- Revisar el mapeo de `LoginServlet` y la configuración de `welcome-file` en `web.xml`.

### 1.4. Verificación

Volver a acceder a la aplicación y comprobar que el recurso solicitado se carga correctamente.

## 2. Error HTTP 500: compilación de una página JSP

### 2.1. Descripción

Al abrir `bienvenida.jsp`, el servidor genera una excepción `JasperException` porque no encuentra métodos como `getNombreCompleto()` o `getRol()` en la clase `Usuario`.

### 2.2. Causa identificada

La clase `Usuario.java` no contiene los atributos o métodos que la página JSP intenta utilizar, o la clase DAO no proporciona los datos necesarios.

### 2.3. Solución

- Revisar los atributos y métodos de `Usuario.java`.
- Añadir los campos, el constructor y los métodos *getter* que requiera la vista.
- Actualizar `UsuarioDAO.java` para proporcionar los datos correspondientes.
- Verificar que los nombres de propiedades utilizados en JSP coincidan con los métodos JavaBean.

### 2.4. Verificación

Compilar de nuevo el proyecto y acceder a `bienvenida.jsp` con una sesión válida.

## 3. Error de compilación: `class, interface, or enum expected`

### 3.1. Descripción

Maven no consigue compilar `LoginServlet.java` y muestra errores de sintaxis en varias líneas.

### 3.2. Causas posibles

- Se ha pegado texto explicativo fuera del código Java.
- Existen caracteres no válidos o llaves descompensadas.
- El archivo tiene una extensión incorrecta, por ejemplo, `LoginServlet.java.txt`.

### 3.3. Solución

- Comprobar que el archivo se llama exactamente `LoginServlet.java`.
- Activar la visualización de extensiones en el explorador de archivos de Windows.
- Dejar en el archivo únicamente código Java válido.
- Revisar las llaves, las declaraciones `package` e `import` y la estructura de la clase.
- Volver a ejecutar la compilación Maven.

### 3.4. Verificación

Ejecutar la compilación y comprobar que no aparecen errores de sintaxis.

## 4. Error al ejecutar el archivo `.bat` o al localizar Maven

### 4.1. Descripción

El script `lanzar_proyecto.bat` falla, muestra un mensaje como `No se esperaba \Common en este momento` o indica que Maven no está disponible.

### 4.2. Causas posibles

- La ruta del proyecto contiene espacios y el script no entrecomilla correctamente las rutas.
- Maven no está instalado o no se encuentra en la variable `PATH`.
- La ruta de Maven local está mal definida o no se ha descargado correctamente.

### 4.3. Solución

- Entrecomillar las rutas que puedan contener espacios en los archivos `.bat`.
- Comprobar que Java está instalado y disponible desde la terminal.
- Si el proyecto utiliza una instalación local de Maven, verificar que la carpeta y el ejecutable `mvn.cmd` existen.
- Añadir la ruta local a `PATH` únicamente durante la ejecución del script, si esa es la estrategia configurada.
- Mostrar mensajes claros cuando falten dependencias o no se pueda iniciar el servidor.

### 4.4. Verificación

Ejecutar de nuevo el script y comprobar que Maven compila el proyecto y que el servidor se inicia correctamente.

## 5. Plantilla para registrar nuevas incidencias

Para mantener la trazabilidad del desarrollo, documentar cada nueva incidencia con la siguiente estructura:

### Error X: título de la incidencia

- **Fecha:** fecha en la que se produce el error.
- **Descripción:** mensaje exacto y comportamiento observado.
- **Causa:** origen confirmado o hipótesis pendiente de verificar.
- **Solución:** cambios realizados para resolver el problema.
- **Verificación:** prueba que confirma que el problema se ha resuelto.

## 6. Conclusiones

La documentación sistemática de errores permite identificar patrones, evitar la repetición de incidencias y facilitar el mantenimiento del proyecto.

> **Criterio de documentación:** distinguir entre una causa confirmada y una causa probable. No marcar una solución como aplicada si únicamente se ha propuesto.