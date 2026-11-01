@echo off
title Instalador Local de Maven - UF2405
color 0E

echo ============================================================
echo   INSTALADOR LOCAL DE MAVEN (Sin afectar el Sistema Operativo)
echo   Unidad Formativa: UF2405
echo ============================================================
echo.

:: 1. Comprobar Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java no esta instalado.
    pause
    exit /b 1
)
echo [OK] Java detectado.

:: 2. Crear carpeta local para Maven
echo [INFO] Creando carpeta local para Maven...
if not exist "tools" mkdir tools
cd tools

:: 3. Intentar descargar Maven desde múltiples URLs
echo [INFO] Descargando Apache Maven 3.9.9...

:: URL principal (versión más reciente)
powershell -Command "& {Invoke-WebRequest -Uri 'https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip' -OutFile 'maven.zip'}" 2>nul

:: Si falla, intentar con URL de archivo
if not exist "maven.zip" (
    echo [INFO] URL principal no disponible, intentando URL alternativa...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip' -OutFile 'maven.zip'}" 2>nul
)

:: Si aún falla, intentar con otra versión
if not exist "maven.zip" (
    echo [INFO] Intentando con otra versión...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip' -OutFile 'maven.zip'}" 2>nul
)

if not exist "maven.zip" (
    echo [ERROR] No se pudo descargar Maven desde ninguna URL.
    echo Verifica tu conexion a internet o descarga manualmente desde:
    echo https://maven.apache.org/download.cgi
    cd ..
    pause
    exit /b 1
)
echo [OK] Maven descargado correctamente.

:: 4. Extraer Maven
echo [INFO] Extrayendo Maven...
powershell -Command "& {Expand-Archive -Path 'maven.zip' -DestinationPath '.' -Force}"
del maven.zip

:: 5. Verificar instalación
dir /b | findstr "apache-maven" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] No se pudo extraer Maven.
    cd ..
    pause
    exit /b 1
)
echo [OK] Maven extraido correctamente.
cd ..

:: 6. Mensaje final
echo.
echo ============================================================
echo   MAVEN INSTALADO LOCALMENTE EN: tools\apache-maven-3.9.9
echo   No se ha modificado el Sistema Operativo.
echo ============================================================
echo.
echo Ahora ejecuta: lanzar_proyecto.bat
echo.
pause