<?php
/**
 * Conexión a la base de datos usando mysqli (Modernización del ejercicio)
 */
$host = '127.0.0.1';
$user = 'root';
$pass = '';
$dbname = 'demo_uf2405';

// Conexión estilo orientado a objetos (recomendado en UF2405)
$conexion = new mysqli($host, $user, $pass, $dbname);

if ($conexion->connect_error) {
    die('No se pudo conectar: ' . $conexion->connect_error);
}

// Establecer charset UTF-8 (Equivalente moderno a "SET NAMES 'utf8'")
$conexion->set_charset("utf8mb4");
?>