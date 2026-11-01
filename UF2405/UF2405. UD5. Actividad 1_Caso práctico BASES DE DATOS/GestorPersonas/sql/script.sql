-- Crear base de datos
CREATE DATABASE IF NOT EXISTS gestor_personas;
USE gestor_personas;

-- Crear tabla PERSONAS
CREATE TABLE PERSONAS (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(64) NOT NULL,
    Apellidos VARCHAR(64) NOT NULL DEFAULT ''
);

-- Datos de prueba
INSERT INTO PERSONAS (Nombre, Apellidos) VALUES
('Ana', 'García López'),
('Antonio', 'Martínez Ruiz'),
('Beatriz', 'Sánchez Gómez'),
('Alberto', 'Fernández Díaz'),
('Carla', 'Ruiz Moreno');

-- Procedimiento: contar personas
DELIMITER //
CREATE PROCEDURE contar_personas(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM PERSONAS;
END //
DELIMITER ;

-- Procedimiento: buscar por inicial
DELIMITER //
CREATE PROCEDURE buscar_por_inicial(IN inicial CHAR(1))
BEGIN
    SELECT * FROM PERSONAS 
    WHERE Nombre LIKE CONCAT(inicial, '%');
END //
DELIMITER ;

-- Procedimiento: agregar persona
DELIMITER //
CREATE PROCEDURE agregar_persona(IN p_nombre VARCHAR(64), IN p_apellidos VARCHAR(64))
BEGIN
    INSERT INTO PERSONAS (Nombre, Apellidos) 
    VALUES (p_nombre, p_apellidos);
END //
DELIMITER ;

-- Procedimiento: listar todas
DELIMITER //
CREATE PROCEDURE listar_personas()
BEGIN
    SELECT * FROM PERSONAS ORDER BY Apellidos;
END //
DELIMITER ;