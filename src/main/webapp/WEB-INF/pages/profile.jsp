<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script type="text/javascript"
            script src="http://code.jquery.com/jquery-1.9.1.js">
    </script>
</head>
<body>

<input id="userId" type="hidden" value="${user.userId}">
<input id="username" type="text" value="${user.username}">
<input id="email" type="text" value="${user.email}">
<input id="role" type="text" value="${user.role.role}">

<button id="submit" onclick="submitProfile()">Submit</button>

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
            }, error: function (){
                alert("error");
            }
        });
    }
</script>
</body>
</html>
