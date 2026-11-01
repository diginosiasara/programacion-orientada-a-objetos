# Actividad 2 - Caso práctico "IMPLEMENTACIÓN" (UF2404. UD9)

## Descripción
Este proyecto contiene una aplicación de prueba en Java desarrollada para cumplir con los requisitos de la Actividad 2 de la Unidad Didáctica 9. 

La aplicación realiza las siguientes tareas:
1. **Pregunta 1**: Imprime en pantalla el texto solicitado: *"Lo que se escriba más abajo entre las comillas"*.
2. **Pregunta 2**: Acepta dos argumentos numéricos desde la línea de comandos, calcula su suma y muestra el resultado. Incluye un **control de excepciones** (`try-catch`) para manejar errores de forma elegante si el usuario introduce valores no numéricos o no proporciona suficientes argumentos.

## Requisitos
- Tener instalado el **Java Development Kit (JDK)** (versión 8 o superior).
- Tener configurada la variable de entorno `PATH` del sistema para que reconozca los comandos `javac` y `java`.

## Estructura de archivos
El proyecto consta de los siguientes archivos en la misma carpeta:
- `primera_aplicacion.java`: El código fuente de la aplicación en Java.
- `ejecutar.bat`: Un script por lotes (solo para Windows) que automatiza la compilación y realiza 3 pruebas automáticas.
- `README.md`: Este archivo de documentación e instrucciones.

## Cómo ejecutar el programa

### Opción A: Usando el script automático (Recomendado para Windows)
1. Asegúrate de que `primera_aplicacion.java` y `ejecutar.bat` estén en la misma carpeta.
2. Haz **doble clic** en el archivo `ejecutar.bat`.
3. Se abrirá una ventana de consola que compilará el código y ejecutará automáticamente tres pruebas:
   - **Prueba 1**: Sin argumentos (mostrará un aviso de falta de argumentos).
   - **Prueba 2**: Con números válidos (ej. `15 25`, mostrará la suma `40.0`).
   - **Prueba 3**: Con argumentos inválidos (ej. `10 hola`, mostrará el error de formato capturado por el bloque `catch`).
4. Presiona cualquier tecla para avanzar entre las pruebas y cerrar la ventana al finalizar.

### Opción B: Compilación y ejecución manual (Windows, macOS, Linux)
Abre una terminal o consola de comandos, navega hasta la carpeta donde guardaste los archivos y ejecuta los siguientes comandos:

1. **Compilar el código**:
   ```bash
   javac primera_aplicacion.java