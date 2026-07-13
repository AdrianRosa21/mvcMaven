package model;

public class Empleado {

    private String nombre;
    private String apellido;
    private String area;
    private double sueldo;

    public Empleado() {
    }

    public Empleado(
            String nombre,
            String apellido,
            String area,
            double sueldo
    ) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.area = area;
        this.sueldo = sueldo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
}