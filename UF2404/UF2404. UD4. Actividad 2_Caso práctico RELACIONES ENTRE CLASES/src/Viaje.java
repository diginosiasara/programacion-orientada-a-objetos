public class Viaje implements InterfaceA {
    private String destino;
    private String fecha;

    public Viaje(String destino, String fecha) {
        this.destino = destino;
        this.fecha = fecha;
    }

    @Override
    public void iniciarViaje() {
        System.out.println("Iniciando viaje a " + destino);
    }

    @Override
    public void finalizarViaje() {
        System.out.println("Finalizando viaje a " + destino);
    }

    @Override
    public String obtenerInformacion() {
        return "Viaje [destino=" + destino + ", fecha=" + fecha + "]";
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void planificarViaje(MedioDeTransporte transporte) {
        System.out.println("Planificando viaje con: " + transporte.tipoVehiculo());
    }

    @Override
    public String toString() {
        return obtenerInformacion();
    }
}