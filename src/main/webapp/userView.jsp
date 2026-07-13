<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User user = (User) request.getAttribute("user");

    /*
     * Evita entrar directamente a userView.jsp
     * sin pasar por el Servlet.
     */
    if (user == null) {
        response.sendRedirect(
                request.getContextPath() + "/index.jsp"
        );

        return;
    }
%>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Información del usuario</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container py-5">

        <div class="row justify-content-center">

            <div class="col-md-7 col-lg-6">

                <div class="card shadow border-0">

                    <div class="card-header bg-primary text-white text-center py-4">

                        <h1 class="h3 mb-0">
                            Información del usuario
                        </h1>

                    </div>

                    <div class="card-body p-4">

                        <div class="alert alert-success">

                            Usuario encontrado correctamente.

                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-bold">
                                Nombre de usuario
                            </label>

                            <input
                                type="text"
                                class="form-control"
                                value="<%= user.getUsername() %>"
                                readonly>

                        </div>

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Contraseña
                            </label>

                            <input
                                type="text"
                                class="form-control"
                                value="<%= user.getPassword() %>"
                                readonly>

                        </div>

                        <div class="d-grid gap-2">

                            <a
                                href="<%= request.getContextPath() %>/index.jsp"
                                class="btn btn-primary">

                                Ingresar otro usuario

                            </a>

                            <a
                                href="<%= request.getContextPath() %>/planilla"
                                class="btn btn-success">

                                Ver planilla de empleados

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>