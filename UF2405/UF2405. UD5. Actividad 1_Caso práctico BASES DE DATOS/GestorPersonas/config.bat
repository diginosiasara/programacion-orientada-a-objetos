@echo off
:: ═════════════════════════════════════════════════════════
::   CONFIGURACIÓN PERSONALIZADA - GestorPersonas
::   Modifica estas variables según tu entorno
:: ═════════════════════════════════════════════════════════

:: Java - Ruta donde está instalado JDK
set "JAVA_HOME=C:\Program Files\Java\jdk-17"

:: Tomcat - Ruta donde está instalado (se crea automáticamente)
:: No modificar - se calcula automáticamente

:: MySQL - Ruta al ejecutable mysql.exe (opcional)
:: Descomenta y modifica si MySQL no está en PATH
:: set "MYSQL_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

:: Puerto de Tomcat (por defecto 8080)
set "TOMCAT_PORT=8080"

:: Nombre de la aplicación
set "APP_NAME=GestorPersonas"