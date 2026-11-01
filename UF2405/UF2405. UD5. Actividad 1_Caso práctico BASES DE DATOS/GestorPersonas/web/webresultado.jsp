<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Persona"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - Gestor de Personas</title>
    
    <!-- CSS externo -->
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/resultado.css">
</head>
<body>
    <div class="container">
        
        <!-- Cabecera del resultado -->
        <div class="resultado-header">
            <h1>👥 ${titulo}</h1>
            <c:if test="${not empty personas}">
                <span class="badge-total">
                    Total: ${personas.size()} registro(s)
                </span>
            </c:if>
        </div>
        
        <!-- Mensaje de error -->
        <c:if test="${not empty error}">
            <div class="mensaje error">
                ⚠️ ${error}
            </div>
        </c:if>
        
        <!-- Mensaje informativo -->
        <c:if test="${not empty mensaje}">
            <div class="mensaje info">
                ℹ️ ${mensaje}
            </div>
        </c:if>
        
        <!-- Tabla de resultados -->
        <c:if test="${not empty personas}">
            <div class="detalles">
                <strong>Criterio de búsqueda:</strong> ${titulo}
            </div>
            
            <div class="tabla-resultados">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${personas}">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.nombre}</td>
                                <td>${p.apellidos}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <!-- Mensaje cuando no hay resultados -->
        <c:if test="${empty personas && empty error && empty mensaje}">
            <div class="sin-resultados">
                <span class="icono">📭</span>
                <p>No se encontraron personas con los criterios especificados.</p>
            </div>
        </c:if>
        
        <!-- Botones de acción -->
        <div class="acciones">
            <a href="index.jsp" class="btn btn-secondary">
                ← Volver al menú principal
            </a>
            <a href="Personas?accion=listar" class="btn">
                📋 Ver todas las personas
            </a>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <p>UF2405 - Arquitectura MVC 3 Capas</p>
        </div>
        
    </div>
    
    <!-- JS externo -->
    <script src="js/utilidades.js"></script>
</body>
</html>