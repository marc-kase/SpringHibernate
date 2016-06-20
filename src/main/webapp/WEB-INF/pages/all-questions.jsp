<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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

<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <sec:authorize var="loggedIn" access="isAuthenticated()"/>
                <c:import url="mini-head.jsp">
                    <c:param name="title" value="${heading}"/>
                    <c:param name="loggedin" value="${loggedIn}"/>
                </c:import>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <ul style="white-space:nowrap;">
                        <li>categories:</li>
                        <li><a href="#">all</a></li>
                        <c:forEach var="ctg" items="${catgs}">
                            <li><a href="#">${ctg.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <form action="add-question-form" method="get" style="margin-right: 16px" class="pull-right">
                        <input type="submit" value="ask question"/>
                    </form>
                </div>
            </div>

            <c:forEach var="q" items="${quests}">
                <div class="well">
                    <div>
                        <p>${fn:length(q.answers)} answer(s)
                            <a href="question?id=${q.questionId}"><span style="font-size: large; margin-left: 8em">${q.description}</span></a>
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
        </div>
    </div>
</div>
</body>
</html>
