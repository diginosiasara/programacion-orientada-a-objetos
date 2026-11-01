public class Solucion {

    // ============================================================
    // SOLUCIÓN 1: Usando una clase contenedora (RECOMENDADA)
    // ============================================================
    public static void incrementarPorReferencia(Contenedor cont) {
        cont.incrementar();
        System.out.println("  [Solución 1] Valor dentro del método: " + cont.getValor());
    }

    // ============================================================
    // SOLUCIÓN 2: Usando un array de un elemento
    // ============================================================
    public static void incrementarConArray(int[] n) {
        n[0]++;
        System.out.println("  [Solución 2] Valor dentro del método: " + n[0]);
    }

    // ============================================================
    // SOLUCIÓN 3: Retornando el valor modificado (enfoque funcional)
    // ============================================================
    public static int incrementarConRetorno(int n) {
        n++;
        System.out.println("  [Solución 3] Valor dentro del método: " + n);
        return n;
    }
}