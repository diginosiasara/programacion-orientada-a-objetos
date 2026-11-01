@echo off
chcp 65001 >nul
title Deteniendo Tomcat - UF2405
color 0C

echo ============================================================
echo   DETENIENDO APACHE TOMCAT
echo   UF2405 - GestorPersonas
echo ============================================================
echo.

call "%~dp0entorno.bat" 2>nul

echo [1/2] Enviando señal de apagado a Tomcat...
call "%CATALINA_HOME%\bin\shutdown.bat" >nul 2>&1
echo       [OK]
echo.

echo [2/2] Verificando procesos Java...
taskkill /f /im java.exe >nul 2>&1
taskkill /f /im javaw.exe >nul 2>&1
echo       [OK] Procesos finalizados.
echo.

echo ============================================================
echo   ✓ TOMCAT DETENIDO
echo ============================================================
echo.
pause