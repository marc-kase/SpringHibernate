<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script type="text/javascript"
            src="http://code.jquery.com/jquery-1.9.1.js">
    </script>
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
