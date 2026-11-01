@echo off
chcp 65001 >nul
title Configuración del Entorno - UF2405
color 0B

echo ============================================================
echo   CONFIGURACIÓN DEL ENTORNO DE DESARROLLO
echo   UF2405 - GestorPersonas
echo ============================================================
echo.

:: Detectar JAVA_HOME
echo [1/4] Detectando instalación de Java...
if defined JAVA_HOME (
    echo       JAVA_HOME detectado: %JAVA_HOME%
) else (
    echo       [!] JAVA_HOME no está definido.
    echo       Buscando Java en el sistema...
    
    for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\JavaSoft\Java Development Kit" /s 2^>nul ^| findstr /i "JavaHome"') do (
        set "JAVA_HOME=%%b"
    )
    
    if not defined JAVA_HOME (
        for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\JavaSoft\JDK" /s 2^>nul ^| findstr /i "JavaHome"') do (
            set "JAVA_HOME=%%b"
        )
    )
    
    if not defined JAVA_HOME (
        echo       [ERROR] No se encontró Java en el sistema.
        echo       Descarga JDK desde: https://adoptium.net/
        echo       E instala y configura JAVA_HOME manualmente.
        pause
        exit /b 1
    )
    echo       JAVA_HOME encontrado: %JAVA_HOME%
)

if not exist "%JAVA_HOME%\bin\java.exe" (
    echo       [ERROR] Java no es válido en: %JAVA_HOME%
    pause
    exit /b 1
)
echo       [OK] Java válido.
echo.

:: Detectar CATALINA_HOME (Tomcat)
echo [2/4] Detectando Apache Tomcat...
set PROYECTO_DIR=%~dp0..
set TOMCAT_DIR=%PROYECTO_DIR%\servidor\apache-tomcat-9.0.98

if not exist "%TOMCAT_DIR%\bin\startup.bat" (
    echo       [ERROR] Tomcat no encontrado en: %TOMCAT_DIR%
    echo       Ejecuta primero: 01_instalar_tomcat.bat
    pause
    exit /b 1
)
set CATALINA_HOME=%TOMCAT_DIR%
echo       [OK] Tomcat encontrado: %CATALINA_HOME%
echo.

:: Configurar variables de entorno de la sesión
echo [3/4] Configurando variables de entorno de la sesión...
set JAVA_HOME=%JAVA_HOME%
set CATALINA_HOME=%CATALINA_HOME%
set PATH=%JAVA_HOME%\bin;%CATALINA_HOME%\bin;%PATH%
echo       JAVA_HOME     = %JAVA_HOME%
echo       CATALINA_HOME = %CATALINA_HOME%
echo       [OK] Variables configuradas.
echo.

:: Guardar en archivo de configuración persistente
echo [4/4] Guardando configuración en entorno.bat...
(
    echo @echo off
    echo set JAVA_HOME=%JAVA_HOME%
    echo set CATALINA_HOME=%CATALINA_HOME%
    echo set PATH=%%JAVA_HOME%%\bin;%%CATALINA_HOME%%\bin;%%PATH%%
    echo set PROYECTO_DIR=%PROYECTO_DIR%
    echo set PROYECTO_NAME=GestorPersonas
) > "%PROYECTO_DIR%\scripts\entorno.bat"
echo       [OK] Archivo entorno.bat creado.
echo.

echo ============================================================
echo   ✓ ENTORNO CONFIGURADO CORRECTAMENTE
echo ============================================================
echo.
echo Variables configuradas:
echo   JAVA_HOME     = %JAVA_HOME%
echo   CATALINA_HOME = %CATALINA_HOME%
echo.
echo Ahora ejecuta: 03_instalar_driver_mysql.bat
echo.
pause