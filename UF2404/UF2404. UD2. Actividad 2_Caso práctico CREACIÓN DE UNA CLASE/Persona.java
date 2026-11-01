import java.util.Random;

/**
 * Clase que representa a una persona con sus atributos básicos
 */
public class Persona {
    
    // Constantes para el cálculo del IMC
    private static final int IMC_BAJO = -1;
    private static final int IMC_IDEAL = 0;
    private static final int IMC_ALTO = 1;
    
    // Constante para el sexo por defecto
    private static final char SEXO_POR_DEFECTO = 'H';
    
    // Constante para la longitud del DNI
    private static final int LONGITUD_DNI = 8;
    
    // Letra para el cálculo del DNI
    private static final String LETRAS_DNI = "TRWAGMYFPDXBNJZSQVHLCKE";
    
    // Atributos privados (encapsulación)
    private String nombre;
    private int edad;
    private String dni;
    private char sexo;
    private double peso;
    private double altura;
    
    // Constructores
    
    /**
     * Constructor por defecto
     */
    public Persona() {
        this.nombre = "";
        this.edad = 0;
        this.dni = generaDNI();
        this.sexo = SEXO_POR_DEFECTO;
        this.peso = 0.0;
        this.altura = 0.0;
    }
    
    /**
     * Constructor con nombre, edad y sexo
     * @param nombre Nombre de la persona
     * @param edad Edad de la persona
     * @param sexo Sexo de la persona (H o M)
     */
    public Persona(String nombre, int edad, char sexo) {
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = comprobarSexo(sexo);
        this.dni = generaDNI();
        this.peso = 0.0;
        this.altura = 0.0;
    }
    
    /**
     * Constructor con todos los atributos
     * @param nombre Nombre de la persona
     * @param edad Edad de la persona
     * @param sexo Sexo de la persona (H o M)
     * @param peso Peso en kg
     * @param altura Altura en metros
     */
    public Persona(String nombre, int edad, char sexo, double peso, double altura) {
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = comprobarSexo(sexo);
        this.peso = peso;
        this.altura = altura;
        this.dni = generaDNI();
    }
    
    // Métodos
    
    /**
     * Calcula el Índice de Masa Corporal
     * @return -1 si está por debajo del peso ideal, 0 si está en su peso ideal, 1 si tiene sobrepeso
     */
    public int calcularIMC() {
        if (altura <= 0) {
            return IMC_IDEAL; // Evitar división por cero
        }
        
        double imc = peso / (altura * altura);
        
        if (imc < 20) {
            return IMC_BAJO;
        } else if (imc >= 20 && imc <= 25) {
            return IMC_IDEAL;
        } else {
            return IMC_ALTO;
        }
    }
    
    /**
     * Indica si la persona es mayor de edad
     * @return true si es mayor de edad (18 años o más), false en caso contrario
     */
    public boolean esMayorDeEdad() {
        return edad >= 18;
    }
    
    /**
     * Comprueba que el sexo introducido es correcto
     * @param sexo Sexo a comprobar
     * @return 'H' si es hombre, 'M' si es mujer, 'H' si no es correcto
     */
    private char comprobarSexo(char sexo) {
        if (sexo == 'H' || sexo == 'M') {
            return sexo;
        } else {
            return SEXO_POR_DEFECTO;
        }
    }
    
    /**
     * Genera un DNI aleatorio de 8 cifras con su letra correspondiente
     * @return DNI generado con formato "12345678A"
     */
    private String generaDNI() {
        Random random = new Random();
        int numero = random.nextInt(100000000); // Número de 0 a 99999999
        
        // Asegurar que tenga 8 dígitos
        String numeroStr = String.format("%08d", numero);
        
        // Calcular la letra
        char letra = LETRAS_DNI.charAt(numero % 23);
        
        return numeroStr + letra;
    }
    
    /**
     * Devuelve toda la información del objeto
     * @return Cadena con todos los atributos de la persona
     */
    @Override
    public String toString() {
        String estadoIMC;
        int imc = calcularIMC();
        
        if (imc == IMC_BAJO) {
            estadoIMC = "por debajo de su peso ideal";
        } else if (imc == IMC_IDEAL) {
            estadoIMC = "en su peso ideal";
        } else {
            estadoIMC = "con sobrepeso";
        }
        
        return "Persona{" +
                "nombre='" + nombre + '\'' +
                ", edad=" + edad +
                ", dni='" + dni + '\'' +
                ", sexo=" + sexo +
                ", peso=" + peso + " kg" +
                ", altura=" + altura + " m" +
                ", IMC=" + estadoIMC +
                ", mayorDeEdad=" + (esMayorDeEdad() ? "Sí" : "No") +
                '}';
    }
    
    // Métodos Get
    
    public String getNombre() {
        return nombre;
    }
    
    public int getEdad() {
        return edad;
    }
    
    public String getDni() {
        return dni;
    }
    
    public char getSexo() {
        return sexo;
    }
    
    public double getPeso() {
        return peso;
    }
    
    public double getAltura() {
        return altura;
    }
    
    // Métodos Set (excepto DNI)
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public void setSexo(char sexo) {
        this.sexo = comprobarSexo(sexo);
    }
    
    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    public void setAltura(double altura) {
        this.altura = altura;
    }
}