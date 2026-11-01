@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Servidor UF2405 - PHP + MariaDB
color 0A
cls

:: ==========================================================
::  Todo se ejecuta con RUTAS RELATIVAS desde la carpeta de este .bat.
::  Ojo: mysqld resuelve --datadir relativo a tools\mariadb, no a esta carpeta.
::  Asi no importan los acentos, los espacios ni donde muevas el proyecto.
:: ==========================================================
cd /d "%~dp0"

set "PUERTO_WEB=8080"
set "PUERTO_DB=3306"
set "DB_NOMBRE=demo_uf2405"
set "LOGDB=mariadb_arranque.log"
set "MYSQLADMIN=tools\mariadb\bin\mysqladmin.exe --no-defaults -u root --protocol=tcp -h 127.0.0.1 -P %PUERTO_DB%"
set "MYSQL=tools\mariadb\bin\mysql.exe --no-defaults --default-character-set=utf8mb4 -u root --protocol=tcp -h 127.0.0.1 -P %PUERTO_DB%"
set "DB_PROPIA=0"

echo ==========================================================
echo   INICIANDO ENTORNO UF2405  -  PHP + MariaDB portable
echo ==========================================================
echo.

:: ---------- 1. VERIFICACIONES ----------
if not exist "tools\php\php.exe" goto falta_php
if not exist "tools\mariadb\bin\mysqld.exe" goto falta_mariadb
if not exist "tools\mariadb\data\mysql" goto falta_datos

:: ---------- 2. MARIADB ----------
echo [1/3] Comprobando MariaDB...
call :db_responde
if not errorlevel 1 goto db_ya_activa

echo [INFO] Arrancando MariaDB en el puerto %PUERTO_DB%...
if exist "%LOGDB%" del "%LOGDB%" >nul 2>&1
start "MariaDB-UF2405" /MIN cmd /c "tools\mariadb\bin\mysqld.exe --no-defaults --console --datadir=data --port=%PUERTO_DB% --bind-address=127.0.0.1 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 2>%LOGDB%"

set /a INTENTOS=0
:espera_db
call :db_responde
if not errorlevel 1 goto db_arrancada
set /a INTENTOS+=1
if %INTENTOS% GEQ 30 goto db_fallo
timeout /t 1 /nobreak >nul
goto espera_db

:db_arrancada
set "DB_PROPIA=1"
echo [OK] MariaDB arrancado correctamente.
goto db_crear

:db_ya_activa
echo [OK] Ya hay un servidor de base de datos activo en el puerto %PUERTO_DB%.

:: ---------- 3. BASE DE DATOS (se crea sola si no existe) ----------
:db_crear
echo.
echo [2/3] Comprobando la base de datos '%DB_NOMBRE%'...
%MYSQL% -N -e "SHOW DATABASES LIKE '%DB_NOMBRE%';" 2>nul | findstr /i /c:"%DB_NOMBRE%" >nul
if not errorlevel 1 goto db_lista

if not exist "sql\schema.sql" goto falta_schema
echo [INFO] No existe. Importando sql\schema.sql ...
%MYSQL% < "sql\schema.sql"
if errorlevel 1 goto schema_fallo
echo [OK] Base de datos creada e importada.
goto db_lista

:db_lista
echo [OK] Base de datos lista.

:: ---------- 4. SERVIDOR WEB PHP ----------
echo.
echo [3/3] Iniciando servidor web PHP...
netstat -ano | findstr /R /C:":%PUERTO_WEB% .*LISTENING" >nul
if not errorlevel 1 goto puerto_web_ocupado

echo.
echo ==========================================================
echo   SERVIDOR ACTIVO
echo   - Web:  http://localhost:%PUERTO_WEB%
echo   - BD:   127.0.0.1:%PUERTO_DB%  usuario root, sin contrasena
echo.
echo   Para detener: cierra esta ventana o pulsa CTRL + C
echo ==========================================================
echo.

start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:%PUERTO_WEB%"

tools\php\php.exe -c tools\php\php.ini -S localhost:%PUERTO_WEB% -t public

:: ---------- 5. APAGADO ----------
echo.
echo ==========================================================
echo   DETENIENDO SERVIDORES...
echo ==========================================================
if "%DB_PROPIA%"=="1" (
    %MYSQLADMIN% shutdown >nul 2>&1
    echo [OK] MariaDB detenido.
) else (
    echo [INFO] MariaDB no lo arranco este script, se deja como estaba.
)
echo.
pause
exit /b 0


:: ==========================================================
::  SUBRUTINA: devuelve errorlevel 0 si MariaDB responde
:: ==========================================================
:db_responde
%MYSQLADMIN% ping >nul 2>&1
exit /b %errorlevel%


:: ==========================================================
::  MENSAJES DE ERROR
:: ==========================================================
:falta_php
echo [ERROR] No se encontro tools\php\php.exe
echo         Ejecuta primero instalar_y_limpiar.bat
pause
exit /b 1

:falta_mariadb
echo [ERROR] No se encontro tools\mariadb\bin\mysqld.exe
echo         Ejecuta primero instalar_y_limpiar.bat
pause
exit /b 1

:falta_datos
echo [ERROR] La base de datos de MariaDB no esta inicializada.
echo         Falta la carpeta tools\mariadb\data\mysql
echo         Ejecuta primero instalar_y_limpiar.bat
pause
exit /b 1

:falta_schema
echo [ERROR] La base de datos no existe y falta sql\schema.sql para crearla.
pause
exit /b 1

:schema_fallo
echo [ERROR] Fallo al importar sql\schema.sql. Revisa el mensaje de arriba.
pause
exit /b 1

:puerto_web_ocupado
echo [ERROR] El puerto %PUERTO_WEB% ya esta en uso por otro programa.
echo         Cierra la otra ventana de este servidor, o cambia PUERTO_WEB al
echo         principio de este archivo.
pause
exit /b 1

:db_fallo
echo.
echo [ERROR] MariaDB no arranco en 30 segundos. Mensaje del servidor:
echo ----------------------------------------------------------
if exist "%LOGDB%" type "%LOGDB%"
echo ----------------------------------------------------------
echo Causas habituales:
echo   - Ruta de la carpeta demasiado larga o con caracteres especiales.
echo     Prueba a mover el proyecto a algo corto como C:\uf2405
echo   - Falta Visual C++ Redistributable 2015-2022 x64.
echo   - El antivirus o SmartScreen bloquea mysqld.exe.
echo   - Quedo un mysqld.exe colgado: cierralo desde el Administrador de tareas.
echo.
echo Este mensaje tambien esta guardado en %LOGDB%
pause
exit /b 1