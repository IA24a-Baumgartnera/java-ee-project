<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrieren</title>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
<div class="form-container">
    <h2>Registrieren</h2>

    <%-- Fehler anzeigen --%>
    <% if (request.getParameter("error") != null) { %>
    <p class="error-message">
        <% if ("2".equals(request.getParameter("error"))) { %> Benutzername existiert bereits! <% } %>
        <% if ("3".equals(request.getParameter("error"))) { %> Fehler bei der Registrierung! <% } %>
    </p>
    <% } %>

    <%-- Erfolgreiche Registrierung --%>
    <% if (request.getParameter("success") != null) { %>
    <p class="success-message">Registrierung erfolgreich! Jetzt anmelden.</p>
    <% } %>

    <%-- Registrierungsformular --%>
    <form action="RegisterServlet" method="post">
        <label for="username">Benutzername:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Passwort:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" class="btn">Registrieren</button>
    </form>

    <%-- Button zum Zurückkehren zur Login-Seite --%>
    <button onclick="location.href='login.jsp'" class="btn">Zurück zur Login-Seite</button>
</div>
</body>
</html>
