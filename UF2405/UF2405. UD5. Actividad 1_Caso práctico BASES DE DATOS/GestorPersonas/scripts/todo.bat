@echo off
chcp 65001 >nul
title Instalación Completa - UF2405 GestorPersonas
color 0F

echo.
echo   ######################################################
echo   #                                                    #
echo   #   INSTALADOR AUTOMÁTICO - GestorPersonas           #
echo   #   UF2405 - Modelo de programación web y BD         #
echo   #                                                    #
echo   ######################################################
echo.
echo   Este script realizará:
echo     1. Instalación de Apache Tomcat 9
echo     2. Configuración del entorno (Java + Tomcat)
echo     3. Instalación del driver JDBC MySQL
echo     4. Compilación del código Java
echo     5. Despliegue en Tomcat
echo     6. Lanzamiento de la aplicación
echo.
echo   REQUISITOS PREVIOS:
echo     - Java JDK 8 o superior instalado
echo     - MySQL Server instalado y corriendo
echo     - Conexión a Internet (primera vez)
echo.
echo   Presiona cualquier tecla para CONTINUAR
echo   o cierra esta ventana para CANCELAR.
pause >nul

echo.
echo ============================================================
echo   PASO 1: Instalación de Tomcat
echo ============================================================
call "%~dp0\01_instalar_tomcat.bat"
if %ERRORLEVEL% NEQ 0 goto :ERROR

echo.
echo ============================================================
echo   PASO 2: Configuración del Entorno
echo ============================================================
call "%~dp0\02_configurar_entorno.bat"
if %ERRORLEVEL% NEQ 0 goto :ERROR

echo.
echo ============================================================
echo   PASO 3: Instalación del Driver JDBC
echo ============================================================
call "%~dp0\03_instalar_driver_mysql.bat"
if %ERRORLEVEL% NEQ 0 goto :ERROR

echo.
echo ============================================================
echo   PASO 4: Compilación del Proyecto
echo ============================================================
call "%~dp0\04_compilar.bat"
if %ERRORLEVEL% NEQ 0 goto :ERROR

echo.
echo ============================================================
echo   PASO 5: Despliegue en Tomcat
echo ============================================================
call "%~dp0\05_desplegar.bat"
if %ERRORLEVEL% NEQ 0 goto :ERROR

echo.
echo ============================================================
echo   PASO 6: Lanzamiento de la Aplicación
echo ============================================================
call "%~dp0\06_lanzar.bat"
goto :FIN

:ERROR
echo.
echo ============================================================
echo   [ERROR] La instalación se detuvo.
echo   Revisa los mensajes anteriores.
echo ============================================================
pause
exit /b 1

:FIN
echo.
echo ============================================================
echo   ✓ INSTALACIÓN COMPLETADA CON ÉXITO
echo ============================================================
echo.
echo   La aplicación está disponible en:
echo   http://localhost:8080/GestorPersonas/
echo.
echo   Para volver a lanzar: 06_lanzar.bat
echo   Para detener:         07_parar.bat
echo.
pause