-- =====================================================
-- UF2405. UD7. Actividad 1 - CONSULTAS EN SQL
-- =====================================================

-- 1. Agregar un estudiante con CI=320, Nombre=Rafael Pérez Valparaiso,
--    Dirección=Avda Guajaira 32, Carrera=Informática, Edad=29
--    (Usamos INSERT OR IGNORE para evitar error si ya existe)
INSERT OR IGNORE INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad)
VALUES (320, 'Rafael Pérez Valparaiso', 'Avda Guajaira 32', 'Informatica', 29);

-- 2. Listar los datos de los autores
SELECT * FROM Autor;

-- 3. Listar nombre y edad de los estudiantes
SELECT Nombre, Edad FROM Estudiante;

-- 4. ¿Quiénes son los autores del libro "Visual Studio Net"? (solo nombres)
SELECT A.Nombre
FROM Autor A
INNER JOIN LibAut LA ON A.IdAutor = LA.IdAutor
INNER JOIN Libro  L  ON LA.IdLibro = L.IdLibro
WHERE L.Titulo = 'Visual Studio Net';

-- 5. Cambiar la nacionalidad al autor "Pong Thinr" y poner "Tailandes"
UPDATE Autor
SET Nacionalidad = 'Tailandes'
WHERE Nombre = 'Pong Thinr';

-- 6. Listar el nombre del estudiante de menor edad
SELECT Nombre
FROM Estudiante
WHERE Edad = (SELECT MIN(Edad) FROM Estudiante);

-- 7. Eliminar al autor Mario Benedetti
DELETE FROM Autor WHERE Nombre = 'Mario Benedetti';

-- 8. Listar los títulos de los libros que debían devolverse el 10/04/07
SELECT L.Titulo
FROM Libro L
INNER JOIN Prestamo P ON L.IdLibro = P.IdLibro
WHERE P.FechaDevolucion = '2007-04-10';

-- 9. Hallar la suma de las edades de los estudiantes
SELECT SUM(Edad) AS SumaEdades FROM Estudiante;

-- 10. Listar los datos de los estudiantes cuya edad es mayor al promedio
SELECT *
FROM Estudiante
WHERE Edad > (SELECT AVG(Edad) FROM Estudiante);