<!DOCTYPE html>
<html>
<head>
  <title>To-Do</title>
  <style>
    body { background-color: #4A6FA5; color: white; text-align: center; font-size: 20px; }
    form { margin-top: 120px; font-size: 22px; }
    .btn { background-color: white; color: #4A6FA5; border: none; font-size: 18px; padding: 6px 14px; cursor: pointer; border-radius: 10px; }
    .priority-select {
      font-size: 18px;
      padding: 5px;
      width: 150px;
      height: 32px;
      border-radius: 10px;
      background-color: white;
      color: #4A6FA5;
      border: 2px solid #4A6FA5;
      cursor: pointer;
      text-align: center;
    }
    .button-container {
      margin-top: 25px;
      transition: margin-top 0.3s ease;
    }
    .priority-select:focus ~ .button-container {
      margin-top: 90px;
    }
    input[type="text"], input[type="password"] {
      font-size: 20px;
      padding: 8px;
      width: 220px;
      margin-bottom: 12px;
      border-radius: 10px;
    }
    .logout-btn {
      position: absolute;
      top: 20px;
      right: 20px;
      padding: 10px 18px;
      font-size: 16px;
      background-color: white;
      color: #4A6FA5;
      border: none;
      cursor: pointer;
      border-radius: 10px;
    }
  </style>
</head>
<body>
<button type="button" onclick="location.href='LogoutServlet'" class="logout-btn">Logout</button>
<h2>To-Do Liste</h2>
<form action="TodoServlet" method="post">
  <label for="taskName">Aufgabenname:</label>
  <input type="text" name="taskName" id="taskName"><br><br>
  <label for="dueDate">Fälligkeitsdatum:</label>
  <input type="text" name="dueDate" id="dueDate"><br><br>
  <label for="priority">Priorität:</label>
  <select name="priority" id="priority" class="priority-select">
    <option value="Wenig">Wenig</option>
    <option value="Mittel">Mittel</option>
    <option value="Hoch">Hoch</option>
  </select>
  <div class="button-container">
    <br><input type="submit" value="Aufgabe Hinzufügen" class="btn"><br><br>
    <button type="button" onclick="location.href='tasks.jsp'" class="btn">Direkt zu meinen Aufgaben</button><br><br>
  </div>
</form>
</body>
</html>
