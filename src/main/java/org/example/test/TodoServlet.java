package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/TodoServlet")
public class TodoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String taskName = request.getParameter("taskName");
        String dueDate = request.getParameter("dueDate");
        String priority = request.getParameter("priority");

        TodoDao todoDao = new TodoDao();
        todoDao.addTask(userId, taskName, dueDate, priority);

        session.setAttribute("tasks", todoDao.getTasks(userId));
        response.sendRedirect("tasks.jsp");
    }
}
