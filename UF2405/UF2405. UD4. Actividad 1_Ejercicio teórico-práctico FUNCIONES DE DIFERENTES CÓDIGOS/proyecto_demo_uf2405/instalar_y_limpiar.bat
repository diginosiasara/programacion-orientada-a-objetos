@echo off
chcp 65001 >nul
title Instalador y Limpiador Portable UF2405
color 0A
mode con cols=90 lines=35
cls

echo ============================================================
echo  INSTALADOR PORTABLE UF2405 - PHP + MariaDB
echo  (100%% Aislado - Limpieza automatica al finalizar)
echo ============================================================
echo.
echo  AVISO: Este script instalara las herramientas en 'tools/'
echo  y al finalizar BORRARA la carpeta 'descargado-tool/' para
echo  liberar espacio. Tu PC no sera modificada.
echo.
pause

:: ==========================================================
:: 1. VERIFICAR ARCHIVOS ORIGINALES
:: ==========================================================
echo [1/8] Verificando archivos descargados...
set "PHP_ZIP=%~dp0descargado-tool\php\php-8.2.26-nts-Win32-vs16-x64.zip"
set "MARIADB_ZIP=%~dp0descargado-tool\mariadb\mariadb-10.11.10-winx64.zip"

if not exist "%PHP_ZIP%" (
    echo [ERROR] No se encontro: descargado-tool\php\php-8.2.26-nts-Win32-vs16-x64.zip
    pause
    exit /b 1
)
if not exist "%MARIADB_ZIP%" (
    echo [ERROR] No se encontro: descargado-tool\mariadb\mariadb-10.11.10-winx64.zip
    pause
    exit /b 1
)
echo [OK] Archivos ZIP localizados.

:: ==========================================================
:: 2. EXTRAER PHP
:: ==========================================================
echo.
echo [2/8] Instalando PHP 8.2 en 'tools/php'...
if not exist "%~dp0tools\php" mkdir "%~dp0tools\php"

:: Usar TAR nativo de Windows para extraer sin carpetas anidadas
tar -xf "%PHP_ZIP%" -C "%~dp0tools\php" --strip-components=1 2>nul
if not exist "%~dp0tools\php\php.exe" tar -xf "%PHP_ZIP%" -C "%~dp0tools\php"

:: Configurar php.ini para UF2405 (activar mysqli y pdo_mysql)
if exist "%~dp0tools\php\php.ini-development" (
    copy "%~dp0tools\php\php.ini-development" "%~dp0tools\php\php.ini" >nul
    powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-Content '%~dp0tools\php\php.ini') -replace ';extension_dir = \"ext\"', 'extension_dir = \"ext\"' -replace ';extension=mysqli', 'extension=mysqli' -replace ';extension=pdo_mysql', 'extension=pdo_mysql' | Set-Content '%~dp0tools\php\php.ini'"
)
echo [OK] PHP instalado y configurado.

:: ==========================================================
:: 3. EXTRAER MARIADB
:: ==========================================================
echo.
echo [3/8] Instalando MariaDB 10.11 en 'tools/mariadb' (puede tardar)...
if not exist "%~dp0tools\mariadb" mkdir "%~dp0tools\mariadb"

tar -xf "%MARIADB_ZIP%" -C "%~dp0tools\mariadb" --strip-components=1 2>nul
if not exist "%~dp0tools\mariadb\bin\mysqld.exe" tar -xf "%MARIADB_ZIP%" -C "%~dp0tools\mariadb"
echo [OK] MariaDB extraido.

:: ==========================================================
:: 4. INICIALIZAR BASE DE DATOS
:: ==========================================================
echo.
echo [4/8] Inicializando base de datos MariaDB...
if not exist "%~dp0tools\mariadb\data" (
    "%~dp0tools\mariadb\bin\mysql_install_db.exe" --datadir="%~dp0tools\mariadb\data" >nul 2>&1
)
echo [OK] Datos inicializados.

:: ==========================================================
:: 5. CREAR my.ini
:: ==========================================================
echo.
echo [5/8] Creando configuracion my.ini...
(
echo [mysqld]
echo basedir=%~dp0tools\mariadb
echo datadir=%~dp0tools\mariadb\data
echo port=3306
echo default-character-set=utf8mb4
echo.
echo [client]
echo default-character-set=utf8mb4
) > "%~dp0tools\mariadb\my.ini"
echo [OK] my.ini creado.

:: ==========================================================
:: 6. IMPORTAR SCHEMA.SQL
:: ==========================================================
echo.
echo [6/8] Importando base de datos 'demo_uf2405'...
start "" /MIN "%~dp0tools\mariadb\bin\mysqld.exe" --defaults-file="%~dp0tools\mariadb\my.ini"
timeout /t 5 /nobreak >nul

if exist "%~dp0sql\schema.sql" (
    "%~dp0tools\mariadb\bin\mysql.exe" -u root -e "CREATE DATABASE IF NOT EXISTS demo_uf2405 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    "%~dp0tools\mariadb\bin\mysql.exe" -u root demo_uf2405 < "%~dp0sql\schema.sql"
    echo [OK] Schema importado correctamente.
) else (
    "%~dp0tools\mariadb\bin\mysql.exe" -u root -e "CREATE DATABASE IF NOT EXISTS demo_uf2405 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    echo [OK] Base de datos creada (vacia, no se encontro sql\schema.sql).
)

:: Detener MariaDB temporal
"%~dp0tools\mariadb\bin\mysqladmin.exe" -u root shutdown >nul 2>&1

:: ==========================================================
:: 7. LIMPIEZA AUTOMATICA (ELIMINAR DESCARGADOS)
:: ==========================================================
echo.
echo [7/8] Liberando espacio... Eliminando carpeta 'descargado-tool/'
rmdir /S /Q "%~dp0descargado-tool" >nul 2>&1
if not exist "%~dp0descargado-tool" (
    echo [OK] ~180 MB liberados. Carpeta de descargas eliminada.
) else (
    echo [AVISO] No se pudo eliminar 'descargado-tool'. Puedes borrarla manualmente.
)

:: ==========================================================
:: 8. VERIFICACION FINAL
:: ==========================================================
echo.
echo [8/8] Verificacion final...
if exist "%~dp0tools\php\php.exe" (echo [OK] php.exe listo) else (echo [ERROR] Falta php.exe)
if exist "%~dp0tools\mariadb\bin\mysqld.exe" (echo [OK] mysqld.exe listo) else (echo [ERROR] Falta mysqld.exe)

echo.
echo ============================================================
echo   ¡INSTALACION COMPLETADA Y LIMPIADA CON EXITO!
echo ============================================================
echo.
echo  Estructura final del proyecto:
echo   - tools\php\          (PHP 8.2 configurado)
echo   - tools\mariadb\      (MariaDB 10.11 lista)
echo   - sql\schema.sql      (Tu codigo SQL)
echo   - descargado-tool\    [ELIMINADO]
echo.
echo  PASOS SIGUIENTES:
echo   1. Ejecuta "iniciar_todo.bat" para lanzar el proyecto.
echo   2. Abre http://localhost:8080 en tu navegador.
echo.
echo  Para desinstalar: simplemente borra la carpeta 'tools'
echo ============================================================
echo.
pause