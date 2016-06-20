<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>

<ul>
    <li>
        <label for="username">Name: </label>
        <input type="text" id="username"/>
    </li>
    <li>
        <label for="email">EMmail: </label>
        <input type="text" id="email"/>
    </li>
    <li>
        <label for="pass">Password: </label>
        <input type="password" id="pass"/>
    </li>
    <li>
        <label for="role">Role: </label>
        <input type="text" id="role"/>
    </li>
</ul>
<button onclick="submitProfile()">Submit</button>

<script>
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

    function submitProfile() {
        var profile = {
            username: document.getElementById("username").value,
            email: document.getElementById("email").value,
            role: document.getElementById("role").value,
            pass: document.getElementById("pass").value
        };

        $.ajax({
            url: 'add-user',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(profile),
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
