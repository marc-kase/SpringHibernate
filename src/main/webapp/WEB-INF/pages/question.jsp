<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Question</title>

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
    <sec:authorize var="loggedIn" access="isAuthenticated()"/>
    <c:import url="mini-head.jsp">
        <c:param name="title" value="${heading}"/>
        <c:param name="loggedin" value="${loggedIn}"/>
    </c:import>

    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="span12">${quest.description}</h2>
            </div>
            <div class="well">
                <h3>${quest.text}</h3>

                <c:set var="answs" value="${quest.answers}"/>

                <c:import url="mini-footer.jsp">
                    <c:param name="categoryName" value="${quest.category.name}"/>
                    <c:param name="date" value="${quest.date}"/>
                    <c:param name="userName" value="${quest.user.username}"/>
                    <c:param name="userId" value="${quest.user.userId}"/>
                </c:import>
            </div>

            <div class="panel-body">
                <c:forEach var="ans" items="${answs}">
                    <div class="well">
                        <h4>${ans.information}</h4>
                        <c:import url="mini-footer.jsp">
                            <c:param name="categoryName" value="${quest.category.name}"/>
                            <c:param name="date" value="${ans.date}"/>
                            <c:param name="userName" value="${ans.user.username}"/>
                            <c:param name="userId" value="${ans.user.userId}"/>
                        </c:import>
                    </div>
                </c:forEach>

                <c:if test="${loggedIn}" >
                    <div class="well">
                        <input type="hidden" id="questionId" value="${quest.questionId}">
                        <h4>Your answer</h4>
                        <textarea id="text" class="form-control" style="min-width: 100%"></textarea>
                        <br>
                        <button type="button" class="btn btn-primary" onclick="submit()">post</button>
                        <button class="btn btn-default" onclick="window.history.back()">back</button>
                        <br>
                    </div>
                </c:if>

                <c:if test="${not loggedIn}" >
                    <div>
                        <button class="btn btn-primary" onclick="window.history.back()">back</button>
                    </div>
                </c:if>
            </div>

        </div>
    </div>
</div>

<script>
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

    function submit() {
        var answer = {
            questionId: document.getElementById("questionId").value,
            information: document.getElementById("text").value
        };

        $.ajax({
            url: 'add-answer',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(answer),
            contentType: 'application/json',
            success: function (data) {
                alert(data.status + ": " + data.message);
                location.reload();
            }, error: function (data) {
                alert(data.status + ": " + data.message);
            }
        });
    }
</script>
</body>
</html>
