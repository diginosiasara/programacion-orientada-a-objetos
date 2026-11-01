@echo off
chcp 65001 >nul
title Deteniendo Aplicacion Portable
color 0C

echo ============================================================
echo  DETENIENDO SERVICIOS PORTABLES
echo ============================================================
echo.

set "PROJECT_DIR=%~dp0"
set "CATALINA_HOME=%PROJECT_DIR%portable_env\tomcat"

echo [1/2] Deteniendo Tomcat...
call "%CATALINA_HOME%\bin\shutdown.bat"

echo [2/2] Deteniendo Base de Datos H2...
:: Buscamos el proceso de H2 y lo cerramos
taskkill /F /FI "WINDOWTITLE eq H2-DB" /T >nul 2>&1
taskkill /F /IM java.exe /FI "WINDOWTITLE eq H2-DB" /T >nul 2>&1

echo.
echo [OK] Servicios detenidos.
echo [OK] Puedes borrar la carpeta 'demo-mvc-portable' cuando quieras 
echo      y no quedara ningun rastro en tu sistema.
echo ============================================================
pause