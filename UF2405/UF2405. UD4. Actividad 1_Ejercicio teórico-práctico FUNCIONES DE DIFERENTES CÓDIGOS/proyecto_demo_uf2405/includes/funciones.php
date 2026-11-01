<?php
/**
 * Devuelve el valor recibido (de $_GET o $_POST) limpio de espacios,
 * o $default si no llega o viene vacio.
 * Uso: getParam($_GET["id"] ?? null, "-1")
 */
function getParam($value, $default) {
    if ($value === null || trim((string)$value) === '') {
        return $default;
    }
    return trim((string)$value);
}

/**
 * Sanitiza y fuerza el tipo de dato para prevenir Inyeccion SQL basica.
 * (Logica exacta solicitada en la Pregunta 2 del ejercicio)
 */
function sqlValue($value, $type) {
    if ($type === "int") {
        return (int)$value; // Fuerza a ser entero, eliminando codigo malicioso
    }
    return $value;
}
?>