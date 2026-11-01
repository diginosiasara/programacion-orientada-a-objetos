public class Ruta {
    private Area[] areas;
    private int cantidadAreas;

    public Ruta(int capacidadAreas) {
        this.areas = new Area[capacidadAreas];
        this.cantidadAreas = 0;
    }

    public void agregarArea(Area unArea) {
        if (cantidadAreas < areas.length) {
            areas[cantidadAreas] = unArea;
            cantidadAreas++;
        } else {
            System.out.println("No se pueden agregar más áreas");
        }
    }

    public void destruirAreas() {
        areas = new Area[areas.length];
        cantidadAreas = 0;
        System.out.println("Todas las áreas han sido destruidas");
    }

    public Area[] getAreas() {
        return areas;
    }

    public int getCantidadAreas() {
        return cantidadAreas;
    }

    @Override
    public String toString() {
        return "Ruta [cantidadAreas=" + cantidadAreas + "]";
    }
}