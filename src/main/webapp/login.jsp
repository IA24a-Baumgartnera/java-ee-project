<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { background-color: #4A6FA5; color: white; text-align: center; font-size: 20px; }
        form { margin-top: 120px; font-size: 22px; }
        .btn { border: none; color: #4A6FA5; background-color: white; font-size: 18px; padding: 8px 16px; cursor: pointer; }
        input[type="text"], input[type="password"] {
            font-size: 20px;
            padding: 8px;
            width: 220px;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
<h2>Willkommen</h2>
<% if (request.getParameter("error") != null) { %>
<p style="color: #ff0000; font-weight: bold;">Falscher Benutzername oder Passwort!</p>
<% } %>
<form action="LoginServlet" method="post">
    Benutzername: <input type="text" name="username"><br><br>
    Passwort: <input type="password" name="password"><br><br>
    <input type="submit" value="Anmelden" class="btn">
</form>
</body>
</html>
