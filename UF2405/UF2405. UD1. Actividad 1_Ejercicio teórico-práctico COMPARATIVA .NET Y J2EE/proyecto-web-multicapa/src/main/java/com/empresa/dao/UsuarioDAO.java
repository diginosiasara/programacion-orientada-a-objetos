package com.empresa.proyecto.dao;

import com.empresa.proyecto.model.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    
    public List<Usuario> obtenerTodosLosUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        
        // URL de H2 en memoria. Crea la tabla automáticamente si no existe
        String url = "jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;INIT=CREATE TABLE IF NOT EXISTS usuarios (id INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(50), email VARCHAR(50)); INSERT INTO usuarios VALUES (1, 'Ana García', 'ana@empresa.com'), (2, 'Carlos López', 'carlos@empresa.com');";
        String user = "sa";
        String pass = "";

        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = conn.prepareStatement("SELECT id, nombre, email FROM usuarios");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                lista.add(new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("email")));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}