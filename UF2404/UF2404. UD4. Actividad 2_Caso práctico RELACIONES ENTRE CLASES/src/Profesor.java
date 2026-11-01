public class Profesor extends Empleado {
    private String departamento;
    private String especialidad;

    public Profesor(String nombre, String dni, double salario, String departamento, String especialidad) {
        super(nombre, dni, salario);
        this.departamento = departamento;
        this.especialidad = especialidad;
    }

    @Override
    public String tipoEmpleado() {
        return "Profesor";
    }

    @Override
    public String descripcionPuesto() {
        return "Imparte clases de " + especialidad + " en el departamento de " + departamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    @Override
    public String toString() {
        return "Profesor [nombre=" + getNombre() + ", dni=" + getDni() + ", salario=" + getSalario() + 
               ", departamento=" + departamento + ", especialidad=" + especialidad + "]";
    }
}