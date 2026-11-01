<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - UF2405</title>
    <link rel="stylesheet" href="css/estilos.css">
    <script src="js/script.js"></script>
</head>
<body>
    <div class="container">
        <h2>🔐 Acceso de Usuario</h2>
        <div id="msg-error" class="error-msg"></div>
        
        <form action="LoginServlet" method="POST" onsubmit="return validarFormulario();">
            <div class="form-group">
                <label for="username">👤 Usuario:</label>
                <input type="text" id="username" name="username" placeholder="Introduce tu usuario" required>
            </div>
            <div class="form-group">
                <label for="password">🔑 Contraseña:</label>
                <input type="password" id="password" name="password" placeholder="Introduce tu contraseña" required>
            </div>
            <button type="submit">Entrar</button>
        </form>
        
        <div class="info-box">
            <p><strong> Usuarios de prueba:</strong></p>
            <ul style="margin: 5px 0; padding-left: 20px;">
                <li><code>admin</code> / <code>1234</code></li>
                <li><code>usuario</code> / <code>pass</code></li>
            </ul>
        </div>
    </div>
</body>
</html>