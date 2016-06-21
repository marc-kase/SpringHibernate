<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" script src="http://code.jquery.com/jquery-1.9.1.js">
    </script>
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
            <div class="row" style="padding: 1em">
                <div class="col-xs-6">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-xs-2">username:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="username" value="${user.username}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-xs-2">email:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="email" value="${user.email}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role" class="col-xs-2">role:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="role" value="${user.role.role}" readonly/>
                            </div>
                        </div>

                        <div class="col-xs-10 col-xs-offset-2">
                            <button id="submit" class="btn btn-primary" onclick="submitProfile()">save</button>
                            <button id="back" class="btn btn-default" onclick="window.history.back()">back</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<input id="userId" type="hidden" value="${user.userId}">

<script>
    function submitProfile() {
        var user = {
            userId: document.getElementById("userId").value,
            username: document.getElementById("username").value,
            email: document.getElementById("email").value,
            role: document.getElementById("role").value
        };

        $.ajax({
            url: 'edit-profile',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(user),
            contentType: 'application/json',
            success: function (data) {
                alert(data.status + ": " + data.message);
            }, error: function () {
                alert("error");
            }
        });
    }
</script>
</body>
</html>