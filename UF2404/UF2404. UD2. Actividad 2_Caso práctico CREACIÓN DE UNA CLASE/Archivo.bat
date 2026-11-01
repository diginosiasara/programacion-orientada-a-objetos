@echo off
chcp 65001 >nul
cls

echo ============================================
echo  PROYECTO: Clase Persona (POO)
echo ============================================
echo.

echo [1/2] Compilando clases...
javac Persona.java Main.java

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Fallo en la compilacion.
    pause
    exit /b
)

echo [OK] Compilacion correcta.
echo.

echo [2/2] Ejecutando programa...
echo --------------------------------------------
java Main
echo --------------------------------------------
echo.

pause