@echo off
chcp 65001 >nul
echo ==========================================
echo   COMPILANDO PROYECTO DE RELACIONES
echo ==========================================
echo.

REM Crear carpeta bin si no existe
if not exist "bin" mkdir bin

REM Compilar todos los archivos .java de la carpeta src hacia la carpeta bin
javac -d bin src\*.java

if %errorlevel% equ 0 (
    echo [EXITO] Compilacion completada correctamente.
    echo Los archivos .class se generaron en la carpeta /bin
) else (
    echo [ERROR] Fallo en la compilacion. Revisa la sintaxis de tus clases.
)
echo.
pause