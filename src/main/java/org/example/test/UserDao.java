package org.example.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    // Methode zum Validieren des Benutzers (Login)
    public boolean validateUser(String username, String password) {
        String query = "SELECT id FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DbConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            System.out.println("hallo");
            return rs.next(); // Falls Benutzer existiert, TRUE

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean registerUser(String username, String password){
        String query = "Insert into users(username, password)" + username + " AND" + password;

    }
}
