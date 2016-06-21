<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

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

    <h3>create a question</h3>

    <div class="row">
        <div class="panel panel-default">
            <div class="row" style="padding: 1em">
                <div class="col-xs-6">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="ctg-select" class="col-xs-2">category:</label>
                            <div class="col-xs-10">
                                <select id="ctg-select">
                                    <c:forEach items="${catgs}" var="ctg">
                                        <option value="${ctg.categoryId}">${ctg.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-xs-2">title:</label>
                            <div class="col-xs-10">
                                <textarea style="resize: none" cols="100" rows="1" id="title"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-xs-2">what it's all about:</label>
                            <div class="col-xs-10">
                                <textarea style="resize: none" cols="100" rows="10" id="text"></textarea>
                            </div>
                        </div>

                        <div class="col-xs-10 col-xs-offset-2">
                            <button type="button" class="btn btn-primary" onclick="submit()">Post your question</button>
                            <button id="back" class="btn btn-default" onclick="window.history.back()">back</button>
                        </div>
                    </form>
                </div>
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
        var select = document.getElementById("ctg-select");
        ;
        var question = {
            description: document.getElementById("title").value,
            text: document.getElementById("text").value,
            categoryId: select.options[select.selectedIndex].value
        };

        $.ajax({
            url: 'add-question',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(question),
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
