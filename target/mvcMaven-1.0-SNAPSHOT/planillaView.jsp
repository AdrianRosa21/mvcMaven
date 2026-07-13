<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Empleado"%>

<%
    List<Empleado> empleados
            = (List<Empleado>) request.getAttribute("empleados");

    Double totalPlanilla
            = (Double) request.getAttribute("totalPlanilla");

    /*
     * Evita abrir directamente planillaView.jsp
     * sin pasar por PlanillaServlet.
     */
    if (empleados == null || totalPlanilla == null) {

        response.sendRedirect(
                request.getContextPath() + "/planilla"
        );

        return;
    }

    NumberFormat formatoMoneda
            = NumberFormat.getCurrencyInstance(Locale.US);
%>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Planilla de empleados</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container py-5">

        <div class="card shadow-lg border-0">

            <div class="card-header bg-success text-white py-4">

                <div class="d-flex flex-column flex-md-row
                            justify-content-between align-items-md-center">

                    <div>

                        <h1 class="h3 mb-1">
                            Planilla de empleados
                        </h1>

                        <p class="mb-0">
                            Información estática de cinco empleados
                        </p>

                    </div>

                    <span class="badge bg-light text-success fs-6 mt-3 mt-md-0">

                        Total de empleados:
                        <%= empleados.size() %>

                    </span>

                </div>

            </div>

            <div class="card-body p-4">

                <div class="table-responsive">

                    <table class="table table-striped
                                  table-hover table-bordered
                                  align-middle">

                        <thead class="table-dark">

                            <tr>

                                <th>#</th>

                                <th>Nombre</th>

                                <th>Apellido</th>

                                <th>Área</th>

                                <th class="text-end">
                                    Sueldo
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            <%
                                int numero = 1;

                                for (Empleado empleado : empleados) {
                            %>

                            <tr>

                                <td>
                                    <%= numero %>
                                </td>

                                <td>
                                    <%= empleado.getNombre() %>
                                </td>

                                <td>
                                    <%= empleado.getApellido() %>
                                </td>

                                <td>

                                    <span class="badge text-bg-info">

                                        <%= empleado.getArea() %>

                                    </span>

                                </td>

                                <td class="text-end fw-semibold">

                                    <%= formatoMoneda.format(
                                            empleado.getSueldo()
                                    ) %>

                                </td>

                            </tr>

                            <%
                                    numero++;
                                }
                            %>

                        </tbody>

                        <tfoot class="table-success">

                            <tr>

                                <th colspan="4"
                                    class="text-end">

                                    Total de planilla:

                                </th>

                                <th class="text-end">

                                    <%= formatoMoneda.format(
                                            totalPlanilla
                                    ) %>

                                </th>

                            </tr>

                        </tfoot>

                    </table>

                </div>

                <div class="d-flex flex-column flex-md-row gap-2">

                    <a
                        href="<%= request.getContextPath() %>/index.jsp"
                        class="btn btn-primary">

                        Volver al inicio

                    </a>

                    <button
                        type="button"
                        class="btn btn-outline-success"
                        onclick="window.print()">

                        Imprimir planilla

                    </button>

                </div>

            </div>

        </div>

    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>