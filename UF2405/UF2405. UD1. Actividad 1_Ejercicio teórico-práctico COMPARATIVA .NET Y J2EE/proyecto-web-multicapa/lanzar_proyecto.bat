@echo off
title Servidor UF2405 Activo
color 0B

:: Ir a la carpeta del proyecto
cd /d "%~dp0"

echo ==========================================
echo   CONFIGURANDO ENTORNO LOCAL...
echo ==========================================
set "PATH=%cd%\tools\apache-maven-3.9.6\bin;%PATH%"

echo.
echo ==========================================
echo   INICIANDO SERVIDOR TOMCAT...
echo   (MANTEN ESTA VENTANA ABIERTA)
echo ==========================================
echo.

:: cmd /k ejecuta el comando y MANTIENE la ventana abierta
cmd /k mvn clean compile tomcat7:run