@echo off
chcp 65001 >nul
cls

echo ============================================
echo  PROYECTO: Series y Videojuegos (POO)
echo ============================================
echo.

REM Compilar todas las clases
echo [1/2] Compilando clases...
javac Entregable.java Serie.java Videojuego.java Main.java

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Fallo en la compilacion.
    pause
    exit /b
)

echo [OK] Compilacion correcta.
echo.

REM Ejecutar el programa
echo [2/2] Ejecutando Main...
echo --------------------------------------------
java Main
echo --------------------------------------------
echo.

pause