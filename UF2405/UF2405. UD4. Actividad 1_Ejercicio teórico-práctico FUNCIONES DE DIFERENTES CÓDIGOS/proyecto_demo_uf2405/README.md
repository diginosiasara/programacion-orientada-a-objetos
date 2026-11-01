# Proyecto Demo UF2405 - Acceso a Bases de Datos

## Descripción
Proyecto de demostración para la Unidad Formativa **UF2405: Modelo de programación web y bases de datos**.
Integra los tres ejercicios prácticos sobre conexión y manipulación de bases de datos con PHP y MySQL.

## Ejercicios Cubiertos
| Ejercicio | Archivo | Operación DML |
|-----------|---------|---------------|
| 1 | `public/index.php` | `SELECT` (Listado en tabla HTML) |
| 2 | `public/eliminar.php` | `DELETE` (Borrado seguro) |
| 3 | `public/insertar.php` | `INSERT` (Inserción de datos) |

## Instalación
1. Copia la carpeta a `htdocs` de XAMPP (o similar)
2. Importa `sql/schema.sql` en phpMyAdmin
3. Ejecuta `iniciar.bat` para lanzar el servidor portable

## Seguridad
- Uso de `mysqli` (extensión moderna, no obsoleta)
- Sanitización de entradas con `sqlValue()`
- Escape de datos con `mysqli_real_escape_string()`
- Uso de `htmlspecialchars()` en la salida HTML

## Estructura
- `/public/` → Archivos accesibles por el navegador
- `/includes/` → Código compartido (conexión, funciones)
- `/sql/` → Scripts de base de datos
- `/assets/` → CSS, JS, imágenes

## Autor
Proyecto educativo - UF2405