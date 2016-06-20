<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="add-quest-form" method="get">
    <input type="submit" value="Add New"/>
</form>

<table>
    <thead>
    <th>ID</th>
    <th>Question</th>
    <th>Username</th>
    <th>Category</th>
    <th>UID</th>
    <th>CID</th>
    </thead>
    <tbody>
    <c:forEach var="q" items="${quests}">

        <tr>
            <td>${q.id}</td>
            <td>
                <c:set var="answers">
                    <c:url value="show-answers">
                        <c:param name="qid" value="${q.id}"/>
                    </c:url>
                </c:set>
                <a href="${answers}">${q.text}</a>
            </td>
            <td>${q.username}</td>
            <td>${q.category}</td>
            <td>${q.categoryId}</td>
            <td>${q.userId}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
