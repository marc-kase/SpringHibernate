<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title></title>

    <style>
        ul {
            overflow-x: hidden;
            white-space: nowrap;
            width: 100%;
        }

        li {
            display: inline;
        }
    </style>
</head>
<body>
<form action="add-quest-form" method="get">
    <input type="submit" value="ask question"/>
</form>

<ul style="white-space:nowrap;">
    <li>categories:</li>
    <li><a href="#">all</a></li>
    <c:forEach var="ctg" items="${catgs}">
        <li><a href="#">${ctg.name}</a></li>
    </c:forEach>
</ul>

<ul>
    <c:forEach var="q" items="${quests}">
        <div>
            <div>
                <p>${fn:length(q.answers)} answer(s)
                    <a href="question?id=${q.questionId}">${q.description}</a>
                </p>
            </div>
            <div>
                <c:import url="mini-footer.jsp">
                    <c:param name="categoryName" value="${q.category.name}"/>
                    <c:param name="date" value="${q.date}"/>
                    <c:param name="userName" value="${q.user.username}"/>
                    <c:param name="userId" value="${q.user.userId}"/>
                </c:import>
            </div>
        </div>
    </c:forEach>
</ul>
</body>
</html>
