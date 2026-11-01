@echo off
chcp 65001 >nul
title Lanzador Maestro - Proyecto SQL UF2405
color 0F

cls
echo.
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║   LANZADOR MAESTRO - Consultas SQL UF2405 UD7            ║
echo  ║   Proyecto 100%% Portable - Sin afectar el PC madre      ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.

:: ============================================================
::  VARIABLES DE ENTORNO
:: ============================================================
set "ROOT_DIR=%~dp0"
set "BIN_DIR=%ROOT_DIR%bin"
set "SQL_DIR=%ROOT_DIR%sql"
set "DATA_DIR=%ROOT_DIR%datos"
set "SCRIPTS_DIR=%ROOT_DIR%scripts"

set "SQLITE_EXE=%BIN_DIR%\sqlite3.exe"
set "DB_FILE=%DATA_DIR%\biblioteca.db"

set "CONFIG_OK=1"
set "MISSING_COMPONENTS="

:: ============================================================
::  VERIFICACIÓN DE COMPONENTES
:: ============================================================
echo  [INFO] Verificando estado del entorno...
echo  ----------------------------------------------------------

:: 1. Verificar sqlite3.exe
if exist "%SQLITE_EXE%" (
    echo  [OK] Motor SQLite encontrado: %SQLITE_EXE%
) else (
    echo  [!!] Motor SQLite NO encontrado
    set "CONFIG_OK=0"
    set "MISSING_COMPONENTS=sqlite3.exe"
)

:: 2. Verificar scripts SQL
if exist "%SQL_DIR%\01_crear_tablas.sql" (
    echo  [OK] Script de tablas encontrado
) else (
    echo  [!!] Script 01_crear_tablas.sql NO encontrado
    set "CONFIG_OK=0"
)

if exist "%SQL_DIR%\02_insertar_datos.sql" (
    echo  [OK] Script de datos encontrado
) else (
    echo  [!!] Script 02_insertar_datos.sql NO encontrado
    set "CONFIG_OK=0"
)

if exist "%SQL_DIR%\03_consultas.sql" (
    echo  [OK] Script de consultas encontrado
) else (
    echo  [!!] Script 03_consultas.sql NO encontrado
    set "CONFIG_OK=0"
)

:: 3. Verificar base de datos
if exist "%DB_FILE%" (
    echo  [OK] Base de datos existente: %DB_FILE%
) else (
    echo  [!!] Base de datos AUN NO creada
    set "CONFIG_OK=0"
)

echo  ----------------------------------------------------------
echo.

:: ============================================================
::  DECISIÓN: ¿Configurar o Lanzar?
:: ============================================================
if "%CONFIG_OK%"=="1" (
    goto ENTORNO_OK
) else (
    goto CONFIGURAR_ENTORNO
)

:: ============================================================
::  RUTA 1: ENTORNO YA CONFIGURADO → Lanzar aplicación
:: ============================================================
:ENTORNO_OK
color 0A
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║   ENTORNO CONFIGURADO CORRECTAMENTE                      ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.
echo  [INFO] Iniciando aplicación de consultas SQL...
echo.
timeout /t 2 /nobreak >nul

if exist "%SCRIPTS_DIR%\03_lanzar.bat" (
    call "%SCRIPTS_DIR%\03_lanzar.bat"
) else (
    echo  [ERROR] No se encontro 03_lanzar.bat en %SCRIPTS_DIR%
    pause
)
goto FIN

:: ============================================================
::  RUTA 2: ENTORNO NO CONFIGURADO → Instalar e inicializar
:: ============================================================
:CONFIGURAR_ENTORNO
color 0E
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║   ENTORNO NO CONFIGURADO - Iniciando setup automatico   ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.

if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"
if not exist "%DATA_DIR%" mkdir "%DATA_DIR%"

:: Paso 1: Instalar SQLite
echo  [PASO 1/2] Instalando motor SQLite...
echo.

if exist "%SCRIPTS_DIR%\01_instalar.bat" (
    call "%SCRIPTS_DIR%\01_instalar.bat"
) else (
    echo  [ERROR] No se encontro 01_instalar.bat
    echo  [INFO] Descargando SQLite manualmente con curl...
    curl -L -o "%BIN_DIR%\sqlite.zip" "https://www.sqlite.org/2024/sqlite-tools-win-x64-3460100.zip"
    if exist "%BIN_DIR%\sqlite.zip" (
        powershell -Command "Expand-Archive -Path '%BIN_DIR%\sqlite.zip' -DestinationPath '%BIN_DIR%\temp' -Force"
        for /r "%BIN_DIR%\temp" %%f in (sqlite3.exe) do move "%%f" "%BIN_DIR%\sqlite3.exe" >nul
        rmdir /s /q "%BIN_DIR%\temp" >nul 2>nul
        del "%BIN_DIR%\sqlite.zip" >nul 2>nul
    )
)

:: Verificar si se instaló
if not exist "%SQLITE_EXE%" (
    color 0C
    echo.
    echo  [ERROR CRITICO] No se pudo instalar SQLite.
    echo  Descargalo manualmente desde:
    echo  https://www.sqlite.org/download.html
    echo  y coloca sqlite3.exe en: %BIN_DIR%
    echo.
    pause
    exit /b 1
)

echo.
echo  [OK] SQLite instalado correctamente.
echo.

:: Paso 2: Inicializar base de datos
echo  [PASO 2/2] Inicializando base de datos...
echo.

if exist "%SCRIPTS_DIR%\02_inicializar.bat" (
    call "%SCRIPTS_DIR%\02_inicializar.bat"
) else (
    echo  [INFO] Creando tablas manualmente...
    "%SQLITE_EXE%" "%DB_FILE%" < "%SQL_DIR%\01_crear_tablas.sql"
    echo  [INFO] Insertando datos...
    "%SQLITE_EXE%" "%DB_FILE%" < "%SQL_DIR%\02_insertar_datos.sql"
)

:: Verificar base de datos
if not exist "%DB_FILE%" (
    color 0C
    echo.
    echo  [ERROR] No se pudo crear la base de datos.
    pause
    exit /b 1
)

echo.
color 0A
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║   CONFIGURACION COMPLETADA CON EXITO                     ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.
echo  [INFO] Iniciando aplicacion de consultas SQL en 3 segundos...
timeout /t 3 /nobreak >nul

if exist "%SCRIPTS_DIR%\03_lanzar.bat" (
    call "%SCRIPTS_DIR%\03_lanzar.bat"
) else (
    echo  [INFO] Ejecutando consultas directamente...
    "%SQLITE_EXE%" -header -column "%DB_FILE%" < "%SQL_DIR%\03_consultas.sql"
    pause
)

goto FIN

:: ============================================================
::  FIN
:: ============================================================
:FIN
echo.
echo  ═══════════════════════════════════════════════════════════
echo  Proyecto finalizado. Todo portable, sin rastros en el PC.
echo  ═══════════════════════════════════════════════════════════