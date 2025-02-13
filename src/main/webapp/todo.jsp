<!DOCTYPE html>
<html>
<head>
  <title>To-Do</title>
  <style>
    body { background-color: #4A6FA5; color: white; text-align: center; }
    form { margin-top: 100px; }
  </style>
</head>
<body>
<h2>To-Do Liste</h2>
<form action="TodoServlet" method="post">
  Aufgabenname: <input type="text" name="taskName"><br><br>
  Faelligkeitsdatum: <input type="text" name="dueDate"><br><br>
  Prioritaet: <select name="priority">
  <option value="Wenig">Wenig</option>
  <option value="Mittel">Mittel</option>
  <option value="Hoch">Hoch</option>
</select><br><br>
  <input type="submit" value="Aufgabe Hinzufuegen">
</form>
</body>
</html>