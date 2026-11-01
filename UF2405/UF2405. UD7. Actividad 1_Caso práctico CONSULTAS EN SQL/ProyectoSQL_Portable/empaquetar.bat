@echo off
chcp 65001 >nul
title Empaquetador Portable - Proyecto SQL UF2405
color 0D

cls
echo.
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║   EMPAQUETADOR DE PROYECTO - Generador de ZIP            ║
echo  ║   Proyecto 100%% Portable - Sin dependencias externas    ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.

:: ============================================================
::  VARIABLES DE ENTORNO
:: ============================================================
set "ROOT_DIR=%~dp0"
:: Obtener el nombre de la carpeta actual
for %%i in ("%~dp0\.") do set "PROJECT_NAME=%%~nxi"
set "OUTPUT_ZIP=%ROOT_DIR%%PROJECT_NAME%.zip"

echo  [INFO] Proyecto detectado: %PROJECT_NAME%
echo  [INFO] Ruta de origen:      %ROOT_DIR%
echo  [INFO] Archivo de destino:  %OUTPUT_ZIP%
echo  ----------------------------------------------------------
echo.

:: ============================================================
::  LIMPIEZA PREVIAS
:: ============================================================
if exist "%OUTPUT_ZIP%" (
    echo  [INFO] Eliminando archivo ZIP anterior...
    del /f /q "%OUTPUT_ZIP%" >nul 2>&1
)

:: ============================================================
::  EMPAQUETADO CON POWERSHELL (Nativo en Windows)
:: ============================================================
echo  [INFO] Comprimiendo archivos... 
echo         (Por favor, espera unos segundos)
echo.

:: Compress-Archive empaqueta el contenido de la carpeta raíz
powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -LiteralPath '%ROOT_DIR:~0,-1%' -DestinationPath '%OUTPUT_ZIP%' -Force -CompressionLevel Optimal"

:: ============================================================
::  VERIFICACIÓN DE RESULTADO
:: ============================================================
if exist "%OUTPUT_ZIP%" (
    color 0A
    echo  ╔══════════════════════════════════════════════════════════╗
    echo  ║   ¡EMPAQUETADO COMPLETADO CON ÉXITO!                     ║
    echo  ╚══════════════════════════════════════════════════════════╝
    echo.
    
    :: Obtener tamaño del archivo
    for %%A in ("%OUTPUT_ZIP%") do (
        set "FILE_SIZE=%%~zA"
    )
    echo  [OK] Archivo creado: %OUTPUT_ZIP%
    echo  [OK] Tamaño aproximado: %FILE_SIZE% bytes
    echo.
    echo  [INFO] Ya puedes enviar o copiar este archivo .zip
) else (
    color 0C
    echo  ╔══════════════════════════════════════════════════════════╗
    echo     ERROR AL EMPAQUETAR                                      ║
    echo  ╚══════════════════════════════════════════════════════════╝
    echo.
    echo  [ERROR] No se pudo generar el archivo ZIP.
    echo  [INFO] Verifica que no tengas el archivo abierto en otro programa.
)

echo.
pause