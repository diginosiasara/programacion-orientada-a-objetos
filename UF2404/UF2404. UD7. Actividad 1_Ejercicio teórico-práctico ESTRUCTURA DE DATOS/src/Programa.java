/**
 * PROGRAMA PRINCIPAL
 * ============================================================================
 * PREGUNTA 1: Análisis de equilibrio de paréntesis en una expresión.
 *
 * Algoritmo:
 *   1. Recorremos la expresión carácter a carácter.
 *   2. Si encontramos '(' lo apilamos.
 *   3. Si encontramos ')' intentamos desapilar:
 *        - Si la pila está vacía  → la expresión NO está equilibrada.
 *        - Si desapilamos con éxito → continuamos.
 *   4. Al finalizar el recorrido, la expresión estará equilibrada
 *      únicamente si la pila queda vacía.
 *
 * Complejidad temporal: O(n)   (un único recorrido lineal)
 * Complejidad espacial: O(n)   (peor caso: todos los caracteres son '(')
 * ============================================================================
 */
public class Programa {

    public static void main(String[] args) {

        System.out.println("======================================================");
        System.out.println("  ANALIZADOR DE EQUILIBRIO DE PARÉNTESIS");
        System.out.println("======================================================\n");

        // Expresiones de prueba
        String[] expresiones = {
            "(a + b) * c",
            "((a + b) * (c - d))",
            "(a + b)) * c",           // Paréntesis de cierre de más
            "((a + b) * c",           // Paréntesis de apertura de más
            "a + b * c",              // Sin paréntesis (equilibrada)
            "((( )))",                // Anidamiento correcto
            ")(",                     // Orden incorrecto
            "((a + b) * (c - (d / e)))"
        };

        for (String expr : expresiones) {
            boolean equilibrada = verificarEquilibrio(expr);
            System.out.printf("Expresión: %-35s -> %s%n",
                              "\"" + expr + "\"",
                              equilibrada ? "✓ EQUILIBRADA" : "✗ NO EQUILIBRADA");
        }
    }

    /**
     * Verifica si una expresión tiene los paréntesis equilibrados.
     *
     * @param expresion cadena a analizar
     * @return true si está equilibrada, false en caso contrario
     */
    public static boolean verificarEquilibrio(String expresion) {
        Pila<Character> pila = new Pila<>();

        for (int i = 0; i < expresion.length(); i++) {
            char c = expresion.charAt(i);

            if (c == '(') {
                // Símbolo de apertura: apilar
                pila.apilar(c);
            } else if (c == ')') {
                // Símbolo de cierre: debe haber un '(' que coincida
                if (pila.estaVacia()) {
                    return false; // Cierre sin apertura → desequilibrio
                }
                pila.desapilar();
            }
            // Los demás caracteres se ignoran
        }

        // Al terminar, la pila debe estar vacía
        return pila.estaVacia();
    }
}