<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Gestor de Personas - Proyecto UF2405">
    <meta name="author" content="UF2405">
    <title>Gestor de Personas - UF2405</title>
    
    <!-- CSS externo -->
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="container">
        
        <!-- Banner superior -->
        <div class="banner">
            <h1>👥 Gestor de Personas</h1>
            <p>Proyecto de demostración UF2405 - Arquitectura MVC 3 Capas</p>
        </div>
        
        <!-- Opciones principales -->
        <h2>📋 Opciones disponibles</h2>
        <div class="opciones-grid">
            <a href="Personas?accion=listar" class="opcion">
                <span class="icono">📋</span>
                <span>Listar todas</span>
            </a>
            <a href="Personas?accion=contar" class="opcion">
                <span class="icono">🔢</span>
                <span>Contar personas</span>
            </a>
        </div>
        
        <!-- Búsqueda por inicial -->
        <div class="seccion-busqueda">
            <h2>🔍 Buscar por inicial del nombre</h2>
            <form action="Personas" method="get" 
                  onsubmit="return validarFormularioBusqueda(this);">
                <input type="hidden" name="accion" value="buscar">
                <div class="campo">
                    <label for="inicial">Letra inicial:</label>
                    <input type="text" id="inicial" name="inicial" 
                           maxlength="1" placeholder="Ej: A" required>
                </div>
                <button type="submit" class="btn btn-secondary">🔍 Buscar</button>
            </form>
        </div>
        
        <!-- Agregar nueva persona -->
        <div class="seccion-agregar">
            <h2>➕ Agregar nueva persona</h2>
            <form action="Personas" method="post" 
                  onsubmit="return validarFormularioAgregar(this);">
                <input type="hidden" name="accion" value="agregar">
                <div class="fila">
                    <div>
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" 
                               maxlength="64" placeholder="Ej: Juan" required>
                    </div>
                    <div>
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" id="apellidos" name="apellidos" 
                               maxlength="64" placeholder="Ej: García López" required>
                    </div>
                </div>
                <button type="submit" class="btn">💾 Agregar persona</button>
            </form>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <p>UF2405 - Modelo de programación web y bases de datos</p>
            <p>Arquitectura MVC + JDBC + MySQL + Procedimientos Almacenados</p>
        </div>
        
    </div>
    
    <!-- JS externo (al final para mejor rendimiento) -->
    <script src="js/validaciones.js"></script>
    <script src="js/utilidades.js"></script>
</body>
</html>