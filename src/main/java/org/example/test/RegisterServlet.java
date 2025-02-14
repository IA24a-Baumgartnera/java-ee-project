package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = tododatabase.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
             PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)")) {

            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Benutzername existiert bereits
                response.sendRedirect("register.jsp?error=2");
            } else {
                // Benutzer registrieren
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);
                insertStmt.executeUpdate();
                response.sendRedirect("register.jsp?success=1"); // Erfolgreich registriert
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=3");
        }
    }
}
