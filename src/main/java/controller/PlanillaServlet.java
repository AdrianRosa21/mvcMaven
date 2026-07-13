package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Empleado;

@WebServlet(
        name = "PlanillaServlet",
        urlPatterns = {"/planilla"}
)
public class PlanillaServlet extends HttpServlet {

    private final EmpleadoController empleadoController
            = new EmpleadoController();

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        // Obtener los cinco empleados estáticos
        List<Empleado> empleados
                = empleadoController.obtenerEmpleados();

        // Calcular el total de la planilla
        double totalPlanilla = empleados.stream()
                .mapToDouble(Empleado::getSueldo)
                .sum();

        // Mandar los datos hacia la vista
        request.setAttribute("empleados", empleados);
        request.setAttribute("totalPlanilla", totalPlanilla);

        // Mostrar la tabla
        request.getRequestDispatcher("/planillaView.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet encargado de mostrar la planilla";
    }
}