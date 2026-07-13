<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Inicio MVC</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container min-vh-100 d-flex align-items-center justify-content-center">

        <div class="card shadow-lg border-0"
             style="max-width: 520px; width: 100%;">

            <div class="card-body p-5 text-center">

                <h1 class="text-primary mb-3">
                    Aplicación MVC
                </h1>

                <p class="text-secondary">
                    Ingresa tu nombre para mostrar la información del usuario.
                </p>

                <div id="mensaje"></div>

                <button
                    type="button"
                    class="btn btn-primary btn-lg w-100 mb-3"
                    onclick="solicitarNombre()">

                    Ingresar nombre

                </button>

                <a
                    href="<%= request.getContextPath() %>/planilla"
                    class="btn btn-outline-success w-100">

                    Ver planilla de empleados

                </a>

            </div>

        </div>

    </div>

    <script>

        function solicitarNombre() {

            const nombre = prompt(
                "Escribe el nombre del usuario:"
            );

            if (nombre === null || nombre.trim() === "") {

                document.getElementById("mensaje").innerHTML = `
                    <div class="alert alert-warning">
                        Debes escribir un nombre para continuar.
                    </div>
                `;

                return;
            }

            const ruta =
                "<%= request.getContextPath() %>/main?username="
                + encodeURIComponent(nombre.trim());

            window.location.href = ruta;
        }

        /*
         * Mostrar el prompt automáticamente
         * cuando cargue la página.
         */
        window.addEventListener("load", solicitarNombre);

    </script>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>