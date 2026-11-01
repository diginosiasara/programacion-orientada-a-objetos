# Guía de despliegue y ejecución

**Proyecto:** `proyecto-login`  
**Sistema operativo de referencia:** Windows 10/11  
**Unidad formativa:** UF2405 — Modelo de programación web y bases de datos

---

## 1. Objetivo

Esta guía describe cómo preparar, compilar y ejecutar `proyecto-login` en Windows mediante los scripts incluidos en el proyecto.

## 2. Requisitos previos

Antes de iniciar el despliegue, comprueba los siguientes requisitos:

- **Sistema operativo:** Windows 10 o Windows 11.
- **Java:** JDK compatible con la configuración del proyecto; versión 8 o superior si así lo permite `pom.xml`.
- **Conexión a Internet:** necesaria para descargar Maven o las dependencias que no estén disponibles localmente.
- **Espacio en disco:** reservar aproximadamente 500 MB para herramientas y dependencias.
- **Puerto de ejecución:** el puerto 8080 debe estar disponible, salvo que el proyecto esté configurado para utilizar otro.

Para comprobar Java, abre una terminal y ejecuta:

```bat
java -version
```

Si el comando no se reconoce, revisa la instalación del JDK y la variable `PATH`.

## 3. Comprobación de la estructura del proyecto

La carpeta raíz `proyecto-login` debe contener `pom.xml` y los scripts de ejecución. La documentación se guarda en `doc/`.

```text
proyecto-login/
├── pom.xml
├── instalar_maven_local.bat
├── lanzar_proyecto.bat
├── doc/
└── src/
```

Comprueba que los archivos tienen las extensiones correctas y que Windows no ha añadido `.txt` al final de los nombres.

## 4. Preparación de Maven

Si el proyecto incluye el script `instalar_maven_local.bat`, sigue estos pasos:

1. Abre la carpeta raíz `proyecto-login`.
2. Ejecuta `instalar_maven_local.bat`.
3. Espera a que finalice la descarga y extracción de Maven en la ubicación configurada, por ejemplo, `tools/`.
4. Comprueba que el ejecutable de Maven existe en la ruta esperada.

Este paso solo será necesario de nuevo si se elimina o se daña la instalación local.

> **Nota:** si el proyecto utiliza Maven Wrapper u otro método de instalación, sigue la configuración real del repositorio.

## 5. Compilación y ejecución de la aplicación

1. Ejecuta `lanzar_proyecto.bat` desde la carpeta raíz del proyecto.
2. Si Windows muestra una advertencia de seguridad, verifica el origen del archivo antes de permitir su ejecución.
3. Espera a que el script compruebe Java, localice Maven, descargue las dependencias necesarias y compile el proyecto.
4. Comprueba que el servidor se inicia sin errores en la consola.

El mensaje exacto de inicio depende de la versión y de la configuración del servidor. Si el proceso termina con un error, consulta `02_bitacora_errores.md`.

## 6. Acceso a la aplicación

Abre un navegador y visita la dirección configurada para el proyecto.

Si el nombre de contexto es `proyecto-login` y el servidor utiliza el puerto 8080, la dirección será:

**http://localhost:8080/proyecto-login/**

Si la dirección no funciona, comprueba:

- El nombre del contexto desplegado.
- El puerto configurado.
- Los mensajes de error de la consola.
- La configuración de las rutas en el proyecto.

## 7. Credenciales de prueba

Utiliza únicamente las credenciales definidas en `UsuarioDAO.java`. En la configuración documentada inicialmente se contemplan estos ejemplos:

| Usuario | Contraseña de prueba | Resultado esperado |
|---|---|---|
| `admin` | `1234` | Acceso correcto, si está configurado en el DAO |
| `usuario` | `pass` | Acceso correcto, si está configurado en el DAO |
| `cualquiera` | `incorrecta` | Acceso denegado, si no existe esa combinación |

> **Importante:** confirma las credenciales en el código antes de realizar las pruebas. No utilices estas credenciales de ejemplo en un entorno real.

## 8. Validación del formulario

Prueba los siguientes casos:

1. Enviar el formulario con los campos vacíos.
2. Introducir una contraseña que no cumpla la longitud mínima definida por el proyecto.
3. Introducir credenciales válidas.
4. Introducir credenciales incorrectas.

Si está implementada la validación del lado del cliente, `js/script.js` mostrará los mensajes correspondientes.

La validación en JavaScript mejora la experiencia de uso, pero no sustituye la validación obligatoria en el servidor.

## 9. Detención del servidor

Para detener la aplicación:

1. Vuelve a la ventana de consola donde se está ejecutando.
2. Pulsa `Ctrl + C`.
3. Si Windows solicita confirmación para terminar el proceso por lotes, responde según el mensaje mostrado.

Si el puerto continúa ocupado, comprueba que no haya quedado otro proceso del servidor en ejecución.

## 10. Resolución de problemas frecuentes

| Problema | Comprobación recomendada |
|---|---|
| Error 404 | Revisar la URL, el contexto de la aplicación y el mapeo del servlet. |
| Error 500 | Revisar la consola, las páginas JSP y los métodos del modelo. |
| Maven no encontrado | Comprobar la instalación local o la configuración del `PATH`. |
| Error de compilación | Revisar el código fuente, las extensiones de archivo y las dependencias. |
| Puerto 8080 ocupado | Detener el proceso que lo utiliza o configurar otro puerto. |

## 11. Documentación relacionada

Para ampliar la información del proyecto, consulta:

- `01_memoria_tecnica.md`: arquitectura, componentes y tecnologías.
- `02_bitacora_errores.md`: registro de incidencias y soluciones.
- `03_aprendizajes.md`: aprendizajes técnicos y conclusiones.

---

**Fin de la guía de despliegue.**