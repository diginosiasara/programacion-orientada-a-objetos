@echo off
REM ============================================================
REM  Script para compilar y ejecutar el proyecto EstructuraDatos
REM ============================================================

REM 1. Crear carpeta de salida si no existe
if not exist "bin" mkdir bin

REM 2. Compilar todos los archivos .java de src/
echo [1/2] Compilando archivos fuente...
javac -d bin src\*.java
if errorlevel 1 (
    echo ERROR: Fallo en la compilacion.
    pause
    exit /b 1
)
echo Compilacion correcta.
echo.

REM 3. Ejecutar la clase principal Programa
echo [2/2] Ejecutando el programa...
echo -----------------------------------------------------------
java -cp bin Programa
echo -----------------------------------------------------------
echo.

pause