<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: noa
  Date: 27/01/2022
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmation du match</title>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
</head>
<body>
    <c:forEach var="match" items="${lastMatch}">
        <li>Sport : ${} | Equipe 1 : ${} | Equipe 2 : ${} | Date : ${} à bien été créer.<a href="/pel/parisouverts.jsp">Voir les matchs</a></li>
    </c:forEach>
</body>
</html>
