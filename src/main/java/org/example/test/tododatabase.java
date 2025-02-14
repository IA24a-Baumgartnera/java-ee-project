package org.example.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.lang.ClassNotFoundException;  // <--- Diesen Import hinzufügen!

public class tododatabase {
    private static final String URL = "jdbc:mysql://localhost:3306/todo_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";  // Passe deinen Benutzernamen an
    private static final String PASSWORD = "";  // Falls du ein Passwort hast, hier eintragen

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Lade den MySQL-Treiber
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Fehler beim Laden des JDBC-Treibers!");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
