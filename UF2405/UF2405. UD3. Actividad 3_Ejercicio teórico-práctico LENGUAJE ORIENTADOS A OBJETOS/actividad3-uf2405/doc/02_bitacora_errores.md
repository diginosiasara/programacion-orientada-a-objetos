# Bitácora de Errores - Actividad 3 UF2405

**Proyecto:** actividad3-uf2405  
**Fecha:** Octubre 2026

---

## Error 1: "mvn no se reconoce como un comando"

### Descripción
Al ejecutar `lanzar_proyecto.bat`, la consola mostraba:
```
"mvn" no se reconoce como un comando interno o externo,
programa o archivo por lotes ejecutable.
```

### Causa raíz
El script utilizaba un bucle `for /d` con `goto` para buscar Maven. En Windows Batch, las variables establecidas dentro de un bloque `for` no persisten correctamente al hacer `goto`, por lo que el PATH no se actualizaba.

### Solución aplicada
Se reescribió el script eliminando el bucle `for` y usando una ruta absoluta directa:
```bat
set "MAVEN_CMD=%~dp0tools\apache-maven-3.9.9\bin\mvn.cmd"
"%MAVEN_CMD%" clean compile tomcat7:run
```

### Resultado
✅ Maven se ejecuta correctamente usando su ruta absoluta entre comillas.

---

## Error 2: La ventana del .bat se cierra inmediatamente

### Descripción
Al hacer doble clic en `lanzar_proyecto.bat`, la ventana se abría y cerraba instantáneamente sin mostrar ningún mensaje.

### Causa raíz
El script encontraba un error fatal antes de llegar a la instrucción `pause`, o no tenía `pause` al final.

### Solución aplicada
1. Se añadió `pause` al final del script.
2. Se simplificó la lógica eliminando bloques condicionales complejos.
3. Se usaron etiquetas `goto` simples para manejar errores.
4. Para debugging, se ejecutó el script arrastrándolo a una ventana CMD abierta manualmente.

### Resultado
✅ La ventana permanece abierta y muestra los mensajes de error o éxito.

---

## Error 3: HTTP 404 al acceder a la aplicación

### Descripción
El servidor Tomcat arrancaba correctamente, pero al acceder a `http://localhost:8080/actividad3/` aparecía error 404.

### Causa raíz
El archivo `index.jsp` estaba dentro de la carpeta `WEB-INF/` (que es privada y no accesible desde el navegador).

### Solución aplicada
Se movió `index.jsp` fuera de `WEB-INF/`, al mismo nivel que la carpeta:
```
src/main/webapp/
├── WEB-INF/
│   └── web.xml
└── index.jsp  ← Aquí, NO dentro de WEB-INF
```

### Resultado
✅ La aplicación se despliega correctamente en `http://localhost:8080/actividad3/`.

---

## Error 4: CSS y JS no se cargan en el navegador

### Descripción
La página se mostraba sin estilos (fondo blanco en lugar de amarillo) y sin interactividad JavaScript.

### Causa raíz
Las rutas en `index.jsp` eran incorrectas o los archivos no estaban en las carpetas correctas.

### Solución aplicada
1. Se crearon las carpetas `css/` y `js/` dentro de `src/main/webapp/`.
2. Se verificaron las rutas en `index.jsp`:
   ```html
   <link rel="stylesheet" href="css/estilos.css">
   <script src="js/script.js"></script>
   ```
3. Se confirmó que los archivos estaban **fuera** de `WEB-INF/`.

### Resultado
✅ Los estilos y scripts se cargan correctamente.

---

## Error 5: El botón no muestra el mensaje

### Descripción
Al pulsar el botón, no aparecía la alerta de JavaScript.

### Causa raíz
La función `mostrarMensaje()` no estaba definida o el evento `onclick` no estaba correctamente enlazado.

### Solución aplicada
1. Se verificó que `script.js` contenía la función:
   ```javascript
   function mostrarMensaje() {
       alert("Mensaje mostrado al pulsar el botón");
   }
   ```
2. Se confirmó que el botón tenía el atributo correcto:
   ```html
   <button onclick="mostrarMensaje()">Pulsar para mostrar mensaje</button>
   ```
3. Se verificó que `script.js` se cargaba **después** del botón en el HTML.

### Resultado
✅ El botón muestra la alerta correctamente al pulsarlo.

---

## Resumen de Errores y Soluciones

| # | Error | Causa | Solución | Estado |
|---|-------|-------|----------|--------|
| 1 | Maven no reconocido | Variables en bucle for no persisten | Ruta absoluta directa | ✅ Resuelto |
| 2 | Ventana se cierra | Sin pause o error fatal | Simplificar script y añadir pause | ✅ Resuelto |
| 3 | HTTP 404 | JSP dentro de WEB-INF | Mover JSP fuera de WEB-INF | ✅ Resuelto |
| 4 | CSS/JS no cargan | Rutas incorrectas | Corregir rutas en JSP | ✅ Resuelto |
| 5 | Botón no funciona | Función JS no definida | Verificar script.js y onclick | ✅ Resuelto |

---

*Bitácora actualizada durante el desarrollo de la Actividad 3 UF2405 UD3*
