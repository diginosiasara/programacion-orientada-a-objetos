@echo off
chcp 65001 >nul
color 0A
echo ========================================
echo   PROYECTO EMPLEADOS - EJECUCION COMPLETA
echo ========================================
echo.

REM 1. Verificar que existe la carpeta src
if not exist "src" (
    echo [ERROR] No se encuentra la carpeta "src".
    echo         Asegurate de que este archivo .bat esta en la carpeta raiz del proyecto.
    echo.
    pause
    exit /b
)

REM 2. Verificar que existen los archivos .java
set ARCHIVOS_OK=1
for %%f in (Empleado.java Vendedor.java Administrativo.java Principal.java) do (
    if not exist "src\%%f" (
        echo [ERROR] Falta el archivo: src\%%f
        set ARCHIVOS_OK=0
    )
)

if %ARCHIVOS_OK%==0 (
    echo.
    echo Revisa que todos los archivos .java esten en la carpeta "src".
    pause
    exit /b
)

REM 3. Verificar que Java esta instalado
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java no esta instalado o no esta en el PATH.
    echo         Instala el JDK y vuelve a intentarlo.
    pause
    exit /b
)

REM 4. Crear carpeta bin si no existe
if not exist "bin" mkdir bin

REM 5. Compilar
echo [1/2] Compilando archivos Java...
javac -encoding UTF-8 -d bin src\Empleado.java src\Vendedor.java src\Administrativo.java src\Principal.java

if errorlevel 1 (
    echo.
    echo [ERROR] La compilacion ha fallado. Revisa los mensajes de arriba.
    pause
    exit /b
)

echo [OK] Compilacion correcta.
echo.

REM 6. Verificar que se genero Principal.class
if not exist "bin\Principal.class" (
    echo [ERROR] No se genero el archivo Principal.class
    pause
    exit /b
)

REM 7. Ejecutar
echo [2/2] Ejecutando el programa...
echo ========================================
echo.
java -cp bin Principal

echo.
echo ========================================
pause