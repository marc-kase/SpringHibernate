<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<c:import url="mini-head.jsp">
    <c:param name="title" value="${heading}"/>
</c:import>

<form action="add-user-form" method="get">
    <input type="submit" value="Add New"/>
</form>

<table>
    <thead>
    <th>ID</th>
    <th>Username</th>
    <th>Email</th>
    <th>Role</th>
    <th></th>
    </thead>
    <tbody>
    <c:forEach var="q" items="${users}">
        <tr>
            <td>${q.userId}</td>
            <td>${q.username}</td>
            <td>${q.email}</td>
            <td>${q.role.role}</td>
            <td><a href="profile?id=${q.userId}">edit</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
