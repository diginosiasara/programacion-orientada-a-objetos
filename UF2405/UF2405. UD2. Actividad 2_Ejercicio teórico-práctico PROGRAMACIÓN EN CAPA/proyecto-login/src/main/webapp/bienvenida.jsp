<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.empresa.login.model.Usuario" %>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Usuario usuario = (Usuario) sesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido - UF2405</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <div class="container">
        <h2>✅ ¡Bienvenido al Sistema!</h2>
        <div class="user-info">
            <p><strong> Usuario:</strong> <%= usuario.getUsername() %></p>
            <p><strong>📛 Nombre:</strong> <%= usuario.getNombreCompleto() %></p>
            <p><strong> Rol:</strong> <span class="rol-badge"><%= usuario.getRol() %></span></p>
        </div>
        <a href="login.jsp" class="btn">🚪 Cerrar Sesión</a>
    </div>
</body>
</html>