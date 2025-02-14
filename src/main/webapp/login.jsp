<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
<h2>Willkommen</h2>

<!-- Registrieren Button oben rechts -->
<button class="register-btn" onclick="location.href='register.jsp'">Registrieren</button>

<div class="form-container">
    <form action="LoginServlet" method="post">
        <label>Benutzername:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Passwort:</label><br>
        <input type="password" name="password" required><br><br>

        <button type="submit" class="btn">Anmelden</button>
    </form>
</div>
</body>
</html>
