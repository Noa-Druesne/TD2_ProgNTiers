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
    <title>Parier sur vos matchs !</title>
    <jsp:useBean id="match" scope="session" type="modele.Match"></jsp:useBean>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
    <jsp:useBean id="erreur" class="java.lang.String" scope="request"></jsp:useBean>
</head>
<body>
    <h2>Tu t'es donc décider à parier...</h2>
    <p>Choisis bien "${utilisateur.login}"</p>
    <p>Vous voulez parier sur le match : ${match.equipe1} vs ${match.equipe2} le ${match.quand}.</p>
    <c:if test = "${erreur.length()>0}">
        <span style="color: red";>
            <c:out value="${erreur}"></c:out><br/>
        </span>
    </c:if><br/>
    <form action="/pel/parier" method="post">
        <div>
            <label for="verdict">Verdict du match</label>
            <select name="verdict" id="verdict" required>
                <option value="nul">Match nul</option>
                <option value="${match.equipe1}">${match.equipe1}</option>
                <option value="${match.equipe2}">${match.equipe2}</option>
            </select>
        </div><br/>
        <div>
            <label for="mise" style="margin-top: 20px">Montant :</label>
            <input type="number" id="mise" name="mise" required>
        </div>
        <div class="button">
            <br/><button type="submit" value="parier">Parier !</button>
        </div>
    </form>
    <a href="/pel/menu">Retour</a>
</body>
</html>
