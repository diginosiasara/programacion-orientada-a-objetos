/**
 * Clase Vendedor que hereda de Empleado.
 * Añade el atributo comisión y la implementación de extrasSueldo().
 * Regla: se suma el extra al sueldo si la comisión es inferior a 45.
 * 
 * @author UF2404 - Programación Orientada a Objetos
 * @version 1.0
 */
public class Vendedor extends Empleado {
    
    // Atributo propio de la clase hija
    private double comision;
    
    // Constructor por defecto
    public Vendedor() {
        super();
        this.comision = 0.0;
    }
    
    // Constructor con los 5 atributos
    public Vendedor(String nombre, String apellidos, int edad, double sueldo, double comision) {
        super(nombre, apellidos, edad, sueldo);
        this.comision = comision;
    }
    
    // Getter y setter del atributo propio
    public double getComision() {
        return comision;
    }
    
    public void setComision(double comision) {
        if (comision >= 0) {
            this.comision = comision;
        }
    }
    
    /**
     * Implementación del método abstracto heredado.
     * Regla del enunciado: se suma el extra al sueldo si la comisión es < 45.
     */
    @Override
    public void extrasSueldo(double importe) {
        if (this.comision < 45) {
            double nuevoSueldo = getSueldo() + importe;
            setSueldo(nuevoSueldo);
            System.out.println("  -> Extra de " + importe + " € APLICADO (comisión " 
                + comision + " < 45).");
        } else {
            System.out.println("  -> NO se aplica el extra: la comisión es >= 45.");
        }
    }
    
    @Override
    public void mostrarDatos() {
        super.mostrarDatos();
        System.out.println("Puesto: Vendedor");
        System.out.println("Comisión: " + comision + " %");
    }
}