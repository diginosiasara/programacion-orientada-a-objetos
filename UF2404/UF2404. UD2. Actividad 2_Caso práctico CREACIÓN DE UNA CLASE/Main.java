/**
 * Clase principal para probar la clase Persona
 */
public class Main {
    public static void main(String[] args) {
        System.out.println("============================================");
        System.out.println("  PRUEBA DE LA CLASE PERSONA");
        System.out.println("============================================\n");
        
        // Prueba 1: Constructor por defecto
        System.out.println("--- Prueba 1: Constructor por defecto ---");
        Persona persona1 = new Persona();
        System.out.println(persona1.toString());
        System.out.println();
        
        // Prueba 2: Constructor con nombre, edad y sexo
        System.out.println("--- Prueba 2: Constructor con nombre, edad y sexo ---");
        Persona persona2 = new Persona("María García", 25, 'M');
        persona2.setPeso(65.0);
        persona2.setAltura(1.65);
        System.out.println(persona2.toString());
        System.out.println();
        
        // Prueba 3: Constructor con todos los atributos
        System.out.println("--- Prueba 3: Constructor con todos los atributos ---");
        Persona persona3 = new Persona("Juan López", 17, 'H', 75.0, 1.80);
        System.out.println(persona3.toString());
        System.out.println();
        
        // Prueba 4: Verificar métodos específicos
        System.out.println("--- Prueba 4: Verificación de métodos ---");
        System.out.println("¿" + persona2.getNombre() + " es mayor de edad? " + 
                          (persona2.esMayorDeEdad() ? "Sí" : "No"));
        System.out.println("¿" + persona3.getNombre() + " es mayor de edad? " + 
                          (persona3.esMayorDeEdad() ? "Sí" : "No"));
        System.out.println();
        
        // Prueba 5: Probar cálculo de IMC
        System.out.println("--- Prueba 5: Cálculo de IMC ---");
        Persona personaBajoPeso = new Persona("Ana", 30, 'M', 50.0, 1.70);
        Persona personaPesoIdeal = new Persona("Carlos", 35, 'H', 75.0, 1.78);
        Persona personaSobrepeso = new Persona("Luis", 40, 'H', 95.0, 1.75);
        
        System.out.println(personaBajoPeso.getNombre() + ": " + personaBajoPeso.toString());
        System.out.println(personaPesoIdeal.getNombre() + ": " + personaPesoIdeal.toString());
        System.out.println(personaSobrepeso.getNombre() + ": " + personaSobrepeso.toString());
        System.out.println();
        
        // Prueba 6: Verificar validación de sexo
        System.out.println("--- Prueba 6: Validación de sexo ---");
        Persona persona4 = new Persona("Test", 20, 'X'); // Sexo incorrecto
        System.out.println("Sexo introducido: 'X', Sexo asignado: '" + persona4.getSexo() + "'");
        System.out.println();
        
        // Prueba 7: Verificar generación de DNI
        System.out.println("--- Prueba 7: Generación de DNI ---");
        System.out.println("DNI generado para persona1: " + persona1.getDni());
        System.out.println("DNI generado para persona2: " + persona2.getDni());
        System.out.println("DNI generado para persona3: " + persona3.getDni());
        System.out.println();
        
        System.out.println("============================================");
        System.out.println("  FIN DE LAS PRUEBAS");
        System.out.println("============================================");
    }
}