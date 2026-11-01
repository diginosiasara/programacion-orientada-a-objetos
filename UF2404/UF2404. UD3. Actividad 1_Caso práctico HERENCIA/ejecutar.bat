@echo off
echo Compilando archivos Java...
javac Vehiculo.java Coche.java Bicicleta.java Main.java

if %errorlevel% neq 0 (
    echo Error en la compilacion
    pause
    exit /b 1
)

echo.
echo Ejecutando el programa...
echo ========================================
java Main
echo ========================================
echo.
pause