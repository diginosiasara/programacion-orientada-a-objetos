/**
 * Interfaz que define el comportamiento común para objetos que pueden ser entregados/devueltos.
 */
public interface Entregable {
    // Cambia el atributo entregado a true
    public void entregar();
    
    // Cambia el atributo entregado a false
    public void devolver();
    
    // Devuelve el estado del atributo entregado
    public boolean isEntregado();
}