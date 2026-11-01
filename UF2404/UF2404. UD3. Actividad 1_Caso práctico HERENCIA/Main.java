public class Main {
    public static void main(String[] args) {
        // Crear un vehículo genérico
        Vehiculo v1 = new Vehiculo(1, 1001);
        System.out.println("Vehículo original: " + v1);
        
        // Cambiar propiedades del vehículo
        v1.pinta(2);
        v1.cambiaNumeroSerie(2002);
        System.out.println("Vehículo modificado: " + v1);
        
        System.out.println();
        
        // Crear un coche
        Coche c1 = new Coche(3, 3001, 1600);
        System.out.println("Coche original: " + c1);
        
        // Cambiar propiedades del coche (heredadas y propias)
        c1.pinta(4);
        c1.cambiaNumeroSerie(4004);
        c1.setCilindrada(2000);
        System.out.println("Coche modificado: " + c1);
        
        System.out.println();
        
        // Crear una bicicleta
        Bicicleta b1 = new Bicicleta(5, 5001);
        System.out.println("Bicicleta original: " + b1);
        
        // Cambiar propiedades de la bicicleta
        b1.pinta(6);
        b1.cambiaNumeroSerie(6006);
        System.out.println("Bicicleta modificada: " + b1);
    }
}