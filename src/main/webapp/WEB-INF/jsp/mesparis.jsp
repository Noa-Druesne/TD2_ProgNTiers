<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: noa
  Date: 11/01/2022
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mes paris</title>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
    <jsp:useBean id="pari" scope="request" type="java.util.Collection"></jsp:useBean>
</head>
<body>
    <h2>Voici vos paris !!</h2>
    <p>J'éspère que vous allez perdre toutes votre oseille "${utilisateur.login}".</p>
    <p>Comme ça, vous faites comme Hugo et vous rejouez et on s'enrichit sur votre dos :)</p>
    <ul>
        <c:forEach var="paris" items="${pari}">
            <li>Sport : ${paris.match.sport} - ${paris.match.equipe1} vs ${paris.match.equipe2} - le ${paris.match.quand}. Mise de ${paris.montant} euros sur ${paris.vainqueur}. <a href="/pel/annuler?id=${paris.getIdPari()}"> Annuler</a> </li>
        </c:forEach>
    </ul>
    <a href="/pel/menu">Retour</a>
</body>
</html>
