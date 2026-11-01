public abstract class MedioDeTransporte {
    private Conductor conductor;
    private Rueda[] ruedas;
    private int cantidadRuedas;

    public MedioDeTransporte(Conductor conductor, int capacidadRuedas) {
        this.conductor = conductor;
        this.ruedas = new Rueda[capacidadRuedas];
        this.cantidadRuedas = 0;
    }

    public void agregarRueda(Rueda unaRueda) {
        if (cantidadRuedas < ruedas.length) {
            ruedas[cantidadRuedas] = unaRueda;
            cantidadRuedas++;
        } else {
            System.out.println("No se pueden agregar más ruedas");
        }
    }

    public Conductor getConductor() {
        return conductor;
    }

    public void setConductor(Conductor conductor) {
        this.conductor = conductor;
    }

    public Rueda[] getRuedas() {
        return ruedas;
    }

    public abstract String tipoVehiculo();
    public abstract int capacidadPasajeros();

    @Override
    public String toString() {
        return "MedioDeTransporte [conductor=" + conductor + ", cantidadRuedas=" + cantidadRuedas + "]";
    }
}