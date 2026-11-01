public class Moderador extends Usuario {
    // Atributo privado adicional
    private int papelera;

    public Moderador(String correo, String nick) {
        super(correo, nick); // Llamada al constructor de la superclase
        this.papelera = 0;
    }

    // Método específico
    public void papelerainc() {
        this.papelera++;
    }
    
    public int getPapelera() { return papelera; }
}