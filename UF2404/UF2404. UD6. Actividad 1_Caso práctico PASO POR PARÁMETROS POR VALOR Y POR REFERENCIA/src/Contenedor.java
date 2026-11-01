public class Contenedor {
    private int valor;

    // Constructor
    public Contenedor(int valor) {
        this.valor = valor;
    }

    // Getter
    public int getValor() {
        return valor;
    }

    // Setter
    public void setValor(int valor) {
        this.valor = valor;
    }

    // Método para incrementar
    public void incrementar() {
        this.valor++;
    }

    @Override
    public String toString() {
        return String.valueOf(valor);
    }
}