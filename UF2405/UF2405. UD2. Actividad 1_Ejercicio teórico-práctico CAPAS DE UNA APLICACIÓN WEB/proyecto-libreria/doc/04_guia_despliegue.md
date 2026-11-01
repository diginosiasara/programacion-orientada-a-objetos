# Guía rápida de despliegue — Librería Virtual

## 1. Requisitos previos

- **Java JDK:** versión 8 o superior, según la configuración documentada del proyecto.
- **Sistema operativo:** Windows 10 u 11.
- **Conexión a Internet:** necesaria durante la primera ejecución si Maven debe descargar las dependencias que no estén disponibles localmente.
- **Maven:** versión 3.9.6, ubicada en la carpeta local `tools/`.

## 2. Procedimiento de ejecución

### Paso 1. Comprobar Maven

Verifica que existe el siguiente archivo en la raíz del proyecto:

```text
tools/apache-maven-3.9.6/bin/mvn.cmd
```

Si no existe, ejecuta `instalar_tools.bat`.

### Paso 2. Iniciar la aplicación

Haz doble clic en:

```text
lanzar_libreria.bat
```

Antes de ejecutarlo, comprueba que el puerto 8080 no esté siendo utilizado por otra instancia de Tomcat.

### Paso 3. Acceder desde el navegador

Una vez iniciado el servidor, utiliza las siguientes direcciones:

| Recurso | URL |
|---|---|
| Página de inicio | `http://localhost:8080/libreria/` |
| Catálogo de libros | `http://localhost:8080/libreria/catalogo` |

### Paso 4. Detener el servidor

Vuelve a la ventana de la consola y pulsa `Ctrl + C`.

## 3. Ejecución manual desde CMD

También es posible compilar y ejecutar la aplicación desde la terminal de Windows.

```cmd
:: 1. Acceder a la carpeta del proyecto
cd /d "ruta\a\proyecto-libreria"

:: 2. Añadir Maven local al PATH de esta sesión
set "PATH=%PATH%;%cd%\tools\apache-maven-3.9.6\bin"

:: 3. Compilar y ejecutar
call mvn clean compile tomcat7:run
```

Sustituye `ruta\a\proyecto-libreria` por la ubicación real de la carpeta del proyecto.

## 4. Solución de problemas

| Problema | Solución |
|---|---|
| Maven no encontrado | Ejecuta `instalar_tools.bat` o comprueba la carpeta `tools/`. |
| Error HTTP 404 en `/libreria/` | Comprueba que existe `src/main/webapp/index.html`. Prueba también la ruta `/libreria/catalogo`. |
| Puerto 8080 ocupado | Cierra las demás consolas de Tomcat que estén ejecutándose. |
| La consola se cierra inmediatamente | Ejecuta el script desde CMD para leer el error. |
| Fallo al descargar dependencias | Comprueba la conexión a Internet y vuelve a ejecutar Maven. |

## 5. Limpieza del proyecto

Para eliminar el proyecto, borra la carpeta `proyecto-libreria`.

La configuración descrita utiliza Maven local y no requiere modificar permanentemente las variables de entorno del sistema ni el Registro de Windows.