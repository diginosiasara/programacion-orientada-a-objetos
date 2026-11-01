@echo off
chcp 65001 >nul
title Instalador Portable - SQLite
color 0A

echo ========================================================
echo   INSTALADOR PORTABLE - SQLite (Sin afectar el PC)
echo ========================================================
echo.

set "BIN_DIR=%~dp0..\bin"
set "SQLITE_URL=https://www.sqlite.org/2024/sqlite-tools-win-x64-3460100.zip"
set "SQLITE_EXE=%BIN_DIR%\sqlite3.exe"

if exist "%SQLITE_EXE%" (
    echo [OK] SQLite ya esta instalado correctamente.
    pause
    exit /b 0
)

echo [INFO] Descargando SQLite usando curl...
if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"

:: Descarga usando curl (Nativo en Windows 10/11)
curl -L -o "%BIN_DIR%\sqlite.zip" "%SQLITE_URL%"

if not exist "%BIN_DIR%\sqlite.zip" (
    echo [ERROR] No se pudo descargar. Verifica tu conexion a internet.
    echo         O descarga manualmente desde: %SQLITE_URL%
    pause
    exit /b 1
)

echo [INFO] Extrayendo archivos...
:: Extraer usando PowerShell
powershell -Command "Expand-Archive -Path '%BIN_DIR%\sqlite.zip' -DestinationPath '%BIN_DIR%\temp' -Force"

:: Mover el ejecutable (busca el exe dentro de la carpeta extraída)
for /r "%BIN_DIR%\temp" %%f in (sqlite3.exe) do (
    move "%%f" "%BIN_DIR%\sqlite3.exe" >nul
)

:: Limpieza de archivos temporales
rmdir /s /q "%BIN_DIR%\temp" >nul
del "%BIN_DIR%\sqlite.zip" >nul

if exist "%SQLITE_EXE%" (
    echo.
    echo [OK] SQLite instalado correctamente en: %BIN_DIR%
) else (
    echo.
    echo [ERROR] Fallo en la extraccion. Descargalo manualmente.
)

echo.
pause