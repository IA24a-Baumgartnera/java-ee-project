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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = tododatabase.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT id FROM users WHERE username = ? AND password = ?")) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
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
}
