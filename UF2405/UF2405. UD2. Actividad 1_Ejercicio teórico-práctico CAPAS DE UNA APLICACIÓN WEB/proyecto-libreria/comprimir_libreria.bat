@echo off
title Comprimir Libreria para Entrega
color 0E

echo ============================================================
echo   COMPRESOR LIBRERIA (Optimizado para < 4MB)
echo ============================================================
echo.

set ZIP_NAME=UF2405_Libreria_Virtual.zip

if exist "%ZIP_NAME%" del "%ZIP_NAME%"

echo [INFO] Comprimiendo SOLO codigo fuente y documentacion...
echo [INFO] Excluyendo: target/, tools/

:: Usar TAR nativo de Windows 10/11
tar -a -c -f "%ZIP_NAME%" src pom.xml *.bat *.md 2>nul

if exist "%ZIP_NAME%" (
    echo.
    echo [OK] ZIP generado: %ZIP_NAME%
    for %%A in ("%ZIP_NAME%") do echo [INFO] Tamano: %%~zA bytes
) else (
    echo [ERROR] Fallo al crear el ZIP.
)

pause