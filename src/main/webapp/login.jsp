<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { background-color: #4A6FA5; color: white; text-align: center; }
        form { margin-top: 100px; }
    </style>
</head>
<body>
<h2>Willkommen</h2>
<% if (request.getParameter("error") != null) { %>
<p style="color: #ff0000; font-weight: bold; ">Falscher Benutzername oder Passwort!</p>
<% } %>
<form action="LoginServlet" method="post">
    Benutzername: <input type="text" name="username"><br><br>
    Passwort: <input type="password" name="password"><br><br>
    <input type="submit" value="Anmelden">
</form>
</body>
</html>