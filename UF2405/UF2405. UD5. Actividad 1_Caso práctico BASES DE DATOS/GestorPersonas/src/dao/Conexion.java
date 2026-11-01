package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase encargada de gestionar la conexión JDBC con MySQL.
 * Implementa CE2.3 y CE2.4 de la UF2405.
 */
public class Conexion {
    
    // Parámetros de conexión (ajustar según entorno)
    private static final String URL = "jdbc:mysql://localhost:3306/gestor_personas?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "tu_password";
    
    /**
     * Establece y devuelve la conexión con la BD.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Cargar el driver JDBC de MySQL (Tipo 4 - Java puro)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC no encontrado: " + e.getMessage());
        }
    }
    
    /**
     * Cierra la conexión liberando recursos.
     */
    public static void cerrarConexion(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexión: " + e.getMessage());
            }
        }
    }
}