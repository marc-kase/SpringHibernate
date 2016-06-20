<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>

  <script type="text/javascript"
          script src="http://code.jquery.com/jquery-1.9.1.js">
  </script>
</head>
<body>

<input id="uid" type="hidden" value="${uid}">
<input id="qid" type="hidden" value="${qid}">
<ul>
  <li>
    <label for="text">Answer: </label>
    <input type="text" id="text"/>
  </li>
</ul>
<button onclick="submit()">Submit</button>

<script>
  function submit() {
    var answer = {
      questId: document.getElementById("qid").value,
      userId: document.getElementById("uid").value,
      text: document.getElementById("text").value
    };

    $.ajax({
      url: 'add-answer',
      type: 'POST',
      dataType: 'json',
      data: JSON.stringify(answer),
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
