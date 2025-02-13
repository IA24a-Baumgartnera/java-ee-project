package org.example.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;
import java.util.stream.Collectors;

@WebServlet("/TodoServlet")
public class TodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskName = request.getParameter("taskName");
        String dueDate = request.getParameter("dueDate");
        String priority = request.getParameter("priority");

        if (taskName == null || taskName.trim().isEmpty() || priority == null) {
            response.sendRedirect("todo.jsp?error=1");
            return;
        }

        HttpSession session = request.getSession();
        List<String[]> tasks = (List<String[]>) session.getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
        }

        tasks.add(new String[]{taskName, dueDate, priority});

        // Aufgaben sortieren nach Priorität
        tasks = tasks.stream()
                .sorted(Comparator.comparing(task -> task[2]))
                .collect(Collectors.toList());

        session.setAttribute("tasks", tasks);
        response.sendRedirect("tasks.jsp");
    }
}
