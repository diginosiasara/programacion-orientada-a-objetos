public class Bicicleta extends Vehiculo {
    // Constructor
    public Bicicleta(int color, int numeroSerie) {
        super(color, numeroSerie);
    }
    
    // Constructor por defecto
    public Bicicleta() {
        super();
    }
    
    @Override
    public String toString() {
        return "Bicicleta{color=" + getColor() + 
               ", numeroSerie=" + getNumeroSerie() + "}";
    }
}