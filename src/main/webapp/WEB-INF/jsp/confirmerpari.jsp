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
    <title>Paris confirmer !</title>
    <jsp:useBean id="match" scope="session" type="modele.Match"></jsp:useBean>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
    <jsp:useBean id="winner" type="java.lang.String" scope="request"></jsp:useBean>
    <jsp:useBean id="mise" type="java.lang.Double" scope="request"></jsp:useBean>
</head>
<body>
    <h3>Voilà ton pari "${utilisateur.login}" !</h3>
    <p>Vous avez parié ${mise} euros sur la victoire de : ${winner} pour le match : ${match.equipe1} vs ${match.equipe2} le ${match.quand}.</p>
    <a href="/pel/mesparis">Voir mes paris</a>
</body>
</html>
