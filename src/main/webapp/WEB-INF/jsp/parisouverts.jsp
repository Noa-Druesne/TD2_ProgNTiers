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
    <title>Paris ouverts</title>
    <jsp:useBean id="matchs" scope="request" type="java.util.Collection"></jsp:useBean>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
</head>
<body>
    <h2>Alors alors alors...</h2>
    <h3>J'ai l'impression que "${utilisateur.login}" veux parier...</h3>
    <p>Bonne chance champion !</p>
    <ul>
        <c:forEach var="match" items="${matchs}">
            <li>Sport : ${match.sport} - ${match.equipe1} vs ${match.equipe2} - <a href="/pel/pariermatch?id=${match.idMatch}">Parier</a></li>
        </c:forEach>
    </ul>
    <a href="/pel/menu">Retour</a>
</body>
</html>
