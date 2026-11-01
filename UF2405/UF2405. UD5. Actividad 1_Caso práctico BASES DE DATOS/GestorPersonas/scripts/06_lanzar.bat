@echo off
chcp 65001 >nul
title Lanzando GestorPersonas - UF2405
color 0A

echo ============================================================
echo   LANZAMIENTO DE LA APLICACIÓN
echo   UF2405 - GestorPersonas
echo ============================================================
echo.

call "%~dp0entorno.bat" 2>nul

set APP_URL=http://localhost:8080/GestorPersonas/

echo [1/3] Iniciando Apache Tomcat...
start "Tomcat" /min cmd /c ""%CATALINA_HOME%\bin\startup.bat""
echo       [OK] Tomcat iniciándose...
echo.

echo [2/3] Esperando a que Tomcat esté listo...
set /a INTENTOS=0
:ESPERAR
timeout /t 2 /nobreak >nul
set /a INTENTOS+=1

:: Verificar si Tomcat responde
powershell -Command "try { $r = Invoke-WebRequest -Uri '%APP_URL%' -TimeoutSec 2 -UseBasicParsing -ErrorAction Stop; exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto :LISTO

if %INTENTOS% GEQ 20 (
    echo       [AVISO] Tomcat tarda en iniciar.
    echo       Abre el navegador manualmente en:
    echo       %APP_URL%
    goto :ABRIR
)

echo       Esperando... (%INTENTOS%/20)
goto :ESPERAR

:LISTO
echo       [OK] Tomcat listo.
echo.

:ABRIR
echo [3/3] Abriendo navegador...
start "" "%APP_URL%"
echo       [OK] Navegador abierto.
echo.

echo ============================================================
echo   ✓ APLICACIÓN LANZADA
echo   URL: %APP_URL%
echo ============================================================
echo.
echo El servidor se está ejecutando en segundo plano.
echo Para detenerlo, ejecuta: 07_parar.bat
echo.
echo Presiona cualquier tecla para salir de este script
echo (Tomcat seguirá ejecutándose).
pause >nul