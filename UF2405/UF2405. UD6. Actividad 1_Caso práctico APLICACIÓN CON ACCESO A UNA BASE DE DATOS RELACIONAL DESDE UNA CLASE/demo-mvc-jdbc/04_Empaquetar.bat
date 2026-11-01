@echo off
chcp 65001 >nul
title Empaquetado de Proyecto UF2405
color 0D

echo ============================================================
echo  EMPAQUETADO DE PROYECTO (UF2405 - MVC + JDBC Portable)
echo ============================================================
echo.
echo Selecciona el tipo de empaquetado que necesitas:
echo.
echo [1] Generar archivo .WAR (Para desplegar en un Tomcat real)
echo [2] ZIP "Solo Codigo Fuente" (Ligero, para entregar o GitHub)
echo [3] ZIP "Proyecto Portable Completo" (Para USB / PC sin Java)
echo [4] Salir
echo.
set /p opcion=Elige una opcion (1-4): 

if "%opcion%"=="1" goto EMPAQUETAR_WAR
if "%opcion%"=="2" goto ZIP_CODIGO
if "%opcion%"=="3" goto ZIP_PORTABLE
if "%opcion%"=="4" exit
goto MENU

:EMPAQUETAR_WAR
echo.
echo ============================================================
echo  [OPCION 1] GENERANDO ARCHIVO .WAR
echo ============================================================
echo [INFO] Usando Maven para compilar y empaquetar...
set "PROJECT_DIR=%~dp0"
set "JAVA_HOME=%PROJECT_DIR%portable_env\jdk"
set "MAVEN_HOME=%PROJECT_DIR%portable_env\maven"
set "PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%PATH%"

if not exist "%MAVEN_HOME%\bin\mvn.cmd" (
    echo [ERROR] No se encuentra Maven. Ejecuta primero '01_Descargar_Entorno.bat'
    pause & exit /b 1
)

call mvn clean package -DskipTests
if %errorlevel% equ 0 (
    echo.
    echo [OK] Archivo .WAR generado con exito.
    echo [OK] Ruta: %PROJECT_DIR%target\demo.war
    echo [INFO] Este archivo se puede copiar en la carpeta 'webapps' de cualquier Tomcat.
) else (
    echo [ERROR] Fallo al compilar. Revisa los mensajes de Maven.
)
pause
exit /b 0

:ZIP_CODIGO
echo.
echo ============================================================
echo  [OPCION 2] ZIP "SOLO CODIGO FUENTE"
echo ============================================================
echo [INFO] Creando ZIP ligero (Sin entorno portable)...
echo [INFO] Se excluiran las carpetas 'portable_env' y 'target'.
echo.

:: Usamos tar nativo de Windows 10/11 que es mas rapido y fiable
tar -a -c -f "Proyecto_UF2405_Codigo.zip" --exclude="portable_env" --exclude="target" --exclude="Proyecto_UF2405_Codigo.zip" --exclude="Proyecto_UF2405_Completo.zip" .

echo.
echo [OK] Archivo creado: Proyecto_UF2405_Codigo.zip
echo [INFO] Peso aproximado: Pocos KB. Ideal para enviar por email o entregar.
pause
exit /b 0

:ZIP_PORTABLE
echo.
echo ============================================================
echo  [OPCION 3] ZIP "PROYECTO PORTABLE COMPLETO"
echo ============================================================
echo [INFO] Creando ZIP con todo el entorno (Java, Tomcat, H2)...
echo [INFO] Esto tardara un poco dependiendo de la velocidad de tu disco.
echo [INFO] Se excluiran las carpetas 'target' y archivos temporales.
echo.

:: Usamos tar nativo de Windows 10/11
tar -a -c -f "Proyecto_UF2405_Completo.zip" --exclude="target" --exclude="Proyecto_UF2405_Completo.zip" --exclude="Proyecto_UF2405_Codigo.zip" .

echo.
echo [OK] Archivo creado: Proyecto_UF2405_Completo.zip
echo [INFO] Peso aproximado: ~200-300 MB. 
echo [INFO] Ideal para llevar en un USB y ejecutar en un PC sin Java instalado.
pause
exit /b 0