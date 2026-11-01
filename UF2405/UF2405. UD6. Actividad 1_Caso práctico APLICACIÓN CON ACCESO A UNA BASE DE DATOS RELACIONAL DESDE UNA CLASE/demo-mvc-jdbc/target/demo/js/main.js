// src/main/webapp/js/main.js

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    
    form.addEventListener('submit', function(event) {
        const edadInput = document.getElementById('edad');
        const edad = parseInt(edadInput.value, 10);
        
        // Validación en el lado del cliente
        if (isNaN(edad) || edad < 0 || edad > 120) {
            alert('Por favor, introduce una edad válida (entre 0 y 120).');
            event.preventDefault(); // Evita que el formulario se envíe al servidor
            edadInput.focus();
        } else {
            console.log('Formulario válido, enviando al Controlador (Servlet)...');
        }
    });
});