@echo off
chcp 65001 >nul
title Reiniciar Base de Datos
color 0C

echo ========================================================
echo   REINICIANDO BASE DE DATOS...
echo ========================================================
echo.

set "DATA_DIR=%~dp0..\datos"
set "DB_FILE=%DATA_DIR%\biblioteca.db"

if exist "%DB_FILE%" (
    del "%DB_FILE%"
    echo [OK] Base de datos eliminada: %DB_FILE%
) else (
    echo [INFO] No existia base de datos previa.
)

echo.
echo [1/2] Inicializando base de datos...
call "%~dp002_inicializar.bat"

echo.
echo [2/2] Ejecutando consultas...
call "%~dp003_lanzar.bat"

echo.
pause