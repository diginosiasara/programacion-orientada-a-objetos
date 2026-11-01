/**
 * Clase Administrativo que hereda de Empleado.
 * Añade el atributo antigüedad (años en la empresa).
 * Regla: se suma el extra al sueldo si la antigüedad es mayor o igual a 5 años.
 * 
 * @author UF2404 - Programación Orientada a Objetos
 * @version 1.0
 */
public class Administrativo extends Empleado {
    
    private int antiguedad; // años en la empresa
    
    public Administrativo() {
        super();
        this.antiguedad = 0;
    }
    
    public Administrativo(String nombre, String apellidos, int edad, double sueldo, int antiguedad) {
        super(nombre, apellidos, edad, sueldo);
        this.antiguedad = antiguedad;
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }
    
    public void setAntiguedad(int antiguedad) {
        if (antiguedad >= 0) {
            this.antiguedad = antiguedad;
        }
    }
    
    /**
     * Implementación del método abstracto heredado.
     * Regla: se suma el extra si la antigüedad es >= 5 años.
     */
    @Override
    public void extrasSueldo(double importe) {
        if (this.antiguedad >= 5) {
            double nuevoSueldo = getSueldo() + importe;
            setSueldo(nuevoSueldo);
            System.out.println("  -> Extra de " + importe + " € APLICADO (antigüedad " 
                + antiguedad + " >= 5 años).");
        } else {
            System.out.println("  -> NO se aplica el extra: antigüedad < 5 años.");
        }
    }
    
    @Override
    public void mostrarDatos() {
        super.mostrarDatos();
        System.out.println("Puesto: Administrativo");
        System.out.println("Antigüedad: " + antiguedad + " años");
    }
}