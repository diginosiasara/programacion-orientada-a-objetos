@echo off
chcp 65001 >nul
title Despliegue en Tomcat - UF2405
color 0C

echo ============================================================
echo   DESPLIEGUE EN APACHE TOMCAT
echo   UF2405 - GestorPersonas
echo ============================================================
echo.

call "%~dp0entorno.bat" 2>nul

set PROYECTO_DIR=%~dp0..
set BUILD_DIR=%PROYECTO_DIR%\build
set WEB_DIR=%PROYECTO_DIR%\web
set LIB_DIR=%PROYECTO_DIR%\lib
set APP_NAME=GestorPersonas
set DEPLOY_DIR=%CATALINA_HOME%\webapps\%APP_NAME%

echo [1/5] Deteniendo Tomcat si está activo...
call "%CATALINA_HOME%\bin\shutdown.bat" >nul 2>&1
timeout /t 2 /nobreak >nul
echo       [OK]
echo.

echo [2/5] Limpiando despliegue anterior...
if exist "%DEPLOY_DIR%" rmdir /s /q "%DEPLOY_DIR%"
echo       [OK]
echo.

echo [3/5] Creando estructura WAR...
mkdir "%DEPLOY_DIR%"
mkdir "%DEPLOY_DIR%\WEB-INF"
mkdir "%DEPLOY_DIR%\WEB-INF\classes"
mkdir "%DEPLOY_DIR%\WEB-INF\lib"
echo       [OK] Estructura creada.
echo.

echo [4/5] Copiando archivos del proyecto...
:: Copiar recursos web (JSP, CSS, JS)
xcopy /s /e /y /q "%WEB_DIR%\*" "%DEPLOY_DIR%\" >nul
:: Copiar clases compiladas
xcopy /s /e /y /q "%BUILD_DIR%\*" "%DEPLOY_DIR%\WEB-INF\classes\" >nul
:: Copiar librerías JDBC
xcopy /s /e /y /q "%LIB_DIR%\*.jar" "%DEPLOY_DIR%\WEB-INF\lib\" >nul
echo       [OK] Archivos copiados.
echo.

echo [5/5] Verificando despliegue...
if not exist "%DEPLOY_DIR%\index.jsp" (
    echo       [ERROR] Falta index.jsp
    pause
    exit /b 1
)
if not exist "%DEPLOY_DIR%\WEB-INF\classes\controlador\PersonaServlet.class" (
    echo       [ERROR] Falta PersonaServlet.class
    pause
    exit /b 1
)
echo       [OK] Despliegue verificado.
echo.

echo ============================================================
echo   ✓ PROYECTO DESPLEGADO EN TOMCAT
echo   URL: http://localhost:8080/%APP_NAME%/
echo ============================================================
echo.
echo Ahora ejecuta: 06_lanzar.bat
echo.
pause