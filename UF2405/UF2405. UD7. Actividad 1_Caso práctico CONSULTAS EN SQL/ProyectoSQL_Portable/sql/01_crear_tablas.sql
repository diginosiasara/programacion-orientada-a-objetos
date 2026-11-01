-- =====================================================
-- CREACIÓN DE TABLAS - Biblioteca
-- =====================================================

CREATE TABLE IF NOT EXISTS Libro (
    IdLibro   INTEGER PRIMARY KEY AUTOINCREMENT,
    Titulo    TEXT NOT NULL,
    Editorial TEXT,
    Area      TEXT
);

CREATE TABLE IF NOT EXISTS Autor (
    IdAutor      INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre       TEXT NOT NULL,
    Nacionalidad TEXT
);

CREATE TABLE IF NOT EXISTS LibAut (
    IdAutor INTEGER NOT NULL,
    IdLibro INTEGER NOT NULL,
    PRIMARY KEY (IdAutor, IdLibro),
    FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor),
    FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro)
);

CREATE TABLE IF NOT EXISTS Estudiante (
    IdLector  INTEGER PRIMARY KEY AUTOINCREMENT,
    CI        INTEGER UNIQUE NOT NULL,
    Nombre    TEXT NOT NULL,
    Direccion TEXT,
    Carrera   TEXT,
    Edad      INTEGER
);

CREATE TABLE IF NOT EXISTS Prestamo (
    IdLector        INTEGER NOT NULL,
    IdLibro         INTEGER NOT NULL,
    FechaPrestamo   TEXT,
    FechaDevolucion TEXT,
    Devuelto        INTEGER DEFAULT 0,
    PRIMARY KEY (IdLector, IdLibro, FechaPrestamo),
    FOREIGN KEY (IdLector) REFERENCES Estudiante(IdLector),
    FOREIGN KEY (IdLibro)  REFERENCES Libro(IdLibro)
);