public class primera_aplicacion {

    public static void main(String[] args) {
        
        // --- RESPUESTA A LA PREGUNTA 1 ---
        System.out.println("Lo que se escriba más abajo entre las comillas");
        System.out.println("--------------------------------------------------");

        // --- RESPUESTA A LA PREGUNTA 2 ---
        try {
            // 1. Comprobamos si el usuario ha introducido exactamente 2 argumentos
            if (args.length < 2) {
                System.out.println("ERROR: Debes proporcionar dos números como argumentos.");
                System.out.println("Ejemplo de uso correcto: java primera_aplicacion 5 10");
                return; // Detenemos la ejecución aquí si faltan argumentos
            }

            // 2. Intentamos convertir los textos (String) en números decimales (double)
            // Si el usuario escribió letras en lugar de números, aquí saltará el error al catch
            double numero1 = Double.parseDouble(args[0]);
            double numero2 = Double.parseDouble(args[1]);

            // 3. Realizamos la suma
            double suma = numero1 + numero2;

            // 4. Mostramos el resultado por pantalla
            System.out.println("La suma de " + numero1 + " y " + numero2 + " es: " + suma);

        } 
        // Este bloque se ejecuta SOLO si hay un error al convertir el texto a número
        catch (NumberFormatException e) {
            System.out.println("ERROR DE FORMATO: Los argumentos deben ser números válidos. No se permiten letras o símbolos.");
        } 
        // Este bloque captura cualquier otro error inesperado
        catch (Exception e) {
            System.out.println("Ha ocurrido un error inesperado: " + e.getMessage());
        }
    }
}