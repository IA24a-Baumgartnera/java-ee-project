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
import java.util.stream.Collectors;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] completedTasks = request.getParameterValues("task");
        HttpSession session = request.getSession();
        List<String[]> tasks = (List<String[]>) session.getAttribute("tasks");

        if (tasks != null && completedTasks != null) {
            tasks = tasks.stream()
                    .filter(task -> !List.of(completedTasks).contains(task[0]))
                    .collect(Collectors.toList());
            session.setAttribute("tasks", tasks);
        }

        response.sendRedirect("tasks.jsp");
    }
}