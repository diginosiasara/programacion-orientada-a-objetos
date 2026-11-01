@echo off
echo Compilando clases Java...
javac src/*.java

if %errorlevel% neq 0 (
    echo Error al compilar. Revisa el codigo.
    pause
    exit /b
)

echo Compilacion exitosa. Ejecutando programa...
echo -------------------------------------------
java -cp src Main
echo -------------------------------------------
pause