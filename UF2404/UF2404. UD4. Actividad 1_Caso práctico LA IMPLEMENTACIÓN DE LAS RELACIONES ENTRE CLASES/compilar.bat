@echo off
echo ========================================
echo   COMPILANDO PROYECTO EMPLEADOS
echo ========================================
echo.

REM Crear carpeta de clases si no existe
if not exist "bin" mkdir bin

REM Compilar todos los archivos .java del directorio src
javac -d bin src\Empleado.java src\Vendedor.java src\Administrativo.java src\Principal.java

if %errorlevel% equ 0 (
    echo.
    echo [OK] Compilacion completada correctamente.
    echo Las clases estan en la carpeta "bin".
) else (
    echo.
    echo [ERROR] Ha ocurrido un error durante la compilacion.
)

echo.
pause