@echo off
chcp 65001 >nul
title Iniciando Aplicacion Portable
color 0A

echo ============================================================
echo  INICIANDO APLICACION PORTABLE (UF2405)
echo ============================================================

:: Configurar rutas absolutas
set "PROJECT_DIR=%~dp0"
set "JAVA_HOME=%PROJECT_DIR%portable_env\jdk"
set "MAVEN_HOME=%PROJECT_DIR%portable_env\maven"
set "CATALINA_HOME=%PROJECT_DIR%portable_env\tomcat"

:: Rutas absolutas a los ejecutables para evitar conflictos con el PATH de Windows
set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
set "MVN_CMD=%MAVEN_HOME%\bin\mvn.cmd"

echo [1/4] Verificando Java Portable...
if not exist "%JAVA_EXE%" (
    echo [ERROR] No se encuentra Java. Ejecuta primero '01_Descargar_Entorno.bat'
    pause & exit /b 1
)
"%JAVA_EXE%" -version
echo.

echo [2/4] Verificando Maven Portable...
if not exist "%MVN_CMD%" (
    echo [ERROR] No se encuentra Maven. Ejecuta primero '01_Descargar_Entorno.bat'
    pause & exit /b 1
)
call "%MVN_CMD%" -version
echo.

echo [3/4] Compilando el proyecto con Maven...
call "%MVN_CMD%" clean package -DskipTests

if %errorlevel% neq 0 (
    echo [ERROR] Fallo al compilar. Revisa los mensajes de Maven.
    pause & exit /b 1
)

echo [4/4] Copiando aplicacion al servidor Tomcat e iniciando...
if exist "%CATALINA_HOME%\webapps\ROOT" rmdir /s /q "%CATALINA_HOME%\webapps\ROOT"
copy /Y "%PROJECT_DIR%target\demo.war" "%CATALINA_HOME%\webapps\ROOT.war" >nul

echo.
echo [INFO] Iniciando Base de Datos H2 en segundo plano...
start "H2-DB" /min "%JAVA_EXE%" -cp "%PROJECT_DIR%portable_env\h2\h2.jar" org.h2.tools.Server -tcp -tcpAllowOthers -ifNotExists -baseDir "%PROJECT_DIR%portable_env\h2\data"

timeout /t 3 /nobreak >nul

echo [INFO] Iniciando Tomcat...
echo        Espera a que veas "Server startup in [xxxx] ms" en la nueva ventana.
echo.
start "Tomcat-Server" /d "%CATALINA_HOME%\bin" cmd /k call startup.bat

echo.
echo ============================================================
echo  [OK] Aplicacion iniciada.
echo  [OK] Abre tu navegador en: http://localhost:8080/contactos
echo ============================================================
echo.
start http://localhost:8080/contactos
pause