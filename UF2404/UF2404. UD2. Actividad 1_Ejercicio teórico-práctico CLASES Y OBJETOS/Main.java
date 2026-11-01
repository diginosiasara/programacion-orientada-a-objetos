public class Main {
    public static void main(String[] args) {
        // Crear array de Entregables (polimorfismo)
        Entregable[] listado = new Entregable[4];
        
        // 3 series y 2 videojuegos
        listado[0] = new Serie("Breaking Bad", "Vince Gilligan");
        listado[1] = new Serie("Stranger Things", 4, "Ciencia Ficcion", "Los Duffer");
        listado[2] = new Serie();
        listado[3] = new Videojuego("Zelda", 50, "Aventura", "Nintendo");
        
        // Probar compareTo en Series
        Serie s1 = (Serie) listado[0];
        Serie s2 = (Serie) listado[1];
        System.out.println("Comparando series: " + s1.compareTo(s2));
        
        // Probar compareTo en Videojuegos
        Videojuego v1 = (Videojuego) listado[3];
        Videojuego v2 = new Videojuego("Mario", 20);
        System.out.println("Comparando videojuegos: " + v1.compareTo(v2));
        
        // Probar entregar y devolver
        listado[0].entregar();
        System.out.println("Serie entregada: " + listado[0].isEntregado());
        
        listado[0].devolver();
        System.out.println("Serie devuelta: " + listado[0].isEntregado());
        
        // Mostrar todas las series
        for (int i = 0; i < listado.length; i++) {
            System.out.println(listado[i].toString());
        }
    }
}