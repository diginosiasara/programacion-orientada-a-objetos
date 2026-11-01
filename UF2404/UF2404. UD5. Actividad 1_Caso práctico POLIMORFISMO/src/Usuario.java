public class Usuario {
    // Atributos privados
    private int mensajes;
    private String correo;
    private String nick;

    // Constructor
    public Usuario(String correo, String nick) {
        this.mensajes = 0;
        this.correo = correo;
        this.nick = nick;
    }

    // Métodos
    public void incrementa() {
        this.mensajes++;
    }

    public void decrementa() {
        this.mensajes--;
    }

    public void modificaCorreo(String nuevoCorreo) {
        this.correo = nuevoCorreo;
    }

    // Método auxiliar para que el Administrador pueda cambiar el nick
    // (ya que el atributo es privado)
    public void setNick(String nick) {
        this.nick = nick;
    }

    // Getters para visualizar resultados en el Main
    public String getNick() { return nick; }
    public int getMensajes() { return mensajes; }
}