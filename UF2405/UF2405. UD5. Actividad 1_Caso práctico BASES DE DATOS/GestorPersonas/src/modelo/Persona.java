package modelo;

import java.io.Serializable;

/**
 * JavaBean que representa una persona.
 * Cumple con el patrón MVC (Modelo).
 */
public class Persona implements Serializable {
    
    private int id;
    private String nombre;
    private String apellidos;

    // Constructor vacío (necesario para JavaBeans)
    public Persona() {}

    // Constructor completo
    public Persona(int id, String nombre, String apellidos) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellidos() { return apellidos; }
    public void setApellidos(String apellidos) { this.apellidos = apellidos; }

    @Override
    public String toString() {
        return id + " - " + nombre + " " + apellidos;
    }
}