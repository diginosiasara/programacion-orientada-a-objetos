# Diario de Aprendizajes - Actividad 3 UF2405 UD3

**Proyecto:** actividad3-uf2405  
**Fecha:** Octubre 2026

---

## 1. Separación de Responsabilidades

### Aprendizaje clave: HTML, CSS y JS en archivos separados

Al principio tenía todo el código (HTML, CSS, JS) en un solo archivo `index.jsp`. Aprendí que esto es una mala práctica porque:

1. **Dificulta el mantenimiento:** Cambiar un color requiere buscar en cientos de líneas.
2. **Impide la reutilización:** No puedo usar los mismos estilos en otra página.
3. **Reduce el rendimiento:** El navegador no puede cachear CSS/JS si están embebidos.

**Solución aplicada:**
```
webapp/
├── index.jsp      (Solo HTML + expresiones JSP)
├── css/
│   └── estilos.css (Solo estilos)
└── js/
    ── script.js   (Solo interactividad)
```

### Reflexión
Este principio (Separation of Concerns) es fundamental en arquitectura de software. Cada archivo tiene una única responsabilidad, lo que facilita el trabajo en equipo y el mantenimiento a largo plazo.

---

## 2. Patrón MVC con Java Servlets

### Aprendizaje clave: Modelo-Vista-Controlador en la práctica

Aprendí cómo aplicar el patrón MVC usando tecnologías Java EE:

- **Modelo:** No aplica en esta actividad (no hay datos persistentes).
- **Vista:** `index.jsp` (presenta la información al usuario).
- **Controlador:** `Actividad3Servlet.java` (recibe la petición y redirige a la vista).

**Código del controlador:**
```java
@WebServlet("/Actividad3Servlet")
public class Actividad3Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
```

### Reflexión
MVC separa la lógica de control de la presentación, lo que facilita el mantenimiento y la escalabilidad. El Servlet actúa como punto único de entrada para todas las peticiones.

---

## 3. Lenguajes Orientados a Objetos en la Web

### Aprendizaje clave: Java como lenguaje orientado a objetos

El Servlet `Actividad3Servlet` demuestra los principios de la POO:

1. **Herencia:** Extiende de `HttpServlet`, heredando su funcionalidad.
2. **Polimorfismo:** Sobrescribe los métodos `doGet()` y `doPost()`.
3. **Encapsulamiento:** Los atributos son privados y se acceden mediante métodos.
4. **Abstracción:** Oculta la complejidad del protocolo HTTP.

### Reflexión
Los lenguajes orientados a objetos como Java permiten crear aplicaciones web robustas y mantenibles. La herencia y el polimorfismo facilitan la extensión de funcionalidades sin modificar el código existente.

---

## 4. JavaScript en el Lado del Cliente

### Aprendizaje clave: Interactividad sin recargar la página

La Actividad 2 requería añadir un botón que mostrara un mensaje al pulsarlo. Aprendí que:

- JavaScript se ejecuta **exclusivamente en el navegador** (lado del cliente).
- El evento `onclick` permite reaccionar a la interacción del usuario.
- La función `alert()` es un método del objeto global `window`.

**Código implementado:**
```javascript
function mostrarMensaje() {
    alert("Mensaje mostrado al pulsar el botón");
}
```

### Reflexión
JavaScript es esencial para crear experiencias de usuario interactivas. A diferencia de los lenguajes de servidor, no requiere recargar la página para mostrar información al usuario.

---

## 5. Despliegue Aislado con Maven Local

### Aprendizaje clave: No tocar el sistema operativo

Uno de los mayores retos fue lograr que el proyecto funcionara **sin instalar Maven ni Tomcat en Windows**. Aprendí:

1. **Maven local:** Descargar Maven en la carpeta `tools/` del proyecto y llamarlo con su ruta absoluta.
2. **Tomcat embebido:** Usar el plugin `tomcat7-maven-plugin` que descarga Tomcat automáticamente.
3. **Scripts .bat robustos:** Usar `%~dp0` para obtener la ruta absoluta del script y evitar problemas con directorios relativos.

### Reflexión
Este enfoque es ideal para entornos educativos o portables: el proyecto funciona en cualquier ordenador con Java instalado, sin necesidad de configuración adicional.

---

## 6. Errores de Compilación y Debugging

### Aprendizaje clave: Leer los mensajes de error

Los errores de Maven suelen ser muy descriptivos si sabes leerlos:

- **`cannot find symbol`**: Falta un import o el package no coincide con la estructura de carpetas.
- **`BUILD FAILURE`**: Revisar las líneas anteriores para encontrar el error específico.
- **`404 Not Found`**: El servidor funciona, pero la aplicación no está desplegada en esa ruta.

**Técnica aprendida**: Arrastrar el archivo `.bat` a una ventana CMD abierta manualmente para que no se cierre y poder leer los errores.

### Reflexión
El debugging es una habilidad fundamental. Antes de preguntar, hay que leer el error, buscar la línea exacta y entender qué significa.

---

## 7. Buenas Prácticas Documentadas

### Aprendizaje clave: La documentación es parte del código

He creado 4 documentos técnicos:
1. **Memoria técnica:** Describe la arquitectura y decisiones de diseño.
2. **Bitácora de errores:** Registro de problemas y soluciones.
3. **Diario de aprendizajes:** Reflexión personal sobre lo aprendido.
4. **Guía de despliegue:** Instrucciones para ejecutar el proyecto.

### Reflexión
Un proyecto bien documentado es un proyecto profesional. La documentación permite que otros desarrolladores (o yo mismo en el futuro) puedan entender, mantener y extender el código sin problemas.

---

## 8. Cumplimiento de los Objetivos de la UF2405

### Criterio CE1.8: Lenguajes orientados a objetos

Esta actividad cumple con el criterio CE1.8 al:
- Aplicar características de Java (herencia, polimorfismo, encapsulamiento) en el Servlet.
- Usar JSP para generar contenido dinámico en el servidor.
- Separar la capa de presentación (HTML/CSS/JS) de la capa de control (Servlet).

### Reflexión final
Los lenguajes orientados a objetos como Java, combinados con tecnologías web como JSP y Servlets, permiten crear aplicaciones web robustas, mantenibles y escalables. La separación de responsabilidades es clave para el desarrollo profesional.

---

*Diario de aprendizajes - Actividad 3 UF2405 UD3 - Octubre 2026*
