<?php
require_once __DIR__ . '/../includes/conexion.php';
require_once __DIR__ . '/../includes/funciones.php';

$mensaje = '';
$error = '';
$v = ['nombre' => '', 'apellidos' => '', 'direccion' => '', 'telefono' => '', 'edad' => '', 'altura' => ''];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    foreach ($v as $campo => $_) {
        $v[$campo] = getParam($_POST[$campo] ?? null, '');
    }

    // Validacion basica
    if ($v['nombre'] === '' || $v['apellidos'] === '') {
        $error = 'El nombre y los apellidos son obligatorios.';
    } elseif ($v['edad'] !== '' && !ctype_digit($v['edad'])) {
        $error = 'La edad debe ser un numero entero.';
    } else {
        $altura = str_replace(',', '.', $v['altura']);
        if ($altura !== '' && !is_numeric($altura)) {
            $error = 'La altura debe ser un numero, por ejemplo 1.75';
        }
    }

    if ($error === '') {
        // Consulta preparada: los datos nunca se mezclan con el SQL
        $edad = $v['edad'] === '' ? null : (int)$v['edad'];
        $alt  = $altura === '' ? null : (float)$altura;
        $stmt = $conexion->prepare(
            'INSERT INTO agenda (nombre, apellidos, direccion, telefono, edad, altura) VALUES (?, ?, ?, ?, ?, ?)'
        );
        $stmt->bind_param('ssssid', $v['nombre'], $v['apellidos'], $v['direccion'], $v['telefono'], $edad, $alt);

        if ($stmt->execute()) {
            $mensaje = 'Los datos han sido insertados en la base de datos correctamente.';
            $v = array_map(fn($x) => '', $v); // vaciar el formulario
        } else {
            $error = 'Error al insertar: ' . $stmt->error;
        }
        $stmt->close();
    }
}

$agenda = $conexion->query('SELECT * FROM agenda ORDER BY id DESC');
function e($x) { return htmlspecialchars((string)$x, ENT_QUOTES, 'UTF-8'); }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 3: Insercion (INSERT)</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { max-width: 420px; }
        label { display: block; margin-top: 12px; font-weight: bold; }
        input { width: 100%; padding: 6px; box-sizing: border-box; }
        button { margin-top: 16px; padding: 8px 18px; }
        .ok { color: green; font-weight: bold; }
        .err { color: red; font-weight: bold; }
        table { border-collapse: collapse; margin-top: 30px; }
        td, th { border: 1px solid #999; padding: 6px 10px; }
    </style>
</head>
<body>
    <h2>Pregunta 3: Insercion de Datos en Agenda (INSERT)</h2>
    <p><a href="index.php">&larr; Volver al Menu</a></p>

    <?php if ($mensaje): ?><p class="ok"><?= e($mensaje) ?></p><?php endif; ?>
    <?php if ($error): ?><p class="err"><?= e($error) ?></p><?php endif; ?>

    <form method="post" action="ejercicio3_insertar.php">
        <label>Nombre *      <input type="text" name="nombre"    maxlength="50"  value="<?= e($v['nombre']) ?>" required></label>
        <label>Apellidos *   <input type="text" name="apellidos" maxlength="100" value="<?= e($v['apellidos']) ?>" required></label>
        <label>Direccion     <input type="text" name="direccion" maxlength="255" value="<?= e($v['direccion']) ?>"></label>
        <label>Telefono      <input type="text" name="telefono"  maxlength="20"  value="<?= e($v['telefono']) ?>"></label>
        <label>Edad          <input type="number" name="edad" min="0" max="150"  value="<?= e($v['edad']) ?>"></label>
        <label>Altura (m)    <input type="text" name="altura" placeholder="1.75" value="<?= e($v['altura']) ?>"></label>
        <button type="submit">Insertar</button>
    </form>

    <h3>Contenido actual de la agenda</h3>
    <table>
        <tr><th>ID</th><th>Nombre</th><th>Apellidos</th><th>Direccion</th><th>Telefono</th><th>Edad</th><th>Altura</th></tr>
        <?php while ($row = $agenda->fetch_assoc()): ?>
        <tr>
            <?php foreach ($row as $col): ?><td><?= e($col) ?></td><?php endforeach; ?>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
<?php $conexion->close(); ?>