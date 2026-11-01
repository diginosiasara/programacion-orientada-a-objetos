# Guía de Despliegue - Actividad 3 UF2405

**Proyecto:** actividad3-uf2405  
**Unidad Formativa:** UF2405 UD3  
**Fecha:** Octubre 2026

---

## 1. Requisitos Previos

### 1.1. Software necesario

| Componente | Versión mínima | Estado |
|-----------|---------------|--------|
| **Sistema Operativo** | Windows 10/11 | ✅ Requerido |
| **Java JDK** | 8 o superior | ✅ Requerido |
| **Navegador web** | Chrome, Firefox, Edge | ✅ Requerido |
| **Espacio en disco** | 500 MB libres | ✅ Requerido |

### 1.2. Verificar Java instalado

Abre una ventana de comandos (CMD) y ejecuta:
```cmd
java -version
```

Deberías ver algo como:
```
openjdk version "11.0.2" 2019-01-15
OpenJDK Runtime Environment 18.9 (build 11.0.2+9)
```

Si aparece el error `"java" no se reconoce como un comando`, debes instalar Java JDK desde: https://adoptium.net/

---

## 2. Estructura del Proyecto

Antes de desplegar, verifica que la carpeta del proyecto tenga esta estructura:

```
actividad3-uf2405/
├── pom.xml
├── instalar_maven_local.bat
├── lanzar_proyecto.bat
└── src/
    ── main/
        ├── java/
        │   └── com/
        │       └── empresa/
        │           └── web/
        │               └── Actividad3Servlet.java
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml
            ├── css/
            │   └── estilos.css
            ├── js/
            │   └── script.js
            └── index.jsp
```

---

## 3. Instalación de Maven Local (Paso único)

El proyecto incluye un script que descarga Maven en la carpeta `tools/` sin instalarlo en el sistema operativo.

### Pasos:

1. Abre la carpeta `actividad3-uf2405`.
2. Haz **clic derecho** en `instalar_maven_local.bat`.
3. Selecciona **"Ejecutar como administrador"**.
4. Espera a que finalice el proceso (1-2 minutos dependiendo de tu conexión).
5. Verifica que se ha creado la carpeta `tools/apache-maven-3.9.9/`.

### Resultado esperado:
```
[INFO] Instalando Maven localmente en la carpeta 'tools'...
[OK] Maven instalado correctamente. Ahora ejecuta 'lanzar_proyecto.bat'
```

---

## 4. Compilación y Ejecución del Servidor

### Pasos:

1. Haz **doble clic** en `lanzar_proyecto.bat`.
2. Se abrirá una ventana de comandos negra.
3. La primera vez, Maven descargará las dependencias (Servlet API, Tomcat embebido). Esto puede tardar 3-5 minutos.
4. Espera a ver el mensaje:
   ```
   BUILD SUCCESS
   INFO: Server startup in [xxxx] milliseconds
   ```
5. Abre tu navegador web.
6. Navega a: **http://localhost:8080/actividad3/**

### Resultado esperado:
- Verás la página con fondo amarillo, imagen, encabezados y enlaces.
- Al pulsar el botón azul, aparecerá la alerta: "Mensaje mostrado al pulsar el botón".
- La fecha y hora del servidor se mostrará en la parte inferior.

---

## 5. Verificación del Funcionamiento

### 5.1. Comprobar que HTML funciona

La página debe mostrar:
- Fondo amarillo.
- Imagen centrada (cielo/atardecer).
- Encabezados "Esto es un encabezado" y "Este es un encabezado mediano".
- Enlaces web y de correo electrónico.
- Párrafos de texto.

### 5.2. Comprobar que CSS funciona

La página debe tener:
- Fondo amarillo (`#FFFF00`).
- Tipografía Times New Roman.
- Botón azul con estilo moderno.

### 5.3. Comprobar que JavaScript funciona

1. Pulsa el botón azul "Pulsar para mostrar mensaje".
2. Debe aparecer una alerta con el texto: "Mensaje mostrado al pulsar el botón".
3. Abre la consola del navegador (F12 → pestaña "Console").
4. Deberías ver mensajes de diagnóstico.

### 5.4. Comprobar que JSP funciona

En la parte inferior de la página debe aparecer la fecha y hora del servidor, generada dinámicamente por la expresión JSP `<%= new java.util.Date() %>`.

---

## 6. Detener el Servidor

Para detener el servidor y liberar el puerto 8080:

1. Vuelve a la ventana de comandos donde se está ejecutando el servidor.
2. Presiona **Ctrl + C**.
3. Si pregunta "¿Desea terminar el proceso por lotes (S/N)?", escribe **S** y pulsa Enter.

---

## 7. Solución de Problemas Comunes

### Problema 1: "mvn no se reconoce como un comando"

**Causa:** Maven no está instalado o el PATH no está configurado.

**Solución:**
1. Ejecuta `instalar_maven_local.bat` como administrador.
2. Verifica que existe la carpeta `tools/apache-maven-3.9.9/bin/mvn.cmd`.
3. Vuelve a ejecutar `lanzar_proyecto.bat`.

---

### Problema 2: HTTP Status 404

**Causa:** La aplicación no está desplegada en la ruta accedida.

**Solución:**
1. Verifica que la URL sea exactamente: `http://localhost:8080/actividad3/`
2. Comprueba que `index.jsp` está en `src/main/webapp/` (NO dentro de `WEB-INF/`).
3. Verifica que `web.xml` tiene `<welcome-file>Actividad3Servlet</welcome-file>`.
4. Reinicia el servidor (Ctrl + C y vuelve a ejecutar `lanzar_proyecto.bat`).

---

### Problema 3: La ventana se cierra inmediatamente

**Causa:** Error fatal en el script antes de llegar a `pause`.

**Solución:**
1. Abre CMD manualmente (Windows + R → escribe `cmd` → Enter).
2. Navega a la carpeta del proyecto:
   ```cmd
   cd D:\actividad3-uf2405
   ```
3. Arrastra `lanzar_proyecto.bat` a la ventana CMD y pulsa Enter.
4. Lee el mensaje de error y actúa en consecuencia.

---

### Problema 4: CSS o JS no se cargan

**Causa:** Rutas incorrectas en `index.jsp` o archivos en ubicación errónea.

**Solución:**
1. Verifica que `estilos.css` está en `src/main/webapp/css/`.
2. Verifica que `script.js` está en `src/main/webapp/js/`.
3. Comprueba que `index.jsp` tiene:
   ```html
   <link rel="stylesheet" href="css/estilos.css">
   <script src="js/script.js"></script>
   ```
4. Limpia la caché del navegador (Ctrl + F5).

---

### Problema 5: El botón no muestra el mensaje

**Causa:** JavaScript no se carga o la función no está definida.

**Solución:**
1. Abre la consola del navegador (F12) y busca errores en rojo.
2. Verifica que `script.js` contiene la función `mostrarMensaje()`.
3. Comprueba que el botón tiene `onclick="mostrarMensaje()"`.
4. Recarga la página con Ctrl + F5.

---

## 8. Despliegue en Otro Ordenador

Para mover el proyecto a otro ordenador:

1. Copia la carpeta completa `actividad3-uf2405/`.
2. Asegúrate de que el ordenador destino tiene Java JDK instalado.
3. Ejecuta `instalar_maven_local.bat` (descargará Maven de nuevo).
4. Ejecuta `lanzar_proyecto.bat`.

**Nota:** La carpeta `tools/` NO debe copiarse (se regenera automáticamente). Tampoco la carpeta `target/` (se genera al compilar).

---

## 9. Generación del Archivo WAR

Para generar un archivo `.war` desplegable en cualquier servidor Tomcat:

```cmd
tools\apache-maven-3.9.9\bin\mvn.cmd clean package
```

El archivo se generará en: `target/actividad3-uf2405.war`

Para desplegarlo:
1. Copia `actividad3-uf2405.war` en la carpeta `webapps/` de tu instalación de Tomcat.
2. Inicia Tomcat.
3. Accede a `http://localhost:8080/actividad3/`.

---

## 10. Contacto y Soporte

Para problemas no contemplados en esta guía:

1. Revisa la **Bitácora de Errores** (`doc/02_bitacora_errores.md`).
2. Consulta la **Memoria Técnica** (`doc/01_memoria_tecnica.md`).
3. Verifica los logs de Tomcat en la ventana de comandos.

---

*Guía de despliegue - Actividad 3 UF2405 UD3 - Octubre 2026*
