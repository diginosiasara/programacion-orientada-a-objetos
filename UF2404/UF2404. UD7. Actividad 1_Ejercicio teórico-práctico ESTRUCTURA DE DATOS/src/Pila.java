/**
 * Implementación genérica de una Pila (estructura LIFO).
 * Se utiliza un array dinámico (basado en Object[]) para almacenar los elementos.
 */
public class Pila<T> {
    private Object[] elementos;
    private int tope;
    private static final int CAPACIDAD_INICIAL = 10;

    public Pila() {
        elementos = new Object[CAPACIDAD_INICIAL];
        tope = -1;
    }

    /** Apila un elemento en la cima de la pila. */
    public void apilar(T elemento) {
        if (elemento == null) {
            throw new IllegalArgumentException("No se pueden apilar elementos nulos");
        }
        if (tope == elementos.length - 1) {
            redimensionar();
        }
        elementos[++tope] = elemento;
    }

    /** Desapila y devuelve el elemento en la cima. */
    @SuppressWarnings("unchecked")
    public T desapilar() {
        if (estaVacia()) {
            throw new IllegalStateException("La pila está vacía");
        }
        T elemento = (T) elementos[tope];
        elementos[tope--] = null; // Permite al GC liberar el objeto
        return elemento;
    }

    /** Devuelve el elemento en la cima sin retirarlo. */
    @SuppressWarnings("unchecked")
    public T cima() {
        if (estaVacia()) {
            throw new IllegalStateException("La pila está vacía");
        }
        return (T) elementos[tope];
    }

    /** Indica si la pila no contiene elementos. */
    public boolean estaVacia() {
        return tope == -1;
    }

    /** Devuelve el número de elementos almacenados. */
    public int tamano() {
        return tope + 1;
    }

    /** Duplica la capacidad del array interno cuando se llena. */
    private void redimensionar() {
        Object[] nuevo = new Object[elementos.length * 2];
        System.arraycopy(elementos, 0, nuevo, 0, elementos.length);
        elementos = nuevo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Pila[");
        for (int i = 0; i <= tope; i++) {
            sb.append(elementos[i]);
            if (i < tope) sb.append(", ");
        }
        sb.append("]");
        return sb.toString();
    }
}