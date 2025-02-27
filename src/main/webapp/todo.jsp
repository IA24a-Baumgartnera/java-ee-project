<%@ page import="java.util.List, java.util.ArrayList, java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
  <title>To-Do Liste</title>
  <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>

<!-- Logout-Button oben rechts -->
<button type="button" onclick="location.href='LogoutServlet'" class="logout-btn">Logout</button>

<h2>To do</h2>

<div class="form-container">
  <form action="TodoServlet" method="post">
    <label>Aufgabenname:</label>
    <input type="text" name="taskName" required>

    <label>F&auml;lligkeitsdatum:</label>
    <input type="date" name="dueDate" required>

    <label>Priorit&auml;t:</label>
    <select name="priority">
      <option value="Wenig">Wenig</option>
      <option value="Mittel">Mittel</option>
      <option value="Hoch">Hoch</option>
    </select>

    <!-- Button zum Hinzufügen einer Aufgabe -->
    <button type="button" class="btn" onclick="location.href='tasks.jsp'">Aufgabe Hinzuf&uuml;gen</button>

    <!-- Neuer Button zum Direktzugriff auf die Task-Seite -->
    <button type="button" class="btn" onclick="location.href='tasks.jsp'">Zu den Aufgaben</button>
  </form>
</div>

</body>
</html>
