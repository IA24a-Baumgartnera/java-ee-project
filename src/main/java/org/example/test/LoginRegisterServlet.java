package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginRegisterServlet")
public class LoginRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String action = request.getParameter("action");

        if ("Anmelden".equals(action)) {
            loginUser(request, response, username, password);
        } else if ("Registrieren".equals(action)) {
            registerUser(request, response, username, password);
        }
    }

    // 🔹 Login-Funktion
    private void loginUser(HttpServletRequest request, HttpServletResponse response, String username, String password) throws IOException {
        try (Connection conn = tododatabase.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT id FROM users WHERE username = ? AND password = ?")) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login erfolgreich
                HttpSession session = request.getSession();
                session.setAttribute("user_id", rs.getInt("id"));
                session.setAttribute("username", username);
                response.sendRedirect("todo.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }

    // 🔹 Registrierung-Funktion
    private void registerUser(HttpServletRequest request, HttpServletResponse response, String username, String password) throws IOException {
        try (Connection conn = tododatabase.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
             PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)")) {

            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Benutzername existiert bereits
                response.sendRedirect("login.jsp?error=2");
            } else {
                // Benutzer registrieren
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);
                int rowsInserted = insertStmt.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("login.jsp?success=1"); // Erfolgreich registriert
                } else {
                    response.sendRedirect("login.jsp?error=3"); // Registrierung fehlgeschlagen
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=3");
        }
    }
}
