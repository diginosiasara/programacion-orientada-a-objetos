CREATE DATABASE IF NOT EXISTS gestion;
USE gestion;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

INSERT INTO usuarios (nombre, email) VALUES 
('Ana García', 'ana@empresa.com'),
('Carlos López', 'carlos@empresa.com'),
('María Ruiz', 'maria@empresa.com');