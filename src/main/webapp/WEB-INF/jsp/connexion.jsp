<%--
  Created by IntelliJ IDEA.
  User: noa
  Date: 11/01/2022
  Time: 09:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
    <h2>Veuillez entrez vos informations : </h2>
    <form action="/pel/connexion" method="post">
        <div>
            <label for="name">Nom :</label>
            <input type="text" id="name" name="user_name" style="margin-left: 53px">
        </div>
        <div>
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="user_password">
        </div>
        <div class="button">
            <br/><button type="submit" value="connexion">Envoyez</button>
        </div>
    </form>
</body>
</html>
