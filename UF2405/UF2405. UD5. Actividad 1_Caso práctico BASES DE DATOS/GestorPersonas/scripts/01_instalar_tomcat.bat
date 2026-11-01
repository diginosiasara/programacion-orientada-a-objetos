@echo off
chcp 65001 >nul
title Instalación de Apache Tomcat 9 - UF2405
color 0A

echo ============================================================
echo   INSTALADOR DE APACHE TOMCAT 9 - Proyecto GestorPersonas
echo   UF2405 - Modelo de programación web y bases de datos
echo ============================================================
echo.

:: Configuración
set TOMCAT_VERSION=9.0.98
set TOMCAT_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v%TOMCAT_VERSION%/bin/apache-tomcat-%TOMCAT_VERSION%.zip
set TOMCAT_ZIP=apache-tomcat-%TOMCAT_VERSION%.zip
set INSTALL_DIR=%~dp0..\servidor
set TOMCAT_HOME=%INSTALL_DIR%\apache-tomcat-%TOMCAT_VERSION%

echo [1/5] Creando directorio de instalación...
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
echo       OK - Directorio: %INSTALL_DIR%
echo.

echo [2/5] Verificando si Tomcat ya está instalado...
if exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo       Tomcat ya está instalado en: %TOMCAT_HOME%
    echo       ¿Desea reinstalar? (S/N)
    set /p REINSTALAR=
    if /i not "%REINSTALAR%"=="S" goto :FIN
    rmdir /s /q "%TOMCAT_HOME%"
)
echo.

echo [3/5] Descargando Tomcat %TOMCAT_VERSION%...
echo       URL: %TOMCAT_URL%
echo       Esto puede tardar varios minutos...
echo.
powershell -Command "& { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%TOMCAT_URL%' -OutFile '%INSTALL_DIR%\%TOMCAT_ZIP%' }"

if not exist "%INSTALL_DIR%\%TOMCAT_ZIP%" (
    echo [ERROR] No se pudo descargar Tomcat.
    echo         Verifica tu conexión a internet.
    echo         También puedes descargarlo manualmente desde:
    echo         https://tomcat.apache.org/download-90.cgi
    pause
    exit /b 1
)
echo       Descarga completada.
echo.

echo [4/5] Extrayendo archivos...
powershell -Command "Expand-Archive -Path '%INSTALL_DIR%\%TOMCAT_ZIP%' -DestinationPath '%INSTALL_DIR%' -Force"
del "%INSTALL_DIR%\%TOMCAT_ZIP%"
echo       Extracción completada.
echo.

echo [5/5] Configurando permisos de ejecución...
icacls "%TOMCAT_HOME%\bin\*.bat" /grant Todos:F >nul 2>&1
echo       Permisos configurados.
echo.

echo ============================================================
echo   ✓ TOMCAT INSTALADO CORRECTAMENTE
echo   Ubicación: %TOMCAT_HOME%
echo ============================================================
echo.
echo Ahora ejecuta: 02_configurar_entorno.bat
echo.
pause
:FIN