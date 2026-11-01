public class Main {

    public static void main(String[] args) {

        System.out.println("========================================");
        System.out.println("EJEMPLO ORIGINAL (PASO POR VALOR)");
        System.out.println("========================================");
        int n = 1;
        System.out.println("Valor de n en main antes de llamar al método: " + n);
        incrementar(n);
        System.out.println("Valor de n en main después de llamar al método: " + n);

        System.out.println("\n========================================");
        System.out.println("SOLUCIÓN 1: CLASE CONTENEDORA (Objeto)");
        System.out.println("========================================");
        Contenedor cont = new Contenedor(1);
        System.out.println("Valor en main antes: " + cont.getValor());
        Solucion.incrementarPorReferencia(cont);
        System.out.println("Valor en main después: " + cont.getValor());

        System.out.println("\n========================================");
        System.out.println("SOLUCIÓN 2: ARRAY DE UN ELEMENTO");
        System.out.println("========================================");
        int[] arrayN = {1};
        System.out.println("Valor en main antes: " + arrayN[0]);
        Solucion.incrementarConArray(arrayN);
        System.out.println("Valor en main después: " + arrayN[0]);

        System.out.println("\n========================================");
        System.out.println("SOLUCIÓN 3: RETORNANDO EL VALOR");
        System.out.println("========================================");
        int n2 = 1;
        System.out.println("Valor en main antes: " + n2);
        n2 = Solucion.incrementarConRetorno(n2);
        System.out.println("Valor en main después: " + n2);
    }

    // Método original del enunciado (paso por valor)
    public static void incrementar(int n) {
        n++;
        System.out.println("  [Original] Valor de n en el método después incrementar: " + n);
    }
}