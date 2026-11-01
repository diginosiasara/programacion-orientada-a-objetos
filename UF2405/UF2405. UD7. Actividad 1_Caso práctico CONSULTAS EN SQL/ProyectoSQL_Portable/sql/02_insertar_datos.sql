-- =====================================================
-- DATOS DE EJEMPLO
-- =====================================================

-- LIBROS
INSERT INTO Libro (Titulo, Editorial, Area) VALUES ('Visual Studio Net', 'Microsoft Press', 'Informatica');
INSERT INTO Libro (Titulo, Editorial, Area) VALUES ('El amor en los tiempos del cólera', 'Oveja Negra', 'Literatura');
INSERT INTO Libro (Titulo, Editorial, Area) VALUES ('La tregua', 'Alfaguara', 'Literatura');
INSERT INTO Libro (Titulo, Editorial, Area) VALUES ('Cien años de soledad', 'Sudamericana', 'Literatura');
INSERT INTO Libro (Titulo, Editorial, Area) VALUES ('Introducción a Java', 'Prentice Hall', 'Informatica');

-- AUTORES
INSERT INTO Autor (Nombre, Nacionalidad) VALUES ('Pong Thinr', 'Tailandes');
INSERT INTO Autor (Nombre, Nacionalidad) VALUES ('Gabriel García Márquez', 'Colombiano');
INSERT INTO Autor (Nombre, Nombre) VALUES ('Mario Benedetti', 'Uruguayo');
INSERT INTO Autor (Nombre, Nacionalidad) VALUES ('James Gosling', 'Canadiense');

-- RELACIÓN LIBRO-AUTOR
INSERT INTO LibAut (IdAutor, IdLibro) VALUES (1, 1);  -- Pong Thinr -> Visual Studio Net
INSERT INTO LibAut (IdAutor, IdLibro) VALUES (2, 2);  -- García Márquez -> Amor...
INSERT INTO LibAut (IdAutor, IdLibro) VALUES (3, 3);  -- Benedetti -> La tregua
INSERT INTO LibAut (IdAutor, IdLibro) VALUES (2, 4);  -- García Márquez -> Cien años
INSERT INTO LibAut (IdAutor, IdLibro) VALUES (4, 5);  -- Gosling -> Java

-- ESTUDIANTES
INSERT INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad) VALUES (100, 'Ana López', 'Calle 10 #5-20', 'Informatica', 22);
INSERT INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad) VALUES (101, 'Carlos Ruiz', 'Avda Siempre Viva 123', 'Sistemas', 25);
INSERT INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad) VALUES (102, 'María García', 'Carrera 7 #45-10', 'Informatica', 20);
INSERT INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad) VALUES (103, 'Pedro Sánchez', 'Calle 80 #12-34', 'Redes', 28);
INSERT INTO Estudiante (CI, Nombre, Direccion, Carrera, Edad) VALUES (104, 'Laura Martínez', 'Avda 68 #90-15', 'Sistemas', 23);

-- PRÉSTAMOS
INSERT INTO Prestamo (IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES (100, 1, '2007-03-10', '2007-04-10', 0);
INSERT INTO Prestamo (IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES (101, 2, '2007-02-15', '2007-04-10', 1);
INSERT INTO Prestamo (IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES (102, 3, '2007-03-20', '2007-05-20', 0);
INSERT INTO Prestamo (IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES (103, 4, '2007-01-05', '2007-04-10', 0);
INSERT INTO Prestamo (IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES (104, 5, '2007-04-01', '2007-06-01', 0);