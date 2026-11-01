public class Vehiculo {
    private int color;
    private int numeroSerie;
    
    // Constructor
    public Vehiculo(int color, int numeroSerie) {
        this.color = color;
        this.numeroSerie = numeroSerie;
    }
    
    // Constructor por defecto
    public Vehiculo() {
        this.color = 0;
        this.numeroSerie = 0;
    }
    
    // Getters
    public int getColor() {
        return color;
    }
    
    public int getNumeroSerie() {
        return numeroSerie;
    }
    
    // Setters (métodos solicitados)
    public void cambiaNumeroSerie(int nuevoNumero) {
        this.numeroSerie = nuevoNumero;
    }
    
    public void pinta(int nuevoColor) {
        this.color = nuevoColor;
    }
    
    // Método toString para mostrar información
    @Override
    public String toString() {
        return "Vehiculo{color=" + color + ", numeroSerie=" + numeroSerie + "}";
    }
}