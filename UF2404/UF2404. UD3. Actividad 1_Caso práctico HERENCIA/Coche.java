public class Coche extends Vehiculo {
    private int cilindrada;
    
    // Constructor
    public Coche(int color, int numeroSerie, int cilindrada) {
        super(color, numeroSerie); // Llama al constructor de la clase padre
        this.cilindrada = cilindrada;
    }
    
    // Constructor por defecto
    public Coche() {
        super();
        this.cilindrada = 0;
    }
    
    // Getter y Setter para cilindrada
    public int getCilindrada() {
        return cilindrada;
    }
    
    public void setCilindrada(int cilindrada) {
        this.cilindrada = cilindrada;
    }
    
    @Override
    public String toString() {
        return "Coche{color=" + getColor() + 
               ", numeroSerie=" + getNumeroSerie() + 
               ", cilindrada=" + cilindrada + "}";
    }
}