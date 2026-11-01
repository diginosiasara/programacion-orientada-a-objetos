<?php
require_once __DIR__ . '/../includes/conexion.php';

// NOTA DIDÁCTICA: El ejercicio original usaba mysql_connect() y mysql_query().
// Esas funciones fueron eliminadas en PHP 7.0 por inseguridad. 
// Este código hace EXACTAMENTE lo mismo, pero con mysqli para que funcione.
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 1: Listado (SELECT)</title>
</head>
<body>
    <h2>Pregunta 1: Listado de Empresas (SELECT)</h2>
    <p><a href="index.php">⬅️ Volver al Menú</a></p>

    <?php
    // 1. Realizar una consulta MySQL
    $query = 'SELECT * FROM empresas';
    $result = $conexion->query($query) or die('Consulta fallida: ' . $conexion->error);

    // 2. Imprimir los resultados en HTML
    echo "<table border='1'>\n";
    // MYSQLI_ASSOC equivale al MYSQL_ASSOC del ejercicio original
    while ($line = $result->fetch_assoc()) {
        echo "\t<tr>\n";
        foreach ($line as $col_value) {
            echo "\t\t<td>" . htmlspecialchars($col_value) . "</td>\n";
        }
        // Añadimos un botón para probar el Ejercicio 2
        echo "\t\t<td><a href='ejercicio2_eliminar.php?id=" . $line['id'] . "&action=del'>Eliminar</a></td>\n";
        echo "\t</tr>\n";
    }
    echo "</table>\n";

    // 3. Liberar resultados y cerrar la conexión
    $result->free();
    $conexion->close();
    ?>
</body>
</html>