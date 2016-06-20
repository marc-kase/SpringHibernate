<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <c:import url="mini-head.jsp">
        <c:param name="title" value="${heading}"/>
    </c:import>

    <h3>create a question</h3>


    <div class="table-container">
        <table class="table">
            <tbody>
            <tr>
                <td><label>Category:</label></td>
                <td>
                    <select id="ctg-select">
                        <c:forEach items="${catgs}" var="ctg">
                            <option value="${ctg.categoryId}">${ctg.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>title:</label></td>
                <td><textarea cols="100" rows="1" id="title"></textarea></td>
            </tr>
            <tr>
                <td><label>what it's all about:</label></td>
                <td><textarea cols="100" rows="10" id="text"></textarea></td>
            </tr>
            </tbody>
        </table>

        <div>
            <button type="button" class="btn pull-right" onclick="submit()">Post your question</button>
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

    </div>
</div>
</body>
</html>
