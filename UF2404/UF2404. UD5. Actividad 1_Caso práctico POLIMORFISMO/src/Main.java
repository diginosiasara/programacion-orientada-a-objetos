public class Main {
    public static void main(String[] args) {
        // POLIMORFISMO: Usamos un array de la Superclase (Usuario)
        // pero almacenamos objetos de las Subclases (Moderador, Administrador)
        Usuario[] usuarios = new Usuario[3];

        usuarios[0] = new Usuario("user1@web.com", "UserNormal");
        usuarios[1] = new Moderador("mod@web.com", "ModSuper");
        usuarios[2] = new Administrador("admin@web.com", "AdminRoot");

        // Todos responden al mensaje 'incrementa()' aunque sean tipos distintos
        for (Usuario u : usuarios) {
            u.incrementa();
            u.incrementa(); // +2 mensajes para todos
            System.out.println("Usuario: " + u.getNick() + " | Mensajes: " + u.getMensajes());
        }

        // Demostración de métodos específicos (requiere casting o variables específicas)
        // Esto demuestra que aunque se tratan como Usuarios, conservan su identidad
        if (usuarios[1] instanceof Moderador) {
            ((Moderador) usuarios[1]).papelerainc();
            System.out.println("Moderador ha enviado a papelera: " + ((Moderador) usuarios[1]).getPapelera());
        }
    }
}