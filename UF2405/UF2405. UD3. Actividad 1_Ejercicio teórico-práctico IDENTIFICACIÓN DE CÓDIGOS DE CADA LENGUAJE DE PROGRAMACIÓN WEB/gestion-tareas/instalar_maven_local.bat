@echo off
title Instalador Maven Local - UF2405
color 0E
echo [INFO] Instalando Maven localmente en la carpeta 'tools' (Sin tocar el SO)...
if not exist "tools" mkdir tools
cd tools
powershell -Command "& {Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip' -OutFile 'maven.zip'}" 2>nul
if not exist "maven.zip" ( echo [ERROR] Fallo la descarga. & cd .. & pause & exit /b 1 )
powershell -Command "& {Expand-Archive -Path 'maven.zip' -DestinationPath '.' -Force}"
del maven.zip
cd ..
echo [OK] Maven instalado. Ahora ejecuta 'lanzar_proyecto.bat'
pause