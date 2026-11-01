@echo off
title Abrir Terminal en Proyecto UF2405
color 0B

:: Cambia al directorio donde está este archivo .bat
cd /d "%~dp0"

:: Abre una nueva ventana de comandos en esta misma carpeta y la mantiene abierta
start cmd /k "cd /d %~dp0 && title Terminal Proyecto UF2405 && color 0A && echo ========================================== && echo   Terminal lista en la carpeta del proyecto && echo   Ruta: %cd% && echo ========================================== && echo."