<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestor de Contactos (UF2405 Demo)</title>
    <!-- Enlace al CSS externo -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header>
        <h2>Lista de Contactos</h2>
    </header>
    
    <main>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Edad</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iteración sobre la lista que inyectó el Servlet en el request -->
                <c:forEach var="contacto" items="${listaContactos}">
                    <tr>
                        <td>${contacto.id}</td>
                        <td>${contacto.nombre}</td>
                        <td>${contacto.apellidos}</td>
                        <td>${contacto.edad}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <section class="form-section">
            <h3>Agregar Nuevo Contacto</h3>
            <!-- El ID es necesario para que el archivo JS pueda encontrarlo -->
            <form id="contactForm" action="${pageContext.request.contextPath}/contactos" method="POST">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>
                
                <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" required>
                
                <button type="submit">Guardar</button>
            </form>
        </section>
    </main>

    <!-- Enlace al JS externo (se recomienda al final del body para mejorar el rendimiento de carga) -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>