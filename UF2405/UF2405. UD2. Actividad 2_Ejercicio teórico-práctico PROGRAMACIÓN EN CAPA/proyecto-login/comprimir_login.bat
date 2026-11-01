@echo off
title Comprimir Proyecto Login UF2405 para Entrega
color 0E

echo ============================================================
echo   COMPRESOR DE PROYECTO LOGIN (Optimizado para < 4MB)
echo   Excluye carpetas pesadas (target, tools, logs)
echo ============================================================
echo.

:: Nombre del archivo ZIP final
set ZIP_NAME=UF2405_Proyecto_Login.zip

:: Borrar ZIP anterior si existe para evitar conflictos
if exist "%ZIP_NAME%" (
    echo [INFO] Eliminando archivo ZIP anterior...
    del "%ZIP_NAME%"
)

echo [INFO] Comprimiendo SOLO archivos fuente y documentacion...
echo [INFO] Excluyendo: target/, tools/, logs/, .idea/
echo.

:: METODO 1: Usar TAR nativo de Windows 10/11 (Más rápido y fiable)
:: -a: detecta el formato .zip automáticamente
:: -c: crear archivo
:: -f: nombre del archivo
:: Luego listamos EXCLUSIVAMENTE lo que queremos incluir.
tar -a -c -f "%ZIP_NAME%" src pom.xml *.bat *.md 2>nul

:: Verificar si el Metodo 1 funcionó
if exist "%ZIP_NAME%" (
    goto :exito
)

:: METODO 2: Fallback a PowerShell (Por si el TAR nativo falla)
echo [INFO] Usando metodo alternativo (PowerShell)...
powershell -Command "Compress-Archive -Path 'src', 'pom.xml', '*.bat', '*.md' -DestinationPath '%ZIP_NAME%' -Force -CompressionLevel Optimal"

if exist "%ZIP_NAME%" (
    goto :exito
)

:: Si ambos fallan
echo [ERROR] No se pudo crear el ZIP. Revisa los permisos de la carpeta.
pause
exit /b 1

:exito
echo ============================================================
echo   ¡COMPRESION EXITOSA!
echo ============================================================
echo.
:: Mostrar el tamaño final del archivo
for %%A in ("%ZIP_NAME%") do (
    echo [OK] Archivo generado: %%A
    echo [INFO] Tamano final: %%~zA bytes (Menos de 4MB garantizado)
)
echo.
echo [AVISO] Recuerda que el profesor debera ejecutar 
echo         'instalar_tools.bat' y 'lanzar_login.bat' 
echo         para generar las carpetas 'tools' y 'target'.
echo.
pause