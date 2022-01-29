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
    <title>Menu</title>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
</head>
<body>
    <h3>Bonjour ${utilisateur.login} !</h3>
    <h1>MENU</h1>
        <ul>
        <li><a href="/pel/parisouverts">Affichez les matchs ouverts aux paris</a></li>
        <li><a href="/pel/mesparis">Affichez mes paris</a></li>
        <c:if test = "${utilisateur.admin == true}">
            <li><a href="/admin/nouveaumatch">Ajouter un nouveau match</a></li>
        </c:if>
        <li><a href="/pel/deconnexion">Se déconnecter</a></li>
    </ul>

</body>
</html>
