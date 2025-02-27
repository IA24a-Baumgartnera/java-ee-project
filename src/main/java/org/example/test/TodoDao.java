package org.example.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TodoDao {

    public void addTask(int userId, String taskName, String dueDate, String priority) {
        String query = "INSERT INTO tasks (user_id, task_name, due_date, priority) VALUES (?, ?, ?, ?)";

        try (Connection conn = DbConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            stmt.setString(2, taskName);
            stmt.setString(3, dueDate);
            stmt.setString(4, priority);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String[]> getTasks(int userId) {
        List<String[]> tasks = new ArrayList<>();
        String query = "SELECT task_name, due_date, priority FROM tasks WHERE user_id = ? ORDER BY due_date";

        try (Connection conn = DbConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tasks.add(new String[]{rs.getString("task_name"), rs.getString("due_date"), rs.getString("priority")});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
