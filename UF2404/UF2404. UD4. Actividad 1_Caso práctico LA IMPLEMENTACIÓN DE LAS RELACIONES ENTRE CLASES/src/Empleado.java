/**
 * Clase abstracta Empleado.
 * Representa la entidad genérica de un empleado en la empresa.
 * Al ser abstracta, NO puede instanciarse directamente.
 * Obliga a sus clases hijas a implementar el método extrasSueldo().
 * 
 * @author UF2404 - Programación Orientada a Objetos
 * @version 1.0
 */
public abstract class Empleado {
    
    // Atributos (encapsulados con private)
    private String nombre;
    private String apellidos;
    private int edad;
    private double sueldo;
    
    // Constructor por defecto
    public Empleado() {
        this.nombre = "";
        this.apellidos = "";
        this.edad = 0;
        this.sueldo = 0.0;
    }
    
    // Constructor con los 4 atributos
    public Empleado(String nombre, String apellidos, int edad, double sueldo) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.sueldo = sueldo;
    }
    
    // ===== Métodos modificadores (setters) =====
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public void setEdad(int edad) {
        if (edad >= 0) {
            this.edad = edad;
        }
    }
    
    public void setSueldo(double sueldo) {
        if (sueldo >= 0) {
            this.sueldo = sueldo;
        }
    }
    
    // ===== Métodos consultores (getters) =====
    public String getNombre() {
        return nombre;
    }
    
    public String getApellidos() {
        return apellidos;
    }
    
    public int getEdad() {
        return edad;
    }
    
    public double getSueldo() {
        return sueldo;
    }
    
    /**
     * Método abstracto: NO tiene implementación en la clase padre.
     * Las clases hijas DEBEN implementarlo (polimorfismo).
     * @param importe Importe extra a aplicar según la lógica de cada subclase
     */
    public abstract void extrasSueldo(double importe);
    
    /**
     * Muestra los datos básicos del empleado.
     */
    public void mostrarDatos() {
        System.out.println("======================================");
        System.out.println("Nombre completo: " + nombre + " " + apellidos);
        System.out.println("Edad: " + edad + " años");
        System.out.println("Sueldo base: " + String.format("%.2f", sueldo) + " €");
    }
    
    /**
     * Devuelve el nombre completo del empleado.
     */
    public String getNombreCompleto() {
        return nombre + " " + apellidos;
    }
}