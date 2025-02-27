<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
<h2>Willkommen</h2>

<!-- Registrieren Button oben rechts -->
<button class="register-btn" onclick="window.location.href='register.jsp'">Registrieren</button>

<div class="form-container">
    <form action="LoginServlet" method="post">
        <label for="username">Benutzername:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Passwort:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" class="btn">Anmelden</button>
    </form>
</div>
</body>
</html>
