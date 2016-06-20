<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<html>
<head>
    <title>Question</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="${ctx}/fw/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h2 class="span12">${quest.description}</h2>
            </div>
            <div class="well">
                <h3>${quest.text}</h3>

                <c:set var="answs" value="${quest.answers}"/>

                <div>
                    <c:import url="mini-footer.jsp">
                        <c:param name="categoryName" value="${quest.category.name}"/>
                        <c:param name="date" value="${quest.date}"/>
                        <c:param name="userName" value="${quest.user.username}"/>
                        <c:param name="userId" value="${quest.user.userId}"/>
                    </c:import>
                </div>
            </div>

            <div class="panel-body">
                <c:forEach var="ans" items="${answs}">
                    <div class="well">
                        <h3>${ans.information}</h3>
                        <div>
                            <c:import url="mini-footer.jsp">
                                <c:param name="categoryName" value="${quest.category.name}"/>
                                <c:param name="date" value="${ans.date}"/>
                                <c:param name="userName" value="${ans.user.username}"/>
                                <c:param name="userId" value="${ans.user.userId}"/>
                            </c:import>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>
</body>
</html>
