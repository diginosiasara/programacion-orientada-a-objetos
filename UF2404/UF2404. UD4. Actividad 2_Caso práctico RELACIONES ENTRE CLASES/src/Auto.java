public class Auto extends MedioDeTransporte {
    private int numeroPuertas;
    private String marca;

    public Auto(Conductor conductor, int numeroPuertas, String marca) {
        super(conductor, 4);
        this.numeroPuertas = numeroPuertas;
        this.marca = marca;
    }

    @Override
    public String tipoVehiculo() {
        return "Automóvil";
    }

    @Override
    public int capacidadPasajeros() {
        return numeroPuertas;
    }

    public int getNumeroPuertas() {
        return numeroPuertas;
    }

    public void setNumeroPuertas(int numeroPuertas) {
        this.numeroPuertas = numeroPuertas;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    @Override
    public String toString() {
        return "Auto [marca=" + marca + ", numeroPuertas=" + numeroPuertas + ", " + super.toString() + "]";
    }
}