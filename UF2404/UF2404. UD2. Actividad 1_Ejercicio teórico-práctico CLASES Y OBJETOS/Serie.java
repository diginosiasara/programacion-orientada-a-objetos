/**
 * Clase que representa una Serie. Implementa la interfaz Entregable.
 */
public class Serie implements Entregable {
    
    // Constantes para valores por defecto
    private final static int NUMERO_TEMPORADAS_DEF = 3;
    private final static boolean ENTREGADO_DEF = false;
    
    // Atributos
    private String titulo;
    private int numeroTemporadas;
    private boolean entregado;
    private String genero;
    private String creador;

    // Constructores
    /** Constructor por defecto */
    public Serie() {
        this("", NUMERO_TEMPORADAS_DEF, ENTREGADO_DEF, "", "");
    }

    /** Constructor con título y creador. El resto por defecto. */
    public Serie(String titulo, String creador) {
        this(titulo, NUMERO_TEMPORADAS_DEF, ENTREGADO_DEF, "", creador);
    }

    /** Constructor con todos los atributos, excepto entregado. */
    public Serie(String titulo, int numeroTemporadas, String genero, String creador) {
        this.titulo = titulo;
        this.numeroTemporadas = numeroTemporadas;
        this.entregado = ENTREGADO_DEF;
        this.genero = genero;
        this.creador = creador;
    }
    
    /** Constructor privado para reutilizar código (delegación) */
    private Serie(String titulo, int numeroTemporadas, boolean entregado, String genero, String creador) {
        this.titulo = titulo;
        this.numeroTemporadas = numeroTemporadas;
        this.entregado = entregado;
        this.genero = genero;
        this.creador = creador;
    }

    // Métodos Get (excepto entregado)
    public String getTitulo() { return titulo; }
    public int getNumeroTemporadas() { return numeroTemporadas; }
    public String getGenero() { return genero; }
    public String getCreador() { return creador; }

    // Métodos Set (excepto entregado)
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public void setNumeroTemporadas(int numeroTemporadas) { this.numeroTemporadas = numeroTemporadas; }
    public void setGenero(String genero) { this.genero = genero; }
    public void setCreador(String creador) { this.creador = creador; }

    // Métodos de la interfaz Entregable
    @Override
    public void entregar() {
        this.entregado = true;
    }

    @Override
    public void devolver() {
        this.entregado = false;
    }

    @Override
    public boolean isEntregado() {
        return this.entregado;
    }

    /**
     * Compara el número de temporadas con el objeto recibido.
     * @param a Objeto a comparar (se asume que es de tipo Serie).
     * @return 0 si son iguales, 1 si esta serie tiene más temporadas, -1 si tiene menos.
     */
    public int compareTo(Object a) {
        // Casting de objetos como indica el enunciado
        Serie otraSerie = (Serie) a; 
        
        if (this.numeroTemporadas > otraSerie.numeroTemporadas) {
            return 1;
        } else if (this.numeroTemporadas < otraSerie.numeroTemporadas) {
            return -1;
        } else {
            return 0;
        }
    }

    // Sobrescritura de toString
    @Override
    public String toString() {
        return "Serie{" +
                "titulo='" + titulo + '\'' +
                ", numeroTemporadas=" + numeroTemporadas +
                ", entregado=" + entregado +
                ", genero='" + genero + '\'' +
                ", creador='" + creador + '\'' +
                '}';
    }
}