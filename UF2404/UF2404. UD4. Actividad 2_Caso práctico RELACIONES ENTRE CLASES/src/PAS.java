public class PAS extends Empleado {
    private String area;
    private String cargo;

    public PAS(String nombre, String dni, double salario, String area, String cargo) {
        super(nombre, dni, salario);
        this.area = area;
        this.cargo = cargo;
    }

    @Override
    public String tipoEmpleado() {
        return "Personal Administrativo y de Servicios";
    }

    @Override
    public String descripcionPuesto() {
        return cargo + " en el área de " + area;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @Override
    public String toString() {
        return "PAS [nombre=" + getNombre() + ", dni=" + getDni() + ", salario=" + getSalario() + 
               ", area=" + area + ", cargo=" + cargo + "]";
    }
}