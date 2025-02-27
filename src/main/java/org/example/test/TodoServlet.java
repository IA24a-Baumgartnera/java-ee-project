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
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/TodoServlet")
public class TodoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String aufgabeId = UUID.randomUUID().toString(); // Eindeutige ID generieren
        String beschreibung = request.getParameter("taskName");
        String status = "offen";  // Standardmäßig "offen"
        int kategorieId = Integer.parseInt(request.getParameter("kategorie"));
        int prioritaetId = Integer.parseInt(request.getParameter("priority"));

        try (Connection conn = DbConnector.getConnection()) {
            String sql = "INSERT INTO Aufgabe (Aufgabe_ID, user_id, Beschreibung, Status, Kategorie_ID, Priorität_ID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, aufgabeId);
            stmt.setInt(2, userId);
            stmt.setString(3, beschreibung);
            stmt.setString(4, status);
            stmt.setInt(5, kategorieId);
            stmt.setInt(6, prioritaetId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("tasks.jsp");
    }
}
