/**
 * Clase que representa un Videojuego. Implementa la interfaz Entregable.
 */
public class Videojuego implements Entregable {
    
    // Constantes para valores por defecto
    private final static int HORAS_ESTIMADAS_DEF = 10;
    private final static boolean ENTREGADO_DEF = false;
    
    // Atributos
    private String titulo;
    private int horasEstimadas;
    private boolean entregado;
    private String genero;
    private String compania;

    // Constructores
    /** Constructor por defecto */
    public Videojuego() {
        this("", HORAS_ESTIMADAS_DEF, ENTREGADO_DEF, "", "");
    }

    /** Constructor con título y horas estimadas. El resto por defecto. */
    public Videojuego(String titulo, int horasEstimadas) {
        this(titulo, horasEstimadas, ENTREGADO_DEF, "", "");
    }

    /** Constructor con todos los atributos, excepto entregado. */
    public Videojuego(String titulo, int horasEstimadas, String genero, String compania) {
        this.titulo = titulo;
        this.horasEstimadas = horasEstimadas;
        this.entregado = ENTREGADO_DEF;
        this.genero = genero;
        this.compania = compania;
    }
    
    /** Constructor privado para reutilizar código */
    private Videojuego(String titulo, int horasEstimadas, boolean entregado, String genero, String compania) {
        this.titulo = titulo;
        this.horasEstimadas = horasEstimadas;
        this.entregado = entregado;
        this.genero = genero;
        this.compania = compania;
    }

    // Métodos Get (excepto entregado)
    public String getTitulo() { return titulo; }
    public int getHorasEstimadas() { return horasEstimadas; }
    public String getGenero() { return genero; }
    public String getCompania() { return compania; }

    // Métodos Set (excepto entregado)
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public void setHorasEstimadas(int horasEstimadas) { this.horasEstimadas = horasEstimadas; }
    public void setGenero(String genero) { this.genero = genero; }
    public void setCompania(String compania) { this.compania = compania; }

    // Métodos de la interfaz Entregable
    @Override
    public void entregar() {
        this.entregado = true;
    }

    @Override
    public void devolver() {
        this.entregado = false; }

    @Override
    public boolean isEntregado() {
        return this.entregado;
    }

    /**
     * Compara las horas estimadas con el objeto recibido.
     * @param a Objeto a comparar (se asume que es de tipo Videojuego).
     * @return 0 si son iguales, 1 si este videojuego tiene más horas, -1 si tiene menos.
     */
    public int compareTo(Object a) {
        // Casting de objetos como indica el enunciado
        Videojuego otroVideojuego = (Videojuego) a; 
        
        if (this.horasEstimadas > otroVideojuego.horasEstimadas) {
            return 1;
        } else if (this.horasEstimadas < otroVideojuego.horasEstimadas) {
            return -1;
        } else {
            return 0;
        }
    }

    // Sobrescritura de toString
    @Override
    public String toString() {
        return "Videojuego{" +
                "titulo='" + titulo + '\'' +
                ", horasEstimadas=" + horasEstimadas +
                ", entregado=" + entregado +
                ", genero='" + genero + '\'' +
                ", compania='" + compania + '\'' +
                '}';
    }
}