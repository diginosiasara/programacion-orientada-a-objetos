@echo off
chcp 65001 >nul
title Diagnóstico UF2405
color 0E
cls

echo ==========================================================
echo   DIAGNÓSTICO DEL ENTORNO (Paso a paso)
echo ==========================================================
echo.
echo Presiona una tecla para comenzar la revisión...
pause

echo.
echo [1/4] Verificando carpeta tools...
if exist "%~dp0tools" (echo [OK] Carpeta tools encontrada) else (echo [ERROR] Falta la carpeta tools)

echo.
echo [2/4] Verificando PHP...
if exist "%~dp0tools\php\php.exe" (echo [OK] PHP encontrado) else (echo [ERROR] Falta tools\php\php.exe)

echo.
echo [3/4] Verificando MariaDB...
if exist "%~dp0tools\mariadb\bin\mysqld.exe" (echo [OK] MariaDB encontrado) else (echo [ERROR] Falta tools\mariadb\bin\mysqld.exe)

echo.
echo [4/4] Verificando my.ini...
if exist "%~dp0tools\mariadb\my.ini" (echo [OK] my.ini encontrado) else (echo [ERROR] Falta tools\mariadb\my.ini)

echo.
echo ==========================================================
echo   RESULTADO:
echo   Si ves algún [ERROR] arriba, ese es el motivo por el 
echo   que tu otro script se cierra solo.
echo ==========================================================
echo.
pause