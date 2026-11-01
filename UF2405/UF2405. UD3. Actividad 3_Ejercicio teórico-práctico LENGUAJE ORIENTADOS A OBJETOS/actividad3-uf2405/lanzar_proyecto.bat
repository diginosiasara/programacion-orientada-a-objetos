@echo off
title Lanzador - Actividad 3 UF2405
color 0B

echo ==========================================
echo   LANZADOR DE PROYECTO
echo ==========================================
echo.
pause

cd /d "%~dp0"

echo [1] Verificando Java...
java -version
if errorlevel 1 goto :nojava
echo [OK] Java detectado.
echo.

echo [2] Buscando Maven...
set MAVEN=%~dp0tools\apache-maven-3.9.9\bin\mvn.cmd
if not exist "%MAVEN%" goto :nomaven
echo [OK] Maven encontrado.
echo.

echo [3] Compilando y levantando servidor...
echo.
"%MAVEN%" clean compile tomcat7:run

echo.
echo ==========================================
echo   SERVIDOR DETENIDO
echo ==========================================
pause
goto :eof

:nojava
echo [ERROR] Java no esta instalado.
pause
goto :eof

:nomaven
echo [ERROR] Maven no encontrado. Ejecuta instalar_maven_local.bat primero.
pause
goto :eof