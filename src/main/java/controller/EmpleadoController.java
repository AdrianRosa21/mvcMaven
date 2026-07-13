package controller;

import java.util.Arrays;
import java.util.List;

import model.Empleado;

public class EmpleadoController {

    public List<Empleado> obtenerEmpleados() {

        /*
         * Datos estáticos:
         * no se necesita base de datos.
         */
        return Arrays.asList(

                new Empleado(
                        "Ana",
                        "López",
                        "Desarrollo",
                        850.00
                ),

                new Empleado(
                        "Carlos",
                        "Martínez",
                        "Soporte Técnico",
                        700.00
                ),

                new Empleado(
                        "María",
                        "Hernández",
                        "Recursos Humanos",
                        750.00
                ),

                new Empleado(
                        "José",
                        "Ramírez",
                        "Contabilidad",
                        800.00
                ),

                new Empleado(
                        "Sofía",
                        "García",
                        "Diseño",
                        725.00
                )
        );
    }
}