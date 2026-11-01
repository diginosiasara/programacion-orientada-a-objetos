@echo off
echo ============================================
echo Compilando clases Java...
echo ============================================
javac src/*.java

if %errorlevel% neq 0 (
    echo [ERROR] Fallo al compilar. Revisa el codigo.
    pause
    exit /b
)

echo [OK] Compilacion exitosa.
echo.
echo ============================================
echo Ejecutando programa...
echo ============================================
java -cp src Main
echo ============================================
pause