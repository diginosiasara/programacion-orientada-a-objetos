<?php
require_once __DIR__ . '/../includes/conexion.php';
require_once __DIR__ . '/../includes/funciones.php';

// Captura de parametros tal como en el enunciado
$idempresa = getParam($_GET["id"] ?? null, "-1");
$action    = getParam($_GET["action"] ?? null, "");

if ($action == "del") {
    // Construccion segura de la consulta usando la funcion del ejercicio
    $sql = "DELETE FROM empresas WHERE id = " . sqlValue($idempresa, "int");

    $conexion->query($sql);

    // Redireccion
    header("Location: ejercicio1_listado.php");
    exit; // Importante detener la ejecucion tras un header
} else {
    echo "Peticion no valida.";
}
?>