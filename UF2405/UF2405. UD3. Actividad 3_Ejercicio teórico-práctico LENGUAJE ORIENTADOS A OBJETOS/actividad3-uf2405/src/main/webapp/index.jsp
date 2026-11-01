<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Fragmento JSP: Generación dinámica de contenido en el servidor
    String fechaServidor = new java.util.Date().toString();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Título de la página de pruebas</title>
    
    <!-- ============================================
         ENLACE AL CSS EXTERNO (Capa de Presentación)
         ============================================ -->
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <div class="contenedor">
        
        <!-- Imagen centrada -->
        <div class="contenedor-imagen">
            <img src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400" 
                 alt="Cielo con nubes y atardecer">
        </div>

        <!-- Línea horizontal separadora -->
        <hr>

        <!-- Enlace a otro sitio web -->
        <p>
            <a href="https://www.ejemplo.com">Nombre del vínculo</a> 
            es un vínculo a otro buen sitio web
        </p>

        <!-- Encabezados -->
        <h1>Esto es un encabezado</h1>
        <h2>Este es un encabezado mediano</h2>

        <!-- Enlace de correo electrónico -->
        <p>Envíen el correo a 
            <a href="mailto:soporte@suempresa.com">soporte@suempresa.com</a>
        </p>

        <!-- Párrafos -->
        <p>¡Este es un nuevo párrafo!</p>
        <p>¡Este es un nuevo párrafo!</p>

        <!-- Texto en cursiva y negrita SIN salto de párrafo -->
        <p class="texto-estilo">Esta es una nueva oración sin salto de párrafo, en cursiva negrita.</p>

        <!-- Línea horizontal final -->
        <hr>

        <!-- ============================================
             BOTÓN CON JAVASCRIPT (Actividad 2)
             ============================================ -->
        <button class="boton-mensaje" onclick="mostrarMensaje()">
            Pulsar para mostrar mensaje
        </button>

        <!-- Información del servidor (generada dinámicamente por JSP) -->
        <p style="font-size: 0.9em; color: #666; margin-top: 30px;">
            <em>🖥️ Servidor: Apache Tomcat | 📅 Fecha: <%= fechaServidor %></em>
        </p>
    </div>

    <!-- ============================================
         ENLACE AL JAVASCRIPT EXTERNO (Capa de Comportamiento)
         ============================================ -->
    <script src="js/script.js"></script>
</body>
</html>