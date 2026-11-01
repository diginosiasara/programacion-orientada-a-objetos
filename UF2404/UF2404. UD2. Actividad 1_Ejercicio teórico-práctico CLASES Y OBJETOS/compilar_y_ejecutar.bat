@echo off
chcp 65001 >nul
cls

echo ============================================
echo  COMPILANDO Y EJECUTANDO PROGRAMA JAVA
echo ============================================
echo.

REM Compilar todos los archivos .java del directorio actual
echo [1/2] Compilando archivos Java...
javac *.java

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Hubo errores al compilar. Revisa el codigo.
    pause
    exit /b
)

echo [OK] Compilacion exitosa.
echo.

REM Ejecutar la clase principal
echo [2/2] Ejecutando programa...
echo.
java Main

echo.
pause