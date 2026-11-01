@echo off
chcp 65001 >nul
title Ejecutando Consultas SQL - UF2405 UD7
color 0E

echo ========================================================
echo   CONSULTAS SQL - UF2405. UD7. Actividad 1
echo ========================================================
echo.

set "BIN_DIR=%~dp0..\bin"
set "SQL_DIR=%~dp0..\sql"
set "DATA_DIR=%~dp0..\datos"
set "DB_FILE=%DATA_DIR%\biblioteca.db"
set "SQLITE=%BIN_DIR%\sqlite3.exe"

if not exist "%SQLITE%" (
    echo [ERROR] No se encontro sqlite3.exe. Ejecuta 01_instalar.bat
    pause
    exit /b 1
)

if not exist "%DB_FILE%" (
    echo [ERROR] No existe la base de datos. Ejecuta 02_inicializar.bat
    pause
    exit /b 1
)

echo Base de datos: %DB_FILE%
echo ========================================================
echo.

:: Modo interactivo con las consultas
"%SQLITE%" -header -column "%DB_FILE%" < "%SQL_DIR%\03_consultas.sql"

echo.
echo ========================================================
echo   FIN DE LAS CONSULTAS
echo ========================================================
echo.
echo Opciones:
echo   [1] Ver consultas una por una (modo interactivo)
echo   [2] Exportar resultados a archivo
echo   [3] Salir
echo.
set /p OPCION="Elige una opcion: "

if "%OPCION%"=="1" goto interactivo
if "%OPCION%"=="2" goto exportar
goto fin

:interactivo
echo.
echo Abriendo consola interactiva de SQLite...
echo Escribe .quit para salir
echo.
"%SQLITE%" -header -column "%DB_FILE%"
goto fin

:exportar
set "EXPORT_FILE=%DATA_DIR%\resultados_consultas.txt"
"%SQLITE%" -header -column "%DB_FILE%" < "%SQL_DIR%\03_consultas.sql" > "%EXPORT_FILE%"
echo Resultados exportados a: %EXPORT_FILE%
goto fin

:fin
echo.
pause