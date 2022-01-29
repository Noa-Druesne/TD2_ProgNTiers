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
    <title>Annulation</title>
    <jsp:useBean id="pari" scope="request" type="modele.Pari"></jsp:useBean>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
</head>
<body>
    <h2>Pfff, tu annules ton pari ?? Sérieux...</h2>
    <p>C'est ton choix après tout "${utilisateur.login}".</p>
    <p>La mise de ${pari.montant} euros sur la victoire de : ${pari.vainqueur} pour le match : ${pari.match.equipe1} vs ${pari.match.equipe2} le ${pari.match.quand} a bien été annulée.</p>
    <a href="/pel/mesparis">Voir mes paris</a>
</body>
</html>
