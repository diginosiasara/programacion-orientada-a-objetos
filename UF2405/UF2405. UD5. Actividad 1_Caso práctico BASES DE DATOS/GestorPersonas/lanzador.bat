@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
title ══════════════════════════════════════════════════════════
color 0B
mode con cols=120 lines=45

:: ══════════════════════════════════════════════════════════
::   LANZADOR CENTRAL MEJORADO - GestorPersonas UF2405
::   Versión 2.0 - Con manejo de rutas con espacios
:: ══════════════════════════════════════════════════════════

:: Configuración inicial - Manejo correcto de rutas con espacios
set "PROYECTO_DIR=%~dp0"
:: Eliminar barra final si existe
if "%PROYECTO_DIR:~-1%"=="\" set "PROYECTO_DIR=%PROYECTO_DIR:~0,-1%"
set "SCRIPTS_DIR=%PROYECTO_DIR%\scripts\"
set "LOGS_DIR=%PROYECTO_DIR%\scripts\logs"
set "APP_NAME=GestorPersonas"
set "APP_URL=http://localhost:8080/%APP_NAME%/"
set "TOMCAT_VERSION=9.0.98"
set "TOMCAT_DIR=%PROYECTO_DIR%\servidor"
set "TOMCAT_HOME=%TOMCAT_DIR%\apache-tomcat-%TOMCAT_VERSION%"

:: Crear carpeta de logs si no existe
if not exist "%LOGS_DIR%" mkdir "%LOGS_DIR%"

:: Timestamp para logs
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set "FECHA=%%c-%%b-%%a"
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set "HORA=%%a%%b"
set "TIMESTAMP=%FECHA%_%HORA%"
set "LOG_FILE=%LOGS_DIR%\lanzador_%TIMESTAMP%.log"

:: Cargar configuración personalizada si existe
if exist "%PROYECTO_DIR%\config.bat" call "%PROYECTO_DIR%\config.bat"

:MENU_PRINCIPAL
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║                                                                  ║
echo   ║       ██████╗ ███████╗███████╗████████╗ ██████╗ ██████╗         ║
echo   ║      ██╔════╝ ██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗        ║
echo   ║      ██║  ███╗█████╗  ███████╗   ██║   ██║   ██║██████╔╝        ║
echo   ║      ██║   ██║██╔══╝  ╚════██║   ██║   ██║   ██║██╔══██╗        ║
echo   ║      ╚██████╔╝███████╗███████║   ██║   ╚██████╝██║  ██║        ║
echo   ║       ╚═════╝ ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ═╝        ║
echo   ║                                                                  ║
echo   ║              PANEL DE CONTROL - UF2405 v2.0                      ║
echo   ║              Modelo de programación web y BD                     ║
echo   ║                                                                  
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   Fecha: %DATE% - Hora: %TIME%
echo   Proyecto: "%PROYECTO_DIR%"
echo.

:: Mostrar estado rápido
echo   ┌─ ESTADO RÁPIDO ─────────────────────────────────────────────────┐
call :VER_ESTADO_RAPIDO
echo   └─────────────────────────────────────────────────────────────────┘
echo.
echo   ┌──────────────────────────────────────────────────────────────────┐
echo   │  [1]  🚀 INICIAR APLICACIÓN (Tomcat + Navegador)                 │
echo   │  [2]   DETENER APLICACIÓN                                      │
echo   │  [3]  🔄 REINICIAR APLICACIÓN                                    │
echo   │  [4]  📦 COMPILAR PROYECTO                                       │
echo   │  [5]   DESPLEGAR EN TOMCAT                                     │
echo   │  [6]  🗄️  ABRIR CONSOLA MySQL                                    │
echo   │  [7]  🔍 VER ESTADO DETALLADO DE SERVICIOS                       │
echo   │  [8]  📋 VER LOGS DE EJECUCIÓN                                   │
echo   │  [9]  🌐 ABRIR NAVEGADOR (si está corriendo)                     │
echo   │  [10] ⚙️  CONFIGURAR ENTORNO                                     │
echo   │  [11] 🧹 LIMPIAR PROYECTO (borrar compilados)                    │
echo   │  [12] ℹ️  INFORMACIÓN DEL SISTEMA                                │
echo   │  [13] 🔧 ASISTENTE DE CONFIGURACIÓN INICIAL                      │
echo   │  [0]   SALIR                                                   │
echo   └──────────────────────────────────────────────────────────────────┘
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
set /p "OPCION=   Seleccione una opción [0-13]: "

:: Validar opción
if "%OPCION%"=="" goto :MENU_PRINCIPAL
if "%OPCION%"=="1" goto :INICIAR
if "%OPCION%"=="2" goto :DETENER
if "%OPCION%"=="3" goto :REINICIAR
if "%OPCION%"=="4" goto :COMPILAR
if "%OPCION%"=="5" goto :DESPLEGAR
if "%OPCION%"=="6" goto :MYSQL_CONSOLE
if "%OPCION%"=="7" goto :ESTADO_DETALLADO
if "%OPCION%"=="8" goto :VER_LOGS
if "%OPCION%"=="9" goto :ABRIR_NAV
if "%OPCION%"=="10" goto :CONFIGURAR
if "%OPCION%"=="11" goto :LIMPIAR
if "%OPCION%"=="12" goto :INFO_SISTEMA
if "%OPCION%"=="13" goto :ASISTENTE
if "%OPCION%"=="0" goto :SALIR

echo.
echo   [!] Opción no válida. Intente de nuevo.
timeout /t 2 >nul
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: VER ESTADO RÁPIDO
:: ══════════════════════════════════════════════════════════
:VER_ESTADO_RAPIDO
:: Java
set "JAVA_OK=✗"
if defined JAVA_HOME (
    if exist "!JAVA_HOME!\bin\java.exe" set "JAVA_OK=✓"
)
:: Tomcat
set "TOMCAT_OK=✗"
if exist "%TOMCAT_HOME%\bin\startup.bat" set "TOMCAT_OK=✓"
:: MySQL
set "MYSQL_OK=✗"
where mysql >nul 2>&1 && set "MYSQL_OK=✓"
:: Proyecto
set "PROY_OK=✗"
if exist "%TOMCAT_HOME%\webapps\%APP_NAME%\index.jsp" set "PROY_OK=✓"

echo   │  Java: %JAVA_OK%  │  Tomcat: %TOMCAT_OK%  │  MySQL: %MYSQL_OK%  │  App: %PROY_OK%  │
goto :EOF

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: ASISTENTE DE CONFIGURACIÓN INICIAL
:: ═════════════════════════════════════════════════════════
:ASISTENTE
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║         🔧 ASISTENTE DE CONFIGURACIÓN INICIAL                    ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   Este asistente le ayudará a configurar el entorno correctamente.
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

:: Paso 1: Java
echo   [PASO 1/3] Configuración de Java
echo   ─────────────────────────────────────────────────────────────────
if defined JAVA_HOME (
    if exist "%JAVA_HOME%\bin\java.exe" (
        echo   [OK] Java encontrado en: %JAVA_HOME%
        for /f "tokens=3" %%v in ('"%JAVA_HOME%\bin\java.exe" -version 2^>^&1 ^| findstr /i "version"') do (
            echo   [OK] Versión: %%~v
        )
    ) else (
        echo   [ERROR] JAVA_HOME definido pero java.exe no encontrado
        goto :BUSCAR_JAVA
    )
) else (
    echo   [!] JAVA_HOME no está definido
    goto :BUSCAR_JAVA
)
goto :PASO2

:BUSCAR_JAVA
echo   Buscando Java en el sistema...
set "JAVA_ENCONTRADO=0"

:: Buscar en rutas comunes
for %%P in (
    "C:\Program Files\Java\jdk-*"
    "C:\Program Files\Java\jre-*"
    "C:\Program Files\Eclipse Adoptium\jdk-*"
    "C:\Program Files\Microsoft\jdk-*"
    "C:\Program Files (x86)\Java\jdk-*"
) do (
    for /d %%D in (%%P) do (
        if exist "%%D\bin\java.exe" (
            set "JAVA_HOME=%%D"
            set "JAVA_ENCONTRADO=1"
            echo   [OK] Java encontrado en: %%D
            goto :JAVA_ENCONTRADO
        )
    )
)

:JAVA_ENCONTRADO
if "!JAVA_ENCONTRADO!"=="0" (
    echo.
    echo   [ERROR] No se encontró Java en el sistema.
    echo.
    echo   Por favor, descargue e instale JDK desde:
    echo   https://adoptium.net/
    echo.
    echo   Después de instalar, configure JAVA_HOME manualmente:
    echo   1. Panel de Control → Sistema → Configuración avanzada
    echo   2. Variables de entorno → Nueva → JAVA_HOME
    echo   3. Valor: C:\Program Files\Java\jdk-XX
    echo.
    pause
    goto :MENU_PRINCIPAL
)

:PASO2
echo.
echo   [PASO 2/3] Configuración de Tomcat
echo   ─────────────────────────────────────────────────────────────────
if exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo   [OK] Tomcat encontrado en: %TOMCAT_HOME%
) else (
    echo   [!] Tomcat no encontrado en: %TOMCAT_HOME%
    echo.
    echo   ¿Desea descargar e instalar Tomcat automáticamente? (S/N)
    set /p "INSTALAR_TOMCAT="
    if /i "!INSTALAR_TOMCAT!"=="S" (
        if exist "%SCRIPTS_DIR%01_instalar_tomcat.bat" (
            call "%SCRIPTS_DIR%01_instalar_tomcat.bat"
        ) else (
            echo   [ERROR] Script de instalación no encontrado.
            echo   Descargue Tomcat manualmente desde: https://tomcat.apache.org/
            pause
        )
    )
)

:PASO3
echo.
echo   [PASO 3/3] Configuración de MySQL
echo   ─────────────────────────────────────────────────────────────────
where mysql >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo   [OK] MySQL encontrado en PATH
) else (
    echo   [!] MySQL no encontrado en PATH
    echo.
    echo   Buscando MySQL en rutas comunes...
    set "MYSQL_ENCONTRADO=0"
    for %%P in (
        "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
        "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
        "C:\xampp\mysql\bin\mysql.exe"
        "C:\wamp64\bin\mysql\mysql8.0.31\bin\mysql.exe"
    ) do (
        if exist %%P (
            echo   [OK] MySQL encontrado en: %%~P
            set "MYSQL_ENCONTRADO=1"
            set "MYSQL_PATH=%%~P"
        )
    )
    
    if "!MYSQL_ENCONTRADO!"=="0" (
        echo   [AVISO] MySQL no encontrado. Asegúrese de tener MySQL instalado.
    )
)

echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   ✓ Configuración completada
echo.
echo   Guarde esta configuración para futuras sesiones? (S/N)
set /p "GUARDAR="
if /i "%GUARDAR%"=="S" (
    (
        echo @echo off
        echo set "JAVA_HOME=%JAVA_HOME%"
        echo set "TOMCAT_HOME=%TOMCAT_HOME%"
        if defined MYSQL_PATH echo set "MYSQL_PATH=%MYSQL_PATH%"
    ) > "%PROYECTO_DIR%\config.bat"
    echo   [OK] Configuración guardada en config.bat
)

echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: INICIAR APLICACIÓN
:: ══════════════════════════════════════════════════════════
:INICIAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🚀 INICIANDO APLICACIÓN                             ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   [%TIME%] Iniciando proceso... >> "%LOG_FILE%"

:: Verificar Java
if not defined JAVA_HOME (
    echo   [ERROR] JAVA_HOME no está definido.
    echo   [INFO] Ejecute la opción [13] Asistente de Configuración
    echo   [%TIME%] ERROR: JAVA_HOME no definido >> "%LOG_FILE%"
    pause
    goto :MENU_PRINCIPAL
)

:: Verificar que Tomcat existe
if not exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo   [ERROR] Tomcat no encontrado en: "%TOMCAT_HOME%"
    echo   [INFO] Ejecute la opción [13] Asistente de Configuración
    echo   [%TIME%] ERROR: Tomcat no encontrado >> "%LOG_FILE%"
    pause
    goto :MENU_PRINCIPAL
)

:: Verificar que el proyecto está desplegado
if not exist "%TOMCAT_HOME%\webapps\%APP_NAME%\index.jsp" (
    echo   [AVISO] Proyecto no desplegado. Desplegando ahora...
    call "%SCRIPTS_DIR%05_desplegar.bat"
)

:: Verificar si Tomcat ya está corriendo
tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find "java.exe" >NUL
if %ERRORLEVEL% EQU 0 (
    echo   [INFO] Tomcat ya está en ejecución.
    echo   [INFO] Abriendo navegador directamente...
    goto :ABRIR_NAV_DIRECTO
)

:: Configurar variables de entorno para esta sesión
set "PATH=%JAVA_HOME%\bin;%TOMCAT_HOME%\bin;%PATH%"
set "CATALINA_HOME=%TOMCAT_HOME%"

:: Iniciar Tomcat
echo   [1/3] Iniciando Apache Tomcat...
echo   [%TIME%] Iniciando Tomcat desde: "%TOMCAT_HOME%" >> "%LOG_FILE%"
start "Tomcat - %APP_NAME%" /min cmd /c ""%TOMCAT_HOME%\bin\startup.bat""

:: Esperar a que Tomcat esté listo
echo   [2/3] Esperando a que Tomcat esté listo...
set /a INTENTOS=0
:ESPERAR_TOMCAT
timeout /t 2 /nobreak >nul
set /a INTENTOS+=1

:: Verificar si Tomcat responde
powershell -Command "try { $r = Invoke-WebRequest -Uri '%APP_URL%' -TimeoutSec 2 -UseBasicParsing -ErrorAction Stop; exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto :TOMCAT_LISTO

if %INTENTOS% GEQ 30 (
    echo   [ERROR] Tomcat no respondió después de 60 segundos.
    echo   [INFO] Revise los logs en: "%TOMCAT_HOME%\logs\"
    echo   [%TIME%] ERROR: Timeout iniciando Tomcat >> "%LOG_FILE%"
    pause
    goto :MENU_PRINCIPAL
)

echo   [INFO] Esperando... (%INTENTOS%/30)
goto :ESPERAR_TOMCAT

:TOMCAT_LISTO
echo   [OK] Tomcat iniciado correctamente.
echo   [%TIME%] Tomcat iniciado OK >> "%LOG_FILE%"

:: Abrir navegador
echo   [3/3] Abriendo navegador en: %APP_URL%
start "" "%APP_URL%"
echo   [%TIME%] Navegador abierto >> "%LOG_FILE%"

echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   ✓ APLICACIÓN INICIADA CORRECTAMENTE
echo   URL: %APP_URL%
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo   Presione cualquier tecla para volver al menú...
pause >nul
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: DETENER APLICACIÓN
:: ══════════════════════════════════════════════════════════
:DETENER
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🛑 DETENIENDO APLICACIÓN                            ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   [%TIME%] Deteniendo aplicación... >> "%LOG_FILE%"

:: Verificar si hay procesos Java
tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find "java.exe" >NUL
if %ERRORLEVEL% NEQ 0 (
    echo   [INFO] No hay procesos de Tomcat en ejecución.
    pause
    goto :MENU_PRINCIPAL
)

:: Intentar shutdown elegante
echo   [1/2] Enviando señal de apagado a Tomcat...
if exist "%TOMCAT_HOME%\bin\shutdown.bat" (
    set "CATALINA_HOME=%TOMCAT_HOME%"
    call "%TOMCAT_HOME%\bin\shutdown.bat" >nul 2>&1
)
timeout /t 3 /nobreak >nul

:: Forzar cierre si es necesario
echo   [2/2] Verificando procesos Java restantes...
taskkill /f /im java.exe >nul 2>&1
taskkill /f /im javaw.exe >nul 2>&1

echo   [%TIME%] Aplicación detenida >> "%LOG_FILE%"
echo.
echo   ✓ APLICACIÓN DETENIDA
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: REINICIAR APLICACIÓN
:: ═════════════════════════════════════════════════════════
:REINICIAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🔄 REINICIANDO APLICACIÓN                           ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
call :DETENER_SILENCIOSO
timeout /t 2 /nobreak >nul
call :INICIAR_SILENCIOSO
goto :MENU_PRINCIPAL

:DETENER_SILENCIOSO
if exist "%TOMCAT_HOME%\bin\shutdown.bat" (
    set "CATALINA_HOME=%TOMCAT_HOME%"
    call "%TOMCAT_HOME%\bin\shutdown.bat" >nul 2>&1
)
taskkill /f /im java.exe >nul 2>&1
taskkill /f /im javaw.exe >nul 2>&1
goto :EOF

:INICIAR_SILENCIOSO
if not exist "%TOMCAT_HOME%\bin\startup.bat" goto :EOF
set "PATH=%JAVA_HOME%\bin;%TOMCAT_HOME%\bin;%PATH%"
set "CATALINA_HOME=%TOMCAT_HOME%"
start "Tomcat" /min cmd /c ""%TOMCAT_HOME%\bin\startup.bat""
timeout /t 10 /nobreak >nul
start "" "%APP_URL%"
goto :EOF

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: COMPILAR (MEJORADO)
:: ══════════════════════════════════════════════════════════
:COMPILAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              📦 COMPILANDO PROYECTO                              ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   [%TIME%] Iniciando compilación >> "%LOG_FILE%"

:: Verificar Java
if not defined JAVA_HOME (
    echo   [ERROR] JAVA_HOME no está definido.
    echo   [INFO] Ejecute la opción [13] Asistente de Configuración
    pause
    goto :MENU_PRINCIPAL
)

if not exist "%JAVA_HOME%\bin\javac.exe" (
    echo   [ERROR] javac.exe no encontrado en: "%JAVA_HOME%\bin"
    pause
    goto :MENU_PRINCIPAL
)

set "SRC_DIR=%PROYECTO_DIR%\src"
set "BUILD_DIR=%PROYECTO_DIR%\build"
set "LIB_DIR=%PROYECTO_DIR%\lib"

:: Verificar que existe el código fuente
if not exist "%SRC_DIR%" (
    echo   [ERROR] Carpeta src no encontrada en: "%SRC_DIR%"
    pause
    goto :MENU_PRINCIPAL
)

:: Limpiar build anterior
echo   [1/4] Limpiando compilación anterior...
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"
echo   [OK] Directorio build/ creado.
echo.

:: Construir classpath con manejo de rutas con espacios
echo   [2/4] Construyendo classpath...
set "CLASSPATH="

:: Añadir librerías del proyecto
if exist "%LIB_DIR%" (
    for %%j in ("%LIB_DIR%\*.jar") do (
        set "CLASSPATH=!CLASSPATH!;%%j"
    )
)

:: Añadir librerías de Tomcat
if exist "%TOMCAT_HOME%\lib" (
    for %%j in ("%TOMCAT_HOME%\lib\*.jar") do (
        set "CLASSPATH=!CLASSPATH!;%%j"
    )
)

:: Eliminar punto y coma inicial si existe
if "!CLASSPATH:~0,1!"==";" set "CLASSPATH=!CLASSPATH:~1!"

echo   [OK] Classpath configurado.
echo.

:: Compilar con manejo de rutas con espacios
echo   [3/4] Compilando código Java...
echo   Origen: "%SRC_DIR%"
echo   Destino: "%BUILD_DIR%"
echo.

:: Usar @file para evitar problemas con rutas largas
echo.>"%TEMP%\compile_files.txt"
for /r "%SRC_DIR%" %%f in (*.java) do (
    echo %%f>>"%TEMP%\compile_files.txt"
)

"%JAVA_HOME%\bin\javac.exe" -encoding UTF-8 -d "%BUILD_DIR%" -cp "%CLASSPATH%" @"%TEMP%\compile_files.txt"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo   [ERROR] Fallo en la compilación.
    echo   [INFO] Revise los errores arriba.
    echo   [%TIME%] ERROR: Fallo en compilación >> "%LOG_FILE%"
    del "%TEMP%\compile_files.txt"
    pause
    goto :MENU_PRINCIPAL
)

del "%TEMP%\compile_files.txt"
echo   [OK] Compilación exitosa.
echo.

:: Contener clases compiladas
echo   [4/4] Verificando clases generadas...
set /a CONTADOR=0
for /r "%BUILD_DIR%" %%f in (*.class) do set /a CONTADOR+=1
echo   Clases compiladas: %CONTADOR%
echo   [%TIME%] Compilación exitosa - %CONTADOR% clases >> "%LOG_FILE%"
echo.

echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   ✓ COMPILACIÓN COMPLETADA
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: DESPLEGAR (MEJORADO)
:: ══════════════════════════════════════════════════════════
:DESPLEGAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo                 📤 DESPLEGANDO EN TOMCAT                            ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   [%TIME%] Iniciando despliegue >> "%LOG_FILE%"

:: Verificar Tomcat
if not exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo   [ERROR] Tomcat no encontrado en: "%TOMCAT_HOME%"
    echo   [INFO] Ejecute la opción [13] Asistente de Configuración
    pause
    goto :MENU_PRINCIPAL
)

set "BUILD_DIR=%PROYECTO_DIR%\build"
set "WEB_DIR=%PROYECTO_DIR%\web"
set "LIB_DIR=%PROYECTO_DIR%\lib"
set "DEPLOY_DIR=%TOMCAT_HOME%\webapps\%APP_NAME%"

echo   [1/5] Deteniendo Tomcat si está activo...
set "CATALINA_HOME=%TOMCAT_HOME%"
call "%TOMCAT_HOME%\bin\shutdown.bat" >nul 2>&1
timeout /t 2 /nobreak >nul
echo   [OK]
echo.

echo   [2/5] Limpiando despliegue anterior...
if exist "%DEPLOY_DIR%" rmdir /s /q "%DEPLOY_DIR%"
echo   [OK]
echo.

echo   [3/5] Creando estructura WAR...
mkdir "%DEPLOY_DIR%"
mkdir "%DEPLOY_DIR%\WEB-INF"
mkdir "%DEPLOY_DIR%\WEB-INF\classes"
mkdir "%DEPLOY_DIR%\WEB-INF\lib"
echo   [OK] Estructura creada.
echo.

echo   [4/5] Copiando archivos del proyecto...
:: Copiar recursos web (JSP, CSS, JS)
xcopy /s /e /y /q "%WEB_DIR%\*" "%DEPLOY_DIR%\" >nul
:: Copiar clases compiladas
if exist "%BUILD_DIR%" (
    xcopy /s /e /y /q "%BUILD_DIR%\*" "%DEPLOY_DIR%\WEB-INF\classes\" >nul
) else (
    echo   [AVISO] Carpeta build/ no encontrada. Compile primero.
)
:: Copiar librerías JDBC
if exist "%LIB_DIR%\*.jar" (
    xcopy /s /e /y /q "%LIB_DIR%\*.jar" "%DEPLOY_DIR%\WEB-INF\lib\" >nul
) else (
    echo   [AVISO] No se encontraron archivos .jar en lib/
)
echo   [OK] Archivos copiados.
echo.

echo   [5/5] Verificando despliegue...
set "ERROR_DESPLEGUE=0"

if not exist "%DEPLOY_DIR%\index.jsp" (
    echo   [ERROR] Falta index.jsp
    set "ERROR_DESPLEGUE=1"
)

if not exist "%DEPLOY_DIR%\WEB-INF\classes\controlador\PersonaServlet.class" (
    if not exist "%DEPLOY_DIR%\WEB-INF\classes\*.class" (
        echo   [ERROR] No se encontraron clases compiladas
        set "ERROR_DESPLEGUE=1"
    )
)

if "%ERROR_DESPLEGUE%"=="1" (
    echo   [%TIME%] ERROR: Despliegue incompleto >> "%LOG_FILE%"
    pause
    goto :MENU_PRINCIPAL
)

echo   [OK] Despliegue verificado.
echo   [%TIME%] Despliegue exitoso >> "%LOG_FILE%"
echo.

echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   ✓ PROYECTO DESPLEGADO EN TOMCAT
echo   URL: %APP_URL%
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: CONSOLA MySQL (MEJORADO)
:: ═════════════════════════════════════════════════════════
:MYSQL_CONSOLE
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🗄️  CONSOLA MySQL                                   ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.

:: Buscar MySQL
set "MYSQL_PATH="
where mysql >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "MYSQL_PATH=mysql"
    goto :ENCONTRADO_MYSQL
)

:: Rutas comunes de MySQL
for %%P in (
    "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
    "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
    "C:\Program Files (x86)\MySQL\MySQL Server 8.0\bin\mysql.exe"
    "C:\xampp\mysql\bin\mysql.exe"
    "C:\wamp64\bin\mysql\mysql8.0.31\bin\mysql.exe"
) do (
    if exist %%P (
        set "MYSQL_PATH=%%~P"
        goto :ENCONTRADO_MYSQL
    )
)

echo   [ERROR] MySQL no encontrado en el sistema.
echo.
echo   Opciones:
echo   1. Instale MySQL y añada su ruta al PATH
echo   2. Configure la ruta manualmente en config.bat
echo   3. Use la opción [13] Asistente de Configuración
echo.
pause
goto :MENU_PRINCIPAL

:ENCONTRADO_MYSQL
echo   [OK] MySQL encontrado: %MYSQL_PATH%
echo.
echo   Conectando a la base de datos 'gestor_personas'...
echo   (Introduzca la contraseña cuando se solicite)
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
"%MYSQL_PATH%" -u root -p gestor_personas
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: ESTADO DETALLADO
:: ══════════════════════════════════════════════════════════
:ESTADO_DETALLADO
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║               ESTADO DETALLADO DE SERVICIOS                    ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

:: Verificar Java
echo   [JAVA]
if defined JAVA_HOME (
    echo      JAVA_HOME: "%JAVA_HOME%"
    if exist "%JAVA_HOME%\bin\java.exe" (
        echo      Estado:    ✓ INSTALADO
        for /f "tokens=3" %%v in ('"%JAVA_HOME%\bin\java.exe" -version 2^>^&1 ^| findstr /i "version"') do (
            echo      Versión:   %%~v
        )
    ) else (
        echo      Estado:    ✗ JAVA.EXE NO ENCONTRADO
    )
) else (
    echo      Estado:    ✗ JAVA_HOME NO DEFINIDO
    echo      [INFO] Use la opción [13] para configurar
)
echo.

:: Verificar Tomcat
echo   [TOMCAT]
if exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo      Ubicación: "%TOMCAT_HOME%"
    echo      Estado:    ✓ INSTALADO
    
    :: Verificar si está corriendo
    tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find "java.exe" >NUL
    if !ERRORLEVEL! EQU 0 (
        echo      Proceso:   ● EN EJECUCIÓN
    ) else (
        echo      Proceso:   ○ DETENIDO
    )
) else (
    echo      Estado:    ✗ NO INSTALADO
    echo      [INFO] Use la opción [13] para instalar
)
echo.

:: Verificar MySQL
echo   [MySQL]
set "MYSQL_FOUND=0"
for %%P in (
    "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
    "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
    "C:\xampp\mysql\bin\mysql.exe"
) do (
    if exist %%P (
        echo      Ubicación: %%~P
        echo      Estado:    ✓ INSTALADO
        set "MYSQL_FOUND=1"
    )
)
if "!MYSQL_FOUND!"=="0" (
    where mysql >nul 2>&1
    if !ERRORLEVEL! EQU 0 (
        echo      Estado:    ✓ EN PATH
    ) else (
        echo      Estado:    ? NO DETECTADO
    )
)

:: Verificar si MySQL está corriendo (puerto 3306)
netstat -an | find ":3306" | find "LISTENING" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo      Puerto:    ● 3306 ACTIVO
) else (
    echo      Puerto:    ○ 3306 INACTIVO
)
echo.

:: Verificar proyecto desplegado
echo   [PROYECTO %APP_NAME%]
if exist "%TOMCAT_HOME%\webapps\%APP_NAME%\index.jsp" (
    echo      Estado:    ✓ DESPLEGADO
) else (
    echo      Estado:    ✗ NO DESPLEGADO
)
echo.

echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: VER LOGS
:: ══════════════════════════════════════════════════════════
:VER_LOGS
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              📋 LOGS DE EJECUCIÓN                                ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.

if not exist "%LOGS_DIR%\*.log" (
    echo   [INFO] No hay logs disponibles aún.
    pause
    goto :MENU_PRINCIPAL
)

echo   Logs disponibles en: "%LOGS_DIR%"
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
dir /o-d /b "%LOGS_DIR%\*.log" 2>nul
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo   [1] Ver último log
echo   [2] Abrir carpeta de logs
echo   [3] Ver logs de Tomcat
echo   [0] Volver al menú
echo.
set /p "LOG_OP=   Opción: "

if "%LOG_OP%"=="1" (
    for /f "delims=" %%f in ('dir /o-d /b "%LOGS_DIR%\*.log" 2^>nul') do (
        type "%LOGS_DIR%\%%f"
        goto :FIN_LOG
    )
    :FIN_LOG
    pause
    goto :VER_LOGS
)
if "%LOG_OP%"=="2" (
    explorer "%LOGS_DIR%"
    goto :VER_LOGS
)
if "%LOG_OP%"=="3" (
    if exist "%TOMCAT_HOME%\logs" (
        explorer "%TOMCAT_HOME%\logs"
    ) else (
        echo   [ERROR] Carpeta de logs de Tomcat no encontrada.
        pause
    )
    goto :VER_LOGS
)
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: ABRIR NAVEGADOR
:: ═════════════════════════════════════════════════════════
:ABRIR_NAV
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🌐 ABRIENDO NAVEGADOR                               
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.

:: Verificar si Tomcat está corriendo
tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find "java.exe" >NUL
if %ERRORLEVEL% NEQ 0 (
    echo   [AVISO] Tomcat no está en ejecución.
    echo   ¿Desea iniciarlo ahora? (S/N)
    set /p "INICIAR="
    if /i "!INICIAR!"=="S" (
        call :INICIAR_SILENCIOSO
        timeout /t 5 /nobreak >nul
    ) else (
        goto :MENU_PRINCIPAL
    )
)

:ABRIR_NAV_DIRECTO
echo   Abriendo: %APP_URL%
start "" "%APP_URL%"
echo.
echo   ✓ Navegador abierto.
timeout /t 2 >nul
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: CONFIGURAR ENTORNO
:: ══════════════════════════════════════════════════════════
:CONFIGURAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              ⚙️  CONFIGURACIÓN DEL ENTORNO                       ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.

if exist "%SCRIPTS_DIR%02_configurar_entorno.bat" (
    call "%SCRIPTS_DIR%02_configurar_entorno.bat"
) else (
    echo   [INFO] Use la opción [13] Asistente de Configuración
    pause
)
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: LIMPIAR PROYECTO
:: ══════════════════════════════════════════════════════════
:LIMPIAR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              🧹 LIMPIAR PROYECTO                                 ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   Esto eliminará:
echo     - Carpeta build/ (archivos compilados)
echo     - Despliegue en Tomcat
echo.
set /p "CONFIRM=   ¿Está seguro? (S/N): "
if /i not "%CONFIRM%"=="S" goto :MENU_PRINCIPAL

echo.
echo   [1/2] Eliminando carpeta build/...
if exist "%PROYECTO_DIR%\build" (
    rmdir /s /q "%PROYECTO_DIR%\build"
    echo   [OK] Carpeta build/ eliminada.
) else (
    echo   [INFO] No existe carpeta build/.
)

echo   [2/2] Eliminando despliegue en Tomcat...
if exist "%TOMCAT_HOME%\webapps\%APP_NAME%" (
    rmdir /s /q "%TOMCAT_HOME%\webapps\%APP_NAME%"
    echo   [OK] Despliegue eliminado.
) else (
    echo   [INFO] No hay despliegue activo.
)

echo.
echo   ✓ PROYECTO LIMPIADO
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: INFORMACIÓN DEL SISTEMA
:: ══════════════════════════════════════════════════════════
:INFO_SISTEMA
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║              ℹ️  INFORMACIÓN DEL SISTEMA                         ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   INFORMACIÓN GENERAL
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo   Proyecto:       %APP_NAME%
echo   UF:             UF2405 - Modelo programación web y BD
echo   Arquitectura:   MVC 3 capas (Presentación/Lógica/Datos)
echo   Tecnologías:    Java EE + JDBC + MySQL + Servlets + JSP
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   RUTAS DEL PROYECTO
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo   Directorio raíz:    "%PROYECTO_DIR%"
echo   Scripts:            "%SCRIPTS_DIR%"
echo   Tomcat:             "%TOMCAT_HOME%"
echo   Código fuente:      "%PROYECTO_DIR%\src"
echo   Recursos web:       "%PROYECTO_DIR%\web"
echo   Logs:               "%LOGS_DIR%"
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   VARIABLES DE ENTORNO
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo   JAVA_HOME:        %JAVA_HOME%
echo   CATALINA_HOME:    %CATALINA_HOME%
echo.
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   ESTRUCTURA DEL PROYECTO
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
if exist "%PROYECTO_DIR%\src" (
    tree /f /a "%PROYECTO_DIR%\src" 2>nul | findstr /v ".class"
) else (
    echo   [INFO] Carpeta src no encontrada
)
echo.
pause
goto :MENU_PRINCIPAL

:: ══════════════════════════════════════════════════════════
::   FUNCIÓN: SALIR
:: ══════════════════════════════════════════════════════════
:SALIR
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║                                                                  
echo   ║                    🚪 CERRANDO PANEL                             ║
echo   ║                                                                  ║
echo   ║          Gracias por usar el Lanzador UF2405 v2.0                ║
echo   ║                                                                  ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.
echo   [%TIME%] Sesión finalizada por el usuario >> "%LOG_FILE%"
echo.
echo   Nota: Tomcat seguirá ejecutándose en segundo plano si fue iniciado.
echo   Para detenerlo, use la opción [2] antes de salir.
echo.
timeout /t 3 >nul
endlocal
exit /b 0