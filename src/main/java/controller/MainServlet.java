package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.User;

@WebServlet(name = "MainServlet", urlPatterns = {"/main"})
public class MainServlet extends HttpServlet {

    private final UserController userController = new UserController();

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Recibir el nombre enviado desde index.jsp
        String username = request.getParameter("username");

        // Verificar que el nombre exista
        if (username == null || username.trim().isEmpty()) {
            response.sendRedirect(
                    request.getContextPath() + "/index.jsp"
            );
            return;
        }

        // Crear el objeto usuario
        User user = userController.getUser(username.trim());

        // IMPORTANTE: enviar el objeto con el nombre "user"
        request.setAttribute("user", user);

        // Avanzar hacia la vista sin recargar index.jsp
        request.getRequestDispatcher("/userView.jsp")
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
}