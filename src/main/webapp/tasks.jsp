<%@ page import="java.util.List, java.util.ArrayList, java.util.Comparator" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alle Aufgaben</title>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css?v=2">

</head>
<body>
<button type="button" onclick="location.href='LogoutServlet'" class="logout-btn">Logout</button>
<h2>Alle deine Aufgaben</h2>

<div class="task-container">
    <div class="task-column">
        <h3>Wenig</h3>
        <%
            List<String[]> tasks = (List<String[]>) session.getAttribute("tasks");
            if (tasks == null) {
                tasks = new ArrayList<>(); // Falls null, wird eine leere Liste verwendet
            }
            for (String[] task : tasks) {
                if (task.length >= 3 && "Wenig".equals(task[2])) {
        %>
        <div class="task-item">
            <input type='text' class='task-input' value='<%= task[0] + " - " + task[1] %>' readonly>
            <input type='checkbox' name='task' value='<%= task[0] %>' class='checkbox'>
        </div>
        <% } } %>
    </div>

    <div class="task-column">
        <h3>Mittel</h3>
        <% for (String[] task : tasks) {
            if (task.length >= 3 && "Mittel".equals(task[2])) { %>
        <div class="task-item">
            <input type='text' class='task-input' value='<%= task[0] + " - " + task[1] %>' readonly>
            <input type='checkbox' name='task' value='<%= task[0] %>' class='checkbox'>
        </div>
        <% } } %>
    </div>

    <div class="task-column">
        <h3>Hoch</h3>
        <% for (String[] task : tasks) {
            if (task.length >= 3 && "Hoch".equals(task[2])) { %>
        <div class="task-item">
            <input type='text' class='task-input' value='<%= task[0] + " - " + task[1] %>' readonly>
            <input type='checkbox' name='task' value='<%= task[0] %>' class='checkbox'>
        </div>
        <% } } %>
    </div>
</div>

<div class="btn-container">
    <form action="DeleteTaskServlet" method="post">
        <input type="submit" value="Erledigte Aufgaben l&ouml;schen" class="btn">
    </form>
    <button type="button" onclick="location.href='todo.jsp'" class="btn">Eine weitere Aufgabe hinzuf&uuml;gen</button>
</div>
</body>
</html>
