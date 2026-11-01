@echo off
chcp 65001 >nul
title Compilación del Proyecto - UF2405
color 0D

echo ============================================================
echo   COMPILACIÓN DEL PROYECTO GestorPersonas
echo   UF2405 - Arquitectura MVC 3 Capas
echo ============================================================
echo.

call "%~dp0entorno.bat" 2>nul

set PROYECTO_DIR=%~dp0..
set SRC_DIR=%PROYECTO_DIR%\src
set BUILD_DIR=%PROYECTO_DIR%\build
set LIB_DIR=%PROYECTO_DIR%\lib

:: Limpiar build anterior
echo [1/4] Limpiando compilación anterior...
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"
echo       [OK] Directorio build/ creado.
echo.

:: Construir classpath
echo [2/4] Construyendo classpath...
set CLASSPATH=
for %%j in ("%LIB_DIR%\*.jar") do call :add_to_cp %%j
for %%j in ("%CATALINA_HOME%\lib\*.jar") do call :add_to_cp %%j
echo       [OK] Classpath configurado.
echo.

:: Compilar
echo [3/4] Compilando código Java...
echo       Origen: %SRC_DIR%
echo       Destino: %BUILD_DIR%
echo.

javac -encoding UTF-8 -d "%BUILD_DIR%" -cp "%CLASSPATH%" -sourcepath "%SRC_DIR%" "%SRC_DIR%\modelo\*.java" "%SRC_DIR%\dao\*.java" "%SRC_DIR%\controlador\*.java"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo       [ERROR] Fallo en la compilación.
    echo       Revisa los errores arriba.
    pause
    exit /b 1
)
echo       [OK] Compilación exitosa.
echo.

:: Contener clases compiladas
echo [4/4] Verificando clases generadas...
set /p CONTADOR=< nul & set /a CONTADOR=0
for /r "%BUILD_DIR%" %%f in (*.class) do set /a CONTADOR+=1
echo       Clases compiladas: %CONTADOR%
echo.

echo ============================================================
echo   ✓ COMPILACIÓN COMPLETADA
echo ============================================================
echo.
echo Ahora ejecuta: 05_desplegar.bat
echo.
pause
goto :EOF

:add_to_cp
set CLASSPATH=%CLASSPATH%;%1
goto :EOF