<%--
  Created by IntelliJ IDEA.
  User: noa
  Date: 27/01/2022
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nouveau Match</title>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
</head>
<body>
    <h2>Créer un nouveau match :</h2>
    <p>Salut ${utilisateur.login} !</p>
    <form action="/admin/ajoutermatch" method="post">
        <div>
            <label for="sport">Sport :</label>
            <input type="text" id="sport" name="sport" required>
        </div><br/>
        <div>
            <label for="equipe1">Equipe 1 :</label>
            <input type="text" id="equipe1" name="equipe1" required>
        </div><br/>
        <div>
            <label for="equipe2">Equipe 2 :</label>
            <input type="text" id="equipe2" name="equipe2" required>
        </div><br/>
        <div>
            <label for="date">Date(YYYY-MM-JJ) :</label>
            <input type="text" id="date" name="date" required>
        </div><br/>
        <div>
            <label for="heure">HEURE(HH:MM) :</label>
            <input type="text" id="heure" name="heure" required>
        </div><br/>
        <div class="button">
            <br/><button type="submit" value="parier">Parier !</button>
        </div>
    </form>
    <a href="/pel/menu">Retour</a>
</body>
</html>
