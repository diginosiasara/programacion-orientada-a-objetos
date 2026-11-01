package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import modelo.Persona;

/**
 * DAO (Data Access Object) para la tabla PERSONAS.
 * Utiliza los procedimientos almacenados creados en MySQL.
 */
public class PersonaDAO {
    
    /**
     * Obtiene el número total de personas (usa OUT parameter).
     */
    public int contarPersonas() throws SQLException {
        String sql = "{CALL contar_personas(?)}";
        try (Connection conn = Conexion.getConnection();
             CallableStatement cs = conn.prepareCall(sql)) {
            
            cs.registerOutParameter(1, Types.INTEGER);
            cs.execute();
            return cs.getInt(1);
        }
    }
    
    /**
     * Lista todas las personas.
     */
    public List<Persona> listarTodas() throws SQLException {
        List<Persona> lista = new ArrayList<>();
        String sql = "{CALL listar_personas()}";
        
        try (Connection conn = Conexion.getConnection();
             CallableStatement cs = conn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {
            
            while (rs.next()) {
                Persona p = new Persona();
                p.setId(rs.getInt("Id"));
                p.setNombre(rs.getString("Nombre"));
                p.setApellidos(rs.getString("Apellidos"));
                lista.add(p);
            }
        }
        return lista;
    }
    
    /**
     * Busca personas cuya nombre comienza por la inicial indicada.
     */
    public List<Persona> buscarPorInicial(String inicial) throws SQLException {
        List<Persona> lista = new ArrayList<>();
        String sql = "{CALL buscar_por_inicial(?)}";
        
        try (Connection conn = Conexion.getConnection();
             CallableStatement cs = conn.prepareCall(sql)) {
            
            cs.setString(1, inicial);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Persona p = new Persona();
                    p.setId(rs.getInt("Id"));
                    p.setNombre(rs.getString("Nombre"));
                    p.setApellidos(rs.getString("Apellidos"));
                    lista.add(p);
                }
            }
        }
        return lista;
    }
    
    /**
     * Agrega una nueva persona a la BD.
     */
    public boolean agregar(String nombre, String apellidos) throws SQLException {
        String sql = "{CALL agregar_persona(?, ?)}";
        try (Connection conn = Conexion.getConnection();
             CallableStatement cs = conn.prepareCall(sql)) {
            
            cs.setString(1, nombre);
            cs.setString(2, apellidos);
            cs.execute();
            return true;
        }
    }
}