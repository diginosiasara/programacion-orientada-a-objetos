/**
 * ============================================================================
 * PREGUNTA 2: GESTIÓN DE MEMORIA EN LA CREACIÓN Y DESTRUCCIÓN DE OBJETOS
 * ============================================================================
 *
 * 1) CREACIÓN DE OBJETOS
 *    - Se realiza mediante el operador 'new', que solicita al sistema un bloque
 *      de memoria en el HEAP (memoria dinámica) del tamaño necesario para
 *      almacenar los atributos de instancia del objeto.
 *    - A continuación se invoca al constructor de la clase, que inicializa
 *      los atributos con los valores proporcionados o por defecto.
 *    - Las variables locales y referencias se almacenan en el STACK (pila de
 *      ejecución), mientras que el objeto en sí reside en el HEAP.
 *    - El recolector de basura (Garbage Collector, GC) añade una cabecera a
 *      cada objeto con metadatos (tipo, tamaño, marcas de GC, monitor, etc.).
 *
 * 2) DESTRUCCIÓN DE OBJETOS
 *    - En Java el programador NO libera memoria manualmente (no existe 'free'
 *      ni 'delete' como en C/C++). La destrucción es AUTOMÁTICA.
 *    - El Garbage Collector identifica objetos que ya no son alcanzables desde
 *      ninguna variable raíz (GC Roots) y libera su memoria.
 *    - Algoritmos habituales del GC:
 *        • Mark-Sweep (marcado y barrido): marca los objetos alcanzables y
 *          luego barre los no marcados.
 *        • Copying (copiado): mueve los objetos vivos a una nueva zona de
 *          memoria, eliminando la fragmentación externa.
 *        • Reference Counting: cada objeto lleva un contador de referencias;
 *          cuando llega a 0 se libera.
 *        • Generacional: divide el heap en zonas (young/old generation)
 *          porque la mayoría de los objetos mueren joven.
 *    - Antes de Java 9 existía el método finalize(), que permitía ejecutar
 *      código justo antes de la recolección. Hoy está desaconsejado.
 *    - Para recursos externos (ficheros, sockets) se usa try-with-resources
 *      o el interfaz AutoCloseable.
 *
 * 3) ESPACIO DE VIDA
 *    - Transitorios: variables locales, resultados de expresiones.
 *    - Persistentes: objetos que sobreviven a la ejecución del programa
 *      (bases de datos, ficheros).
 *
 * ============================================================================
 * PREGUNTA 3: ESTRUCTURAS DE DATOS MÁS HABITUALES
 * ============================================================================
 *
 * A) ESTRUCTURAS LINEALES
 *    • Arrays/Arreglos: colección contigua de elementos del mismo tipo,
 *      acceso directo por índice. Tamaño fijo.
 *    • Listas enlazadas: nodos con dato + puntero al siguiente.
 *        - Simples: un solo enlace.
 *        - Dobles: enlace al siguiente y al anterior.
 *        - Circulares: el último apunta al primero.
 *    • Pilas (Stack): LIFO (Last In, First Out). Operaciones push/pop.
 *    • Colas (Queue): FIFO (First In, First Out). Operaciones enqueue/dequeue.
 *        - Colas de prioridad: cada elemento tiene prioridad asociada.
 *        - Colas dobles (Deque): inserción/eliminación por ambos extremos.
 *
 * B) ESTRUCTURAS NO LINEALES
 *    • Árboles: estructura jerárquica con raíz y nodos hijos.
 *        - Árboles binarios: cada nodo tiene ≤ 2 hijos.
 *        - BST (Binary Search Tree): ordenación izquierda < raíz < derecha.
 *        - AVL / Rojo-Negro: árboles binarios autoequilibrados.
 *        - Árboles B / B+: usados en bases de datos y sistemas de ficheros.
 *    • Grafos: conjunto de nodos (vértices) y aristas que los conectan.
 *        - Dirigidos / no dirigidos, ponderados / no ponderados.
 *        - Se representan con matrices de adyacencia o listas de adyacencia.
 *
 * C) ESTRUCTURAS BASADAS EN DISPERSIÓN
 *    • Tablas Hash (HashMap): asocian clave → valor mediante una función hash.
 *      Acceso promedio O(1).
 *    • Conjuntos (Set): colección sin elementos duplicados.
 *
 * D) EN LENGUAJES ORIENTADOS A OBJETOS (Java)
 *    Java proporciona el framework java.util.Collections que agrupa:
 *
 *    Interfaces principales:
 *      • Collection   → raíz de la jerarquía.
 *      • List         → colección ordenada con duplicados (ArrayList, LinkedList).
 *      • Set          → colección sin duplicados (HashSet, TreeSet, LinkedHashSet).
 *      • Queue        → colas (PriorityQueue, ArrayDeque).
 *      • Map          → pares clave-valor (HashMap, TreeMap, LinkedHashMap).
 *
 *    Características OO:
 *      - Polimorfismo: se programa contra interfaces, no contra implementaciones.
 *      - Encapsulamiento: la estructura interna está oculta al cliente.
 *      - Reutilización: las mismas interfaces sirven para múltiples estructuras.
 *      - Genéricos (desde Java 5): permiten colecciones tipadas List<T>.
 *      - Iteradores: patrón Iterator para recorrer colecciones de forma uniforme.
 *
 * ============================================================================
 */
public class Explicaciones {
    // Esta clase es únicamente documental.
}