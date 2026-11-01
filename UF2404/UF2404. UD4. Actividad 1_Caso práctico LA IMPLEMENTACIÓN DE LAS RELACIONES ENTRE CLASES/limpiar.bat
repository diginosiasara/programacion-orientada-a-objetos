@echo off
echo ========================================
echo   LIMPIANDO PROYECTO
echo ========================================
echo.

REM Eliminar la carpeta bin con los archivos .class
if exist "bin" (
    rmdir /s /q bin
    echo [OK] Carpeta "bin" eliminada.
) else (
    echo [INFO] No habia carpeta "bin" que eliminar.
)

echo.
pause