/**
 * ============================================
 * UTILIDADES - Gestor de Personas UF2405
 * ============================================
 * Funciones auxiliares reutilizables
 */

/**
 * Confirma una acción con el usuario
 * @param {string} mensaje - Mensaje de confirmación
 * @returns {boolean}
 */
function confirmarAccion(mensaje) {
    return confirm(mensaje || '¿Está seguro de realizar esta acción?');
}

/**
 * Capitaliza la primera letra de un string
 * @param {string} texto - Texto a capitalizar
 * @returns {string}
 */
function capitalizarPrimera(texto) {
    if (!texto) return '';
    return texto.charAt(0).toUpperCase() + texto.slice(1).toLowerCase();
}

/**
 * Formatea la fecha actual
 * @returns {string}
 */
function obtenerFechaActual() {
    const hoy = new Date();
    const opciones = { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric',
        weekday: 'long'
    };
    return hoy.toLocaleDateString('es-ES', opciones);
}

/**
 * Resalta una fila de tabla al pasar el ratón
 * @param {HTMLElement} fila - Fila a resaltar
 * @param {boolean} activar - Si activar o desactivar el resaltado
 */
function resaltarFila(fila, activar) {
    if (activar) {
        fila.style.backgroundColor = '#e8f4f8';
        fila.style.transition = 'background-color 0.3s';
    } else {
        fila.style.backgroundColor = '';
    }
}

/**
 * Añade interactividad a las filas de una tabla
 * @param {string} selectorTabla - Selector CSS de la tabla
 */
function activarInteractividadTablas(selectorTabla) {
    const filas = document.querySelectorAll(`${selectorTabla} tbody tr`);
    filas.forEach(fila => {
        fila.addEventListener('mouseenter', () => resaltarFila(fila, true));
        fila.addEventListener('mouseleave', () => resaltarFila(fila, false));
    });
}

/**
 * Cuenta caracteres en un input y muestra el contador
 * @param {HTMLInputElement} input - Input a monitorear
 * @param {string} contadorId - ID del elemento contador
 * @param {number} maximo - Máximo de caracteres
 */
function contarCaracteres(input, contadorId, maximo) {
    const contador = document.getElementById(contadorId);
    if (!contador) return;
    
    const actualizar = () => {
        const longitud = input.value.length;
        contador.textContent = `${longitud}/${maximo}`;
        contador.style.color = longitud > maximo ? '#e74c3c' : '#7f8c8d';
    };
    
    input.addEventListener('input', actualizar);
    actualizar();
}

/**
 * Inicializa la aplicación al cargar la página
 */
document.addEventListener('DOMContentLoaded', function() {
    console.log('✅ Gestor de Personas UF2405 cargado correctamente');
    console.log('📅 Fecha:', obtenerFechaActual());
    
    // Activar interactividad en tablas si existen
    const tablas = document.querySelectorAll('table');
    if (tablas.length > 0) {
        activarInteractividadTablas('table');
    }
});