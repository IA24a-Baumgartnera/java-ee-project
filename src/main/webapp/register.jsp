<!DOCTYPE html>
<html lang="de">
<head>
    <title>Registrieren</title>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
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
    <label>Benutzername:</label><br>
    <input type="text" name="username" required><br><br>

    <label>Passwort:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit" class="btn">Registrieren</button><br><br>
</form>

<%-- Button zum Zurückkehren zur Login-Seite --%>
<button onclick="location.href='login.jsp'" class="btn">Zur&uuml;ck zur Login-Seite</button>

</body>
</html>
