@echo off
chcp 65001 >nul
echo ==========================================
echo   EJECUTANDO PROGRAMA PRINCIPAL
echo ==========================================
echo.

REM Verificar que el Main.class exista
if not exist "bin\Main.class" (
    echo [ERROR] No se ha encontrado el programa compilado.
    echo Por favor, ejecuta primero "compilar.bat"
    pause
    exit /b 1
)

REM Ejecutar la clase Main indicando el classpath
java -cp bin Main

echo.
echo ==========================================
echo   FIN DE LA EJECUCION
echo ==========================================
pause