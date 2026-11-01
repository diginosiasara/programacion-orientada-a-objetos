@echo off
setlocal enabledelayedexpansion
title Instalar Tools Automaticamente
color 0B

echo ============================================================
echo   BUSCADOR AUTOMATICO DE MAVEN (Carpeta 'tools')
echo   Busca en D:\central\cusos2026\ y copia a este proyecto
echo ============================================================
echo.

:: 1. Verificar si ya existe
if exist "tools\apache-maven-3.9.6\bin\mvn.cmd" (
    echo [OK] Maven ya esta instalado en este proyecto. No es necesario hacer nada.
    pause
    exit /b 0
)

echo [INFO] Buscando carpeta de Maven en D:\central\cusos2026\ ...
echo [INFO] Esto puede tardar unos segundos...
echo.

set "FOUND=0"

:: 2. Buscar en el disco y copiar
for /r "D:\central\cusos2026\" %%d in (apache-maven-3.9.6) do (
    if exist "%%d\bin\mvn.cmd" (
        echo [OK] Maven encontrado en: %%d
        echo [INFO] Copiando a la carpeta 'tools' de este proyecto...
        
        :: Copiar la carpeta completa
        xcopy "%%d" "tools\apache-maven-3.9.6\" /E /I /Y /Q >nul
        
        if !errorlevel! equ 0 (
            echo [OK] Copia completada con exito.
            set "FOUND=1"
        ) else (
            echo [ERROR] Fallo al copiar los archivos.
        )
        goto :fin
    )
)

:fin
if !FOUND! equ 0 (
    echo [ERROR] No se encontro Maven en D:\central\cusos2026\
    echo [INFO] Por favor, copia manualmente la carpeta 'tools' desde 'proyecto-libreria'.
)

echo.
pause