/**
 * Clase principal que demuestra el funcionamiento del sistema.
 * Aplica los conceptos de:
 *   - Clase abstracta
 *   - Herencia
 *   - Encapsulamiento
 *   - Polimorfismo
 *   - Ley de Demeter (acceso controlado)
 * 
 * @author UF2404 - Programación Orientada a Objetos
 * @version 1.0
 */
public class Principal {
    
    public static void main(String[] args) {
        System.out.println("==============================================");
        System.out.println("   SISTEMA DE GESTIÓN DE EMPLEADOS (POO)");
        System.out.println("==============================================\n");
        
        // No se puede instanciar una clase abstracta:
        // Empleado e = new Empleado(); // ❌ ERROR de compilación
        
        // Creamos vendedores con diferentes comisiones
        Vendedor v1 = new Vendedor("Ana", "García López", 30, 1200.0, 30.0);
        Vendedor v2 = new Vendedor("Luis", "Martínez Ruiz", 45, 1500.0, 60.0);
        
        // Creamos administrativos con diferentes antigüedades
        Administrativo a1 = new Administrativo("María", "Pérez Gómez", 35, 1400.0, 8);
        Administrativo a2 = new Administrativo("Juan", "López Sanz", 28, 1100.0, 2);
        
        // Mostramos datos iniciales
        System.out.println("--- DATOS INICIALES ---");
        v1.mostrarDatos();
        v2.mostrarDatos();
        a1.mostrarDatos();
        a2.mostrarDatos();
        
        // Aplicamos extras de sueldo (polimorfismo en acción)
        System.out.println("\n--- APLICANDO EXTRAS DE SUELDO ---");
        v1.extrasSueldo(200.0);  // Se aplica (comisión 30 < 45)
        v2.extrasSueldo(200.0);  // No se aplica (comisión 60 >= 45)
        a1.extrasSueldo(150.0);  // Se aplica (antigüedad 8 >= 5)
        a2.extrasSueldo(150.0);  // No se aplica (antigüedad 2 < 5)
        
        // Datos finales
        System.out.println("\n--- DATOS FINALES ---");
        v1.mostrarDatos();
        v2.mostrarDatos();
        a1.mostrarDatos();
        a2.mostrarDatos();
        
        // Demostración de POLIMORFISMO puro
        System.out.println("\n--- DEMOSTRACIÓN DE POLIMORFISMO ---");
        Empleado[] plantilla = { v1, v2, a1, a2 };
        
        System.out.println("Recorriendo la plantilla con un array de tipo Empleado:");
        for (Empleado emp : plantilla) {
            System.out.println("\nEmpleado: " + emp.getNombreCompleto());
            emp.extrasSueldo(100.0); // Cada uno ejecuta SU propia versión
        }
        
        System.out.println("\n==============================================");
        System.out.println("   Fin de la ejecución");
        System.out.println("==============================================");
    }
}