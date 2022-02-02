<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:useBean id="erreur" class="java.lang.String" scope="request"></jsp:useBean>
</head>
<body>
    <h2>Veuillez entrez vos informations : </h2>
    <c:if test = "${erreur.length()>0}">
        <span style="color: red";>
            <c:out value="${erreur}"></c:out><br/>
        </span>
    </c:if>
    <form action="/pel/connexion" method="post" style="margin-top: 15px">
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
