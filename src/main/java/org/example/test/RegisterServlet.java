package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        if (userDao.registerUser(username, password)) {
            response.sendRedirect("login.jsp?success=1"); // Erfolgreiche Registrierung
        } else {
            response.sendRedirect("register.jsp?error=2"); // Benutzername existiert bereits
        }
    }
}
