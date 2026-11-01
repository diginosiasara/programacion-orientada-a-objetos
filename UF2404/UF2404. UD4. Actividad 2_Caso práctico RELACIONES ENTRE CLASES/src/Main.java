public class Main {
    public static void main(String[] args) {
        System.out.println("=== SISTEMA DE TRANSPORTE ===\n");
        
        // Crear conductor
        Conductor conductor1 = new Conductor("Juan Pérez", "B-12345");
        System.out.println(conductor1);
        
        // Crear Auto (Herencia - rel3)
        Auto auto = new Auto(conductor1, 4, "Toyota");
        System.out.println(auto);
        
        // Agregar ruedas (Agregación - rel2)
        Rueda rueda1 = new Rueda(17, "Verano");
        Rueda rueda2 = new Rueda(17, "Verano");
        Rueda rueda3 = new Rueda(17, "Verano");
        Rueda rueda4 = new Rueda(17, "Verano");
        
        auto.agregarRueda(rueda1);
        auto.agregarRueda(rueda2);
        auto.agregarRueda(rueda3);
        auto.agregarRueda(rueda4);
        
        System.out.println("Tipo de vehículo: " + auto.tipoVehiculo());
        System.out.println("Capacidad de pasajeros: " + auto.capacidadPasajeros());
        
        // Crear Moto (Herencia - rel3)
        Conductor conductor2 = new Conductor("María García", "A-67890");
        Moto moto = new Moto(conductor2, false, "250cc");
        System.out.println("\n" + moto);
        System.out.println("Tipo de vehículo: " + moto.tipoVehiculo());
        System.out.println("Capacidad de pasajeros: " + moto.capacidadPasajeros());
        
        // Crear Viaje (Implementación de InterfaceA)
        Viaje viaje1 = new Viaje("Madrid", "2024-12-25");
        System.out.println("\n" + viaje1.obtenerInformacion());
        viaje1.iniciarViaje();
        viaje1.planificarViaje(auto); // Dependencia - rel6
        viaje1.finalizarViaje();
        
        // Crear Ruta con Áreas (Composición - rel5)
        Ruta ruta1 = new Ruta(3);
        Area area1 = new Area("Centro", 5.0);
        Area area2 = new Area("Norte", 10.0);
        Area area3 = new Area("Sur", 8.0);
        
        ruta1.agregarArea(area1);
        ruta1.agregarArea(area2);
        ruta1.agregarArea(area3);
        
        System.out.println("\nRuta creada con " + ruta1.getCantidadAreas() + " áreas");
        
        // Crear RutaViaje (Clase de Asociación - rel4)
        RutaViaje rutaViaje1 = new RutaViaje(viaje1, ruta1);
        System.out.println("\n" + rutaViaje1.obtenerDetallesRutaViaje());
        
        // Destruir áreas de la ruta
        ruta1.destruirAreas();
        System.out.println("Áreas después de destruir: " + ruta1.getCantidadAreas());
        
        // ==========================================
        // SEGUNDO DIAGRAMA: JERARQUÍA DE EMPLEADOS
        // ==========================================
        System.out.println("\n\n=== SISTEMA DE EMPLEADOS ===\n");
        
        // Crear Profesor (Herencia del Diagrama 2)
        Profesor prof1 = new Profesor("Dr. García", "12345678A", 3500.0, 
                                      "Informática", "Programación");
        System.out.println(prof1);
        System.out.println("Tipo: " + prof1.tipoEmpleado());
        System.out.println("Puesto: " + prof1.descripcionPuesto());
        
        // Crear PAS (Herencia del Diagrama 2)
        PAS pas1 = new PAS("Ana López", "87654321B", 2200.0, 
                          "Administración", "Secretaria");
        System.out.println("\n" + pas1);
        System.out.println("Tipo: " + pas1.tipoEmpleado());
        System.out.println("Puesto: " + pas1.descripcionPuesto());
        
        System.out.println("\n=== FIN DEL PROGRAMA ===");
    }
}