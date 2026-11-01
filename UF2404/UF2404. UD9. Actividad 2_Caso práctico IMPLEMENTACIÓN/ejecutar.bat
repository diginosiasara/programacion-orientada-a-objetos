@echo off
chcp 65001 >nul
title Actividad 2 - UF2404 Implementacion
color 0A

echo ============================================================
echo            COMPILANDO primera_aplicacion.java...
echo ============================================================
javac primera_aplicacion.java

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Fallo en la compilacion. Revisa que tengas Java instalado y el codigo sea correcto.
    pause
    exit /b %errorlevel%
)

echo [EXITO] Compilacion completada sin errores.
echo.

echo ============================================================
echo            PRUEBA 1: Ejecucion sin argumentos
echo ============================================================
java primera_aplicacion
pause

echo.
echo ============================================================
echo            PRUEBA 2: Ejecucion con numeros validos (15 y 25)
echo ============================================================
java primera_aplicacion 15 25
pause

echo.
echo ============================================================
echo            PRUEBA 3: Ejecucion con argumentos invalidos (10 y "hola")
echo ============================================================
java primera_aplicacion 10 hola
pause

echo.
echo ============================================================
echo            PROCESO FINALIZADO CORRECTAMENTE
echo ============================================================
pause