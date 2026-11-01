public class Rueda {
    private int diametro;
    private String tipo;

    public Rueda(int diametro, String tipo) {
        this.diametro = diametro;
        this.tipo = tipo;
    }

    public int getDiametro() {
        return diametro;
    }

    public void setDiametro(int diametro) {
        this.diametro = diametro;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Rueda [diametro=" + diametro + ", tipo=" + tipo + "]";
    }
}