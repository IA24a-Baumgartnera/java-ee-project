<%@ page import="java.util.List, java.util.ArrayList, java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alle Aufgaben</title>
    <style>
        body { background-color: #4A6FA5; color: white; text-align: center; }
        .container { width: 50%; margin: auto; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid white; text-align: center; }
        th { font-size: 18px; }
        .task-input { width: 80%; padding: 5px; }
        .checkbox { width: 20px; height: 20px; }
        .btn-container { margin-top: 20px; }
        .btn { padding: 10px 20px; font-size: 16px; background-color: white; color: #4A6FA5; border: none; cursor: pointer; }
    </style>
</head>
<body>
<h2>Alle deine Aufgaben</h2>
<div class="container">
    <form action="DeleteTaskServlet" method="post">
        <table>
            <tr>
                <th>Wenig</th>
                <th>Mittel</th>
                <th>Hoch</th>
            </tr>
            <%
                List<String[]> tasks = (List<String[]>) session.getAttribute("tasks");
                if (tasks == null) {
                    tasks = new ArrayList<>();
                }

                List<String[]> wenigTasks = new ArrayList<>();
                List<String[]> mittelTasks = new ArrayList<>();
                List<String[]> hochTasks = new ArrayList<>();

                for (String[] task : tasks) {
                    switch (task[2]) {
                        case "Wenig": wenigTasks.add(task); break;
                        case "Mittel": mittelTasks.add(task); break;
                        case "Hoch": hochTasks.add(task); break;
                    }
                }

                Comparator<String[]> dateComparator = (task1, task2) -> task1[1].compareTo(task2[1]);
                wenigTasks.sort(dateComparator);
                mittelTasks.sort(dateComparator);
                hochTasks.sort(dateComparator);

                int maxRows = Math.max(wenigTasks.size(), Math.max(mittelTasks.size(), hochTasks.size()));
                for (int i = 0; i < maxRows; i++) {
            %>
            <tr>
                <td>
                    <% if (i < wenigTasks.size()) { %>
                    <input type='text' class='task-input' value='<%= wenigTasks.get(i)[0] + " - " + wenigTasks.get(i)[1] %>' readonly>
                    <input type='checkbox' name='task' value='<%= wenigTasks.get(i)[0] %>' class='checkbox'>
                    <% } %>
                </td>
                <td>
                    <% if (i < mittelTasks.size()) { %>
                    <input type='text' class='task-input' value='<%= mittelTasks.get(i)[0] + " - " + mittelTasks.get(i)[1] %>' readonly>
                    <input type='checkbox' name='task' value='<%= mittelTasks.get(i)[0] %>' class='checkbox'>
                    <% } %>
                </td>
                <td>
                    <% if (i < hochTasks.size()) { %>
                    <input type='text' class='task-input' value='<%= hochTasks.get(i)[0] + " - " + hochTasks.get(i)[1] %>' readonly>
                    <input type='checkbox' name='task' value='<%= hochTasks.get(i)[0] %>' class='checkbox'>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </table>
        <br>
        <div class="btn-container">
            <input type="submit" value="Erledigte Aufgaben loeschen" class="btn"><br><br>
            <button type="button" onclick="location.href='todo.jsp'" class="btn">Eine weitere Aufgabe hinzufuegen</button><br><br>
            <button type="button" onclick="location.href='LogoutServlet'" class="btn">Logout</button><br><br>
        </div>
    </form>
</div>
</body>
</html>
