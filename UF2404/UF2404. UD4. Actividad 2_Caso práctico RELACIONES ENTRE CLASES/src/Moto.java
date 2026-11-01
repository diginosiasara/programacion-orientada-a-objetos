public class Moto extends MedioDeTransporte {
    private boolean tieneSidecar;
    private String cilindrada;

    public Moto(Conductor conductor, boolean tieneSidecar, String cilindrada) {
        super(conductor, 2);
        this.tieneSidecar = tieneSidecar;
        this.cilindrada = cilindrada;
    }

    @Override
    public String tipoVehiculo() {
        return "Motocicleta";
    }

    @Override
    public int capacidadPasajeros() {
        return tieneSidecar ? 2 : 1;
    }

    public boolean isTieneSidecar() {
        return tieneSidecar;
    }

    public void setTieneSidecar(boolean tieneSidecar) {
        this.tieneSidecar = tieneSidecar;
    }

    public String getCilindrada() {
        return cilindrada;
    }

    public void setCilindrada(String cilindrada) {
        this.cilindrada = cilindrada;
    }

    @Override
    public String toString() {
        return "Moto [cilindrada=" + cilindrada + ", tieneSidecar=" + tieneSidecar + ", " + super.toString() + "]";
    }
}