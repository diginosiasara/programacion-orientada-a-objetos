package com.empresa.libreria.dao;

import com.empresa.libreria.model.Libro;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LibroDAO {
    
    public List<Libro> obtenerCatalogo() {
        List<Libro> lista = new ArrayList<>();
        
        // H2 en memoria. Crea la tabla e inserta datos de prueba automáticamente al arrancar.
        String url = "jdbc:h2:mem:libreria;DB_CLOSE_DELAY=-1;" +
                     "INIT=CREATE TABLE IF NOT EXISTS libros " +
                     "(id INT PRIMARY KEY AUTO_INCREMENT, titulo VARCHAR(100), autor VARCHAR(50), precio DOUBLE);" +
                     "INSERT INTO libros VALUES (1, 'El Quijote', 'Miguel de Cervantes', 15.50)," +
                     "(2, '1984', 'George Orwell', 12.00)," +
                     "(3, 'Cien años de soledad', 'García Márquez', 18.90);";
        String user = "sa";
        String pass = "";

        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = conn.prepareStatement("SELECT id, titulo, autor, precio FROM libros");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                lista.add(new Libro(
                    rs.getInt("id"), 
                    rs.getString("titulo"), 
                    rs.getString("autor"), 
                    rs.getDouble("precio")
                ));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}