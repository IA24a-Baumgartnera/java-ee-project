<%@ page import="java.util.List, java.util.ArrayList, java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
  <title>To-Do Liste</title>
  <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>

<%-- Logout-Button --%>
<button type="button" onclick="location.href='LogoutServlet'" class="logout-btn">Logout</button>

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
  </form>
</div>

</body>
</html>
