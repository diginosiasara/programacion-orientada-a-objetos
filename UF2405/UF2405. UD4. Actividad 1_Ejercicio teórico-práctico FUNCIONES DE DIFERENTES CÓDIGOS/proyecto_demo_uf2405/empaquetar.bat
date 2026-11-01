@echo off
chcp 65001 >nul
title Empaquetador UF2405 (Max 5MB - OBLIGATORIO)
color 0E
mode con cols=90 lines=30
cls

echo ============================================================
echo   EMPAQUETADOR DEL PROYECTO UF2405
echo   LIMITE OBLIGATORIO: 5 MB
echo ============================================================
echo.
echo  AVISO: Este script EXCLUIRA las carpetas 'tools' y
echo  'descargado-tool' para garantizar que el archivo final
echo  pese MENOS DE 5 MB.
echo.
echo  El destinatario debera descargar PHP y MariaDB manualmente
echo  o usar el script 'instalar_y_limpiar.bat' si tiene los ZIPs.
echo.
pause

:: Obtener nombre de la carpeta actual y fecha/hora
for %%I in (.) do set "NOMBRE_CARPETA=%%~nxI"
set "FECHA=%date:~-4,4%%date:~-7,2%%date:~-10,2%"
set "HORA=%time:~0,2%%time:~3,2%"
set "HORA=%HORA: =0%"

set "ARCHIVO_SALIDA=%~dp0%NOMBRE_CARPETA%_ENTREGA_%FECHA%_%HORA%.zip"

echo.
echo [1/1] Creando paquete de distribucion (Excluyendo 'tools' y 'descargado-tool')...
echo        Archivo de salida: %ARCHIVO_SALIDA%
echo.

:: Usar PowerShell para comprimir, EXCLUYENDO rigurosamente las carpetas grandes
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path '%~dp0' -Exclude 'tools', 'descargado-tool', 'empaquetar.bat', '*.zip', '*.log', '.git', 'Thumbs.db', 'desktop.ini' | Compress-Archive -DestinationPath '%ARCHIVO_SALIDA%' -Force"

echo.
if exist "%ARCHIVO_SALIDA%" (
    :: Obtener el tamaño del archivo en KB
    for %%A in ("%ARCHIVO_SALIDA%") do set "TAMANO=%%~zA"
    set /a TAMANO_KB=%TAMANO% / 1024
    
    echo ============================================================
    echo   ¡EMPAQUETADO FINALIZADO CON EXITO!
    echo ============================================================
    echo.
    echo  Archivo generado: %NOMBRE_CARPETA%_ENTREGA_%FECHA%_%HORA%.zip
    echo  Tamaño: %TAMANO_KB% KB (Limite maximo: 5120 KB = 5 MB)
    echo.
    
    if %TAMANO_KB% LSS 5120 (
        echo  [OK] El archivo cumple con el limite de 5 MB.
    ) else (
        echo  [ERROR] El archivo supera los 5 MB. Revisa el contenido.
    )
    
    echo.
    echo  CONTENIDO INCLUIDO (Solo codigo fuente):
    echo   - Carpeta 'public/' (Archivos PHP)
    echo   - Carpeta 'includes/' (Conexion y funciones)
    echo   - Carpeta 'sql/' (Script schema.sql)
    echo   - Scripts: 'instalar_y_limpiar.bat' y 'iniciar.bat'
    echo   - Documentacion (README, etc.)
    echo.
    echo  EXCLUIDO (Para cumplir el limite de 5MB):
    echo   - Carpeta 'tools/' (PHP + MariaDB ~200MB)
    echo   - Carpeta 'descargado-tool/' (ZIPs originales ~180MB)
    echo   - Archivos .zip, .log y carpetas del sistema
    echo ============================================================
) else (
    echo [ERROR] Fallo al crear el archivo ZIP.
)

echo.
pause