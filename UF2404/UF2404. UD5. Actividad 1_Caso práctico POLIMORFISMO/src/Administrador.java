public class Administrador extends Usuario {
    // Atributos privados adicionales
    private int papelera;
    private int baneos;

    public Administrador(String correo, String nick) {
        super(correo, nick);
        this.papelera = 0;
        this.baneos = 0;
    }

    // Método específico: Cambia su propio nombre
    public void cambiaNick(String nuevoNick) {
        super.setNick(nuevoNick); // Usamos el método de la clase padre
    }

    public void papelerainc() {
        this.papelera++;
    }

    public void baneosinc() {
        this.baneos++;
    }
    
    public int getBaneos() { return baneos; }
}