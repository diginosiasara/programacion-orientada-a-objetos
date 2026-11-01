/**
 * ============================================
 * VALIDACIONES - Gestor de Personas UF2405
 * ============================================
 * Archivo de validaciones para formularios
 */

/**
 * Valida que un campo no esté vacío
 * @param {string} valor - Valor a validar
 * @param {string} nombreCampo - Nombre del campo para el mensaje
 * @returns {boolean}
 */
function validarNoVacio(valor, nombreCampo) {
    if (!valor || valor.trim() === '') {
        mostrarError(`El campo "${nombreCampo}" es obligatorio`);
        return false;
    }
    return true;
}

/**
 * Valida que una cadena sea una sola letra
 * @param {string} valor - Valor a validar
 * @returns {boolean}
 */
function validarUnaLetra(valor) {
    const regex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ]$/;
    if (!regex.test(valor)) {
        mostrarError('Debe introducir exactamente una letra (a-z, A-Z)');
        return false;
    }
    return true;
}

/**
 * Valida que un nombre/apellido solo contenga letras y espacios
 * @param {string} valor - Valor a validar
 * @param {string} nombreCampo - Nombre del campo
 * @returns {boolean}
 */
function validarNombre(valor, nombreCampo) {
    const regex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,64}$/;
    if (!regex.test(valor)) {
        mostrarError(`El campo "${nombreCampo}" solo puede contener letras (2-64 caracteres)`);
        return false;
    }
    return true;
}

/**
 * Valida el formulario de búsqueda por inicial
 * @param {HTMLFormElement} form - Formulario a validar
 * @returns {boolean}
 */
function validarFormularioBusqueda(form) {
    const inicial = form.inicial.value;
    
    if (!validarNoVacio(inicial, 'Inicial')) {
        return false;
    }
    
    if (!validarUnaLetra(inicial)) {
        form.inicial.focus();
        return false;
    }
    
    return true;
}

/**
 * Valida el formulario de agregar persona
 * @param {HTMLFormElement} form - Formulario a validar
 * @returns {boolean}
 */
function validarFormularioAgregar(form) {
    const nombre = form.nombre.value;
    const apellidos = form.apellidos.value;
    
    if (!validarNoVacio(nombre, 'Nombre')) {
        form.nombre.focus();
        return false;
    }
    
    if (!validarNombre(nombre, 'Nombre')) {
        form.nombre.focus();
        return false;
    }
    
    if (!validarNoVacio(apellidos, 'Apellidos')) {
        form.apellidos.focus();
        return false;
    }
    
    if (!validarNombre(apellidos, 'Apellidos')) {
        form.apellidos.focus();
        return false;
    }
    
    return true;
}

/**
 * Muestra un mensaje de error temporal
 * @param {string} mensaje - Mensaje a mostrar
 */
function mostrarError(mensaje) {
    // Eliminar mensaje anterior si existe
    const anterior = document.querySelector('.mensaje-error-temporal');
    if (anterior) anterior.remove();
    
    // Crear nuevo mensaje
    const div = document.createElement('div');
    div.className = 'mensaje error mensaje-error-temporal';
    div.textContent = '⚠️ ' + mensaje;
    div.style.position = 'fixed';
    div.style.top = '20px';
    div.style.right = '20px';
    div.style.zIndex = '9999';
    div.style.maxWidth = '400px';
    
    document.body.appendChild(div);
    
    // Auto-eliminar después de 4 segundos
    setTimeout(() => {
        div.style.opacity = '0';
        div.style.transition = 'opacity 0.5s';
        setTimeout(() => div.remove(), 500);
    }, 4000);
}

/**
 * Muestra un mensaje de éxito temporal
 * @param {string} mensaje - Mensaje a mostrar
 */
function mostrarExito(mensaje) {
    const div = document.createElement('div');
    div.className = 'mensaje exito';
    div.textContent = '✅ ' + mensaje;
    div.style.position = 'fixed';
    div.style.top = '20px';
    div.style.right = '20px';
    div.style.zIndex = '9999';
    
    document.body.appendChild(div);
    
    setTimeout(() => {
        div.style.opacity = '0';
        div.style.transition = 'opacity 0.5s';
        setTimeout(() => div.remove(), 500);
    }, 3000);
}