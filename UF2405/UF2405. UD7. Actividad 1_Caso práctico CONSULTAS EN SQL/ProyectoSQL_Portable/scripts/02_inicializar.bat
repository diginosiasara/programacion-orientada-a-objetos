@echo off
chcp 65001 >nul
title Inicializando Base de Datos
color 0B

echo ========================================================
echo   INICIALIZANDO BASE DE DATOS: biblioteca.db
echo ========================================================
echo.

set "BIN_DIR=%~dp0..\bin"
set "SQL_DIR=%~dp0..\sql"
set "DATA_DIR=%~dp0..\datos"
set "DB_FILE=%DATA_DIR%\biblioteca.db"
set "SQLITE=%BIN_DIR%\sqlite3.exe"

if not exist "%SQLITE%" (
    echo [ERROR] No se encontro sqlite3.exe
    echo         Ejecuta primero: 01_instalar.bat
    pause
    exit /b 1
)

if not exist "%DATA_DIR%" mkdir "%DATA_DIR%"

echo [1/2] Creando tablas...
"%SQLITE%" "%DB_FILE%" < "%SQL_DIR%\01_crear_tablas.sql"
if errorlevel 1 (
    echo [ERROR] Fallo al crear tablas
    pause
    exit /b 1
)
echo [OK] Tablas creadas.

echo [2/2] Insertando datos de ejemplo...
"%SQLITE%" "%DB_FILE%" < "%SQL_DIR%\02_insertar_datos.sql"
if errorlevel 1 (
    echo [ERROR] Fallo al insertar datos
    pause
    exit /b 1
)
echo [OK] Datos insertados.

echo.
echo ========================================================
echo   BASE DE DATOS LISTA: %DB_FILE%
echo ========================================================
echo.

echo Tablas creadas:
"%SQLITE%" "%DB_FILE%" ".tables"

echo.
echo Registros por tabla:
"%SQLITE%" "%DB_FILE%" "SELECT 'Libro: ' || COUNT(*) FROM Libro UNION ALL SELECT 'Autor: ' || COUNT(*) FROM Autor UNION ALL SELECT 'LibAut: ' || COUNT(*) FROM LibAut UNION ALL SELECT 'Estudiante: ' || COUNT(*) FROM Estudiante UNION ALL SELECT 'Prestamo: ' || COUNT(*) FROM Prestamo;"

echo.
pause