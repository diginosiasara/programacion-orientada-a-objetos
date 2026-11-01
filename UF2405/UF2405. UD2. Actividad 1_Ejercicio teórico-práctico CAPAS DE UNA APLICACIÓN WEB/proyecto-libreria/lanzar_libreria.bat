@echo off
title MODO DEBUG LIBRERIA
color 0C

echo ==========================================
echo   PASO 1: Manteniendo ventana abierta
echo ==========================================
pause

:: 2. Ir a la carpeta del proyecto
cd /d "%~dp0"
echo PASO 2: Ruta actual: %cd%
pause

:: 3. Comprobar Java
echo PASO 3: Comprobando Java...
java -version
pause

:: 4. Comprobar la carpeta tools
echo PASO 4: Comprobando carpeta tools...
dir tools
pause

:: 5. Comprobar Maven específicamente
echo PASO 5: Buscando Maven 3.9.6...
if exist "tools\apache-maven-3.9.6\bin\mvn.cmd" (
    echo [OK] Maven encontrado correctamente.
) else (
    echo [ERROR] Maven NO esta en tools\apache-maven-3.9.6\bin\
    echo [SOLUCION] Copia manualmente la carpeta 'tools' desde el otro proyecto.
)
pause

:: 6. Configurar PATH
echo PASO 6: Configurando PATH...
set "PATH=%cd%\tools\apache-maven-3.9.6\bin;%PATH%"
pause

:: 7. Lanzar el servidor (cmd /k mantiene la ventana abierta si hay error)
echo PASO 7: Lanzando servidor...
cmd /k mvn clean compile tomcat7:run