@echo off
chcp 65001 >nul
echo ==========================================
echo   LIMPIANDO PROYECTO (BORRANDO .class)
echo ==========================================
echo.

REM Verificar si existe la carpeta bin
if exist "bin" (
    echo [INFO] Eliminando archivos compilados de la carpeta bin...
    
    REM /Q borra en modo silencioso, /F fuerza el borrado de archivos de solo lectura
    del /Q /F "bin\*.class" 2>nul
    
    REM Comprobar si quedaron archivos
    if exist "bin\*.class" (
        echo [ERROR] No se pudieron eliminar todos los archivos .class
        echo Revisa si algun archivo esta en uso por otro programa.
    ) else (
        echo [EXITO] Carpeta bin limpiada correctamente.
    )
) else (
    echo [AVISO] La carpeta bin no existe. No hay nada que limpiar.
)

echo.
echo ==========================================
echo   LIMPIEZA FINALIZADA
echo ==========================================
pause