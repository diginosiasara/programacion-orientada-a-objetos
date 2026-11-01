/**
 * ============================================
 * SCRIPT.JS - Actividad 3 UF2405
 * Responsabilidad: COMPORTAMIENTO E INTERACTIVIDAD
 * ============================================
 * 
 * Este archivo contiene toda la lógica JavaScript
 * que se ejecuta en el lado del CLIENTE (navegador).
 */

// ============================================
// INICIALIZACIÓN AL CARGAR LA PÁGINA
// ============================================

window.onload = function() {
    console.log("✅ JavaScript cargado correctamente.");
    console.log("📅 Fecha de carga: " + new Date().toLocaleString());
    
    // Añadir eventos a los botones
    inicializarBotones();
    
    // Mostrar mensaje de bienvenida en consola
    mostrarBienvenida();
};

// ============================================
// FUNCIONES PRINCIPALES
// ============================================

/**
 * Función solicitada en la Actividad 2:
 * Muestra un mensaje al pulsar el botón.
 */
function mostrarMensaje() {
    alert("Mensaje mostrado al pulsar el botón");
    console.log("🔔 Botón pulsado. Mensaje mostrado al usuario.");
}

/**
 * Inicializa los eventos de los botones de la página.
 */
function inicializarBotones() {
    const botones = document.querySelectorAll('.boton-mensaje');
    
    botones.forEach(function(boton) {
        boton.addEventListener('click', function() {
            console.log("🖱️ Evento click detectado en botón.");
        });
    });
}

/**
 * Muestra un mensaje de bienvenida en la consola del navegador.
 */
function mostrarBienvenida() {
    console.log('%c============================================', 'color: #4a90e2; font-weight: bold;');
    console.log('%c  UF2405 - UD3 - Actividad 3', 'color: #4a90e2; font-size: 16px; font-weight: bold;');
    console.log('%c  Lenguajes Orientados a Objetos', 'color: #764ba2; font-size: 14px;');
    console.log('%c============================================', 'color: #4a90e2; font-weight: bold;');
    console.log('');
    console.log('🌐 Tecnologías utilizadas:');
    console.log('  - HTML5 (Estructura)');
    console.log('  - CSS3 (Presentación visual)');
    console.log('  - JavaScript (Comportamiento interactivo)');
    console.log('  - JSP/Servlet (Servidor Java)');
    console.log('');
    console.log('📋 Separación de responsabilidades:');
    console.log('  - index.jsp: Estructura HTML');
    console.log('  - estilos.css: Diseño visual');
    console.log('  - script.js: Lógica interactiva');
}

// ============================================
// FUNCIONES ADICIONALES (Extensibilidad)
// ============================================

/**
 * Cambia el color de fondo de la página.
 * Ejemplo de manipulación del DOM.
 */
function cambiarColorFondo(color) {
    document.body.style.backgroundColor = color;
    console.log("🎨 Color de fondo cambiado a: " + color);
}

/**
 * Muestra la fecha y hora actual en un elemento específico.
 */
function mostrarFechaHora(elementoId) {
    const elemento = document.getElementById(elementoId);
    if (elemento) {
        const ahora = new Date();
        elemento.textContent = "Última actualización: " + ahora.toLocaleString();
    }
}