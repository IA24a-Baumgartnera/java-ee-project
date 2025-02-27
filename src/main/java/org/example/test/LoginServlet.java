package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("LoginServlet wurde aufgerufen!");
        System.out.println(" Benutzername: " + username);
        System.out.println(" Passwort: " + password);

        UserDao userDao = new UserDao();
        boolean login = userDao.validateUser(username, password);
        System.out.println("Login: " + login);
        if (login) {
            System.out.println(" Benutzer erfolgreich gefunden!");
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("todo.jsp"); // Erfolgreich eingeloggt
        } else {
            System.out.println("Fehler: Benutzername oder Passwort falsch!");
            response.sendRedirect("login.jsp?error=1"); // Fehlerhafte Login-Daten
        }
    }
}
