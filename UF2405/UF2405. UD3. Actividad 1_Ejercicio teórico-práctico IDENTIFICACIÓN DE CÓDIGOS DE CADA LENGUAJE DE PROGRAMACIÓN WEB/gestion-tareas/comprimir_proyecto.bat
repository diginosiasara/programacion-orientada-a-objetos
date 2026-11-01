@echo off
title Comprimir Proyecto UF2405 - Max 4MB
color 0A

echo ============================================================
echo   COMPRESOR DE PROYECTO (Maximo 4 MB)
echo   Excluye: tools/, target/, data/, .m2/
echo ============================================================
echo.

:: 1. Definir nombre del ZIP con fecha y hora
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set FECHA=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%
set NOMBRE_ZIP=proyecto_uf2405_%FECHA%.zip

:: 2. Ruta del proyecto (carpeta donde está este .bat)
set RUTA_PROYECTO=%~dp0
set RUTA_ZIP=%RUTA_PROYECTO%%NOMBRE_ZIP%

echo [INFO] Carpeta del proyecto: %RUTA_PROYECTO%
echo [INFO] Nombre del ZIP: %NOMBRE_ZIP%
echo.

:: 3. Eliminar ZIP anterior si existe
if exist "%RUTA_ZIP%" (
    echo [INFO] Eliminando ZIP anterior...
    del "%RUTA_ZIP%"
)

:: 4. Comprimir con PowerShell excluyendo carpetas pesadas
echo [INFO] Comprimiendo proyecto (esto puede tardar 30-60 segundos)...
echo.

powershell -Command "& {
    $ruta = '%RUTA_PROYECTO%'
    $zip = '%RUTA_ZIP%'
    
    # Carpetas a excluir (las que más pesan)
    $excluir = @('tools', 'target', 'data', '.m2', '.idea', '.vscode', 'node_modules', 'bin', 'obj')
    
    # Obtener todos los archivos excepto los de las carpetas excluidas y el propio ZIP
    $archivos = Get-ChildItem -Path $ruta -Recurse -File | Where-Object {
        $incluir = $true
        foreach ($exc in $excluir) {
            if ($_.FullName -like '*\'+$exc+'\*' -or $_.FullName -like '*\'+$exc) {
                $incluir = $false
                break
            }
        }
        # Excluir también el archivo ZIP de salida y archivos .bat de compresión
        if ($_.FullName -like '*.zip' -or $_.Name -like 'comprimir_proyecto*') {
            $incluir = $false
        }
        $incluir
    }
    
    # Comprimir
    Compress-Archive -Path $archivos.FullName -DestinationPath $zip -Force -CompressionLevel Optimal
    
    # Mostrar tamaño final
    $tamaño = (Get-Item $zip).Length
    $tamañoMB = [math]::Round($tamaño / 1MB, 2)
    Write-Host ''
    Write-Host '============================================' -ForegroundColor Green
    Write-Host '  ZIP CREADO EXITOSAMENTE' -ForegroundColor Green
    Write-Host '============================================' -ForegroundColor Green
    Write-Host ''
    Write-Host ('Archivo: ' + $zip) -ForegroundColor Cyan
    Write-Host ('Tamano: ' + $tamañoMB + ' MB') -ForegroundColor Cyan
    
    if ($tamañoMB -gt 4) {
        Write-Host ''
        Write-Host '  [WARNING] El ZIP supera los 4 MB!' -ForegroundColor Yellow
        Write-Host '  Considera eliminar mas archivos o comprimir en partes.' -ForegroundColor Yellow
    } else {
        Write-Host ''
        Write-Host '  [OK] El ZIP cumple con el limite de 4 MB' -ForegroundColor Green
    }
}"

echo.
echo ============================================================
echo   PROCESO COMPLETADO
echo   El ZIP esta en la carpeta del proyecto.
echo ============================================================
echo.

:: 5. Abrir la carpeta para ver el ZIP
explorer /select,"%RUTA_ZIP%"

pause