@echo off
title Comprimir Proyecto UF2405
color 0A

echo ============================================================
echo   COMPRESOR DE PROYECTO (Excluye archivos pesados)
echo ============================================================
echo.

:: 1. Ir a la carpeta del proyecto
cd /d "%~dp0"

:: 2. Eliminar ZIP anterior si existe
if exist "proyecto_uf2405.zip" (
    echo [INFO] Eliminando ZIP anterior...
    del "proyecto_uf2405.zip"
)

:: 3. Comprimir con tar.exe (nativo de Windows 10/11)
echo [INFO] Comprimiendo proyecto...
echo        (Excluye: tools, target, data, .m2)
echo.

tar -a -c -f proyecto_uf2405.zip ^
    --exclude="tools" ^
    --exclude="target" ^
    --exclude="data" ^
    --exclude=".m2" ^
    --exclude=".idea" ^
    --exclude=".vscode" ^
    --exclude="node_modules" ^
    --exclude="*.zip" ^
    --exclude="comprimir_proyecto.bat" ^
    .

:: 4. Verificar resultado
if exist "proyecto_uf2405.zip" (
    echo.
    echo ============================================================
    echo   [OK] ZIP CREADO EXITOSAMENTE
    echo   Archivo: proyecto_uf2405.zip
    echo ============================================================
) else (
    echo.
    echo ============================================================
    echo   [ERROR] No se pudo crear el ZIP
    echo   Intenta ejecutarlo como administrador.
    echo ============================================================
)

echo.
pause