# Proyecto Portable - Consultas SQL (UF2405 UD7)

## ✅ Características
- **100% Portable**: No instala nada en el PC madre
- **Sin servidor**: Usa SQLite (motor embebido)
- **Auto-instalable**: Descarga SQLite automáticamente
- **Limpio**: Todo queda dentro de la carpeta del proyecto

## 🚀 Uso rápido

1. **Doble clic en** `scripts/01_instalar.bat` → Descarga SQLite
2. **Doble clic en** `scripts/02_inicializar.bat` → Crea la BD con datos
3. **Doble clic en** `scripts/03_lanzar.bat` → Ejecuta las 10 consultas

## 📋 Las 10 Consultas

| # | Consulta | Tipo |
|---|----------|------|
| 1 | Agregar estudiante (CI=320) | INSERT |
| 2 | Listar autores | SELECT * |
| 3 | Nombre y edad de estudiantes | SELECT columnas |
| 4 | Autores de "Visual Studio Net" | INNER JOIN |
| 5 | Cambiar nacionalidad de Pong Thinr | UPDATE |
| 6 | Estudiante de menor edad | Subconsulta MIN |
| 7 | Eliminar Mario Benedetti | DELETE |
| 8 | Libros a devolver el 10/04/07 | JOIN + WHERE fecha |
| 9 | Suma de edades | SUM() |
| 10 | Estudiantes sobre el promedio | Subconsulta AVG |

## ️ Estructura
ProyectoSQL_Portable/
├── bin/sqlite3.exe ← Motor (se descarga solo)
├── sql/ ← Scripts SQL
├── scripts/ ← BATs de control
├── datos/biblioteca.db ← Base de datos (se crea sola)
└── README.md


## 🔧 Requisitos
- Windows 7 o superior
- Conexión a Internet (solo para la primera descarga de SQLite ~2MB)
- PowerShell (viene con Windows 7+)

## 🧹 Desinstalación
Simplemente **borra la carpeta del proyecto**. No deja rastros en el sistema.