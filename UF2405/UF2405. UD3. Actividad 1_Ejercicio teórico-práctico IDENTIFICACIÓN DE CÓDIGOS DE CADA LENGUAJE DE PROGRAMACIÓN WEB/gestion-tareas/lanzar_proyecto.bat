@echo off
echo ==========================================
echo   Lanzador de Proyecto Aislado UF2405
echo ==========================================
echo.

REM 1. Verificar Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java no esta instalado o no esta en el PATH.
    pause
    exit /b
)
echo [OK] Java detectado.

REM 2. Definir ruta absoluta de Maven local (usando %~dp0 que es la carpeta del .bat)
set MAVEN_PATH=%~dp0tools\apache-maven-3.9.9\bin

REM 3. Verificar si existe el ejecutable de Maven
if not exist "%MAVEN_PATH%\mvn.cmd" (
    echo [ERROR] No se encuentra Maven en: %MAVEN_PATH%
    echo [INFO] Por favor, ejecuta primero: instalar_maven_local.bat
    pause
    exit /b
)
echo [OK] Maven local detectado.

REM 4. Ejecutar Maven usando la ruta absoluta entre comillas (evita errores por espacios en la ruta)
echo [INFO] Compilando y levantando el servidor...
echo        (La primera vez puede tardar 2-3 minutos)
echo.
echo ==========================================
echo   Abre tu navegador en: http://localhost:8080/web/
echo   Presiona CTRL + C para detener el servidor.
echo ==========================================
echo.

"%MAVEN_PATH%\mvn.cmd" clean compile tomcat7:run

pause