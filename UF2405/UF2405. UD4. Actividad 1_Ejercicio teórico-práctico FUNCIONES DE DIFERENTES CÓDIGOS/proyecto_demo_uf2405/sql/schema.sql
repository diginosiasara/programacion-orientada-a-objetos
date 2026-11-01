CREATE DATABASE IF NOT EXISTS demo_uf2405 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE demo_uf2405;

-- Tabla para Pregunta 1 y 2 (Adaptada del ejercicio original)
CREATE TABLE IF NOT EXISTS empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);

INSERT INTO empresas (nombre, direccion) VALUES 
('Tech Solutions S.L.', 'C/ Innovación 1'),
('Consultoría Global', 'Av. Principal 45');

-- Tabla para Pregunta 3
CREATE TABLE IF NOT EXISTS agenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    edad INT,
    altura DECIMAL(4,2)
);