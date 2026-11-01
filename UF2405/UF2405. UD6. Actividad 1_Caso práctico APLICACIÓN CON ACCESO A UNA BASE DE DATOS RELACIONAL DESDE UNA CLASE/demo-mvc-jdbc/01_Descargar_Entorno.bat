@echo off
chcp 65001 >nul
title Descargando Entorno Portable
color 0B

echo ============================================================
echo  DESCARGANDO ENTORNO PORTABLE (Sin permisos de admin)
echo ============================================================
pause

if exist portable_env rmdir /s /q portable_env
mkdir portable_env
cd portable_env

echo [1/4] Descargando JDK 11 Portable...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.23%%2B9/OpenJDK11U-jdk_x64_windows_hotspot_11.0.23_9.zip' -OutFile 'jdk.zip'"
powershell -Command "Expand-Archive -Path 'jdk.zip' -DestinationPath 'jdk_temp'"
for /d %%D in (jdk_temp\*) do move "%%D" "jdk"
rmdir /s /q jdk_temp
del jdk.zip

echo [2/4] Descargando Apache Tomcat 9...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98-windows-x64.zip' -OutFile 'tomcat.zip'"
powershell -Command "Expand-Archive -Path 'tomcat.zip' -DestinationPath 'tomcat_temp'"
for /d %%D in (tomcat_temp\*) do move "%%D" "tomcat"
rmdir /s /q tomcat_temp
del tomcat.zip

echo [3/4] Descargando Apache Maven 3.9.6...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip' -OutFile 'maven.zip'"
powershell -Command "Expand-Archive -Path 'maven.zip' -DestinationPath 'maven_temp'"
for /d %%D in (maven_temp\*) do move "%%D" "maven"
rmdir /s /q maven_temp
del maven.zip

echo [4/4] Descargando H2 Database...
mkdir h2\data
powershell -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/com/h2database/h2/2.2.224/h2-2.2.224.jar' -OutFile 'h2\h2.jar'"

cd ..
echo [OK] Entorno descargado.
pause