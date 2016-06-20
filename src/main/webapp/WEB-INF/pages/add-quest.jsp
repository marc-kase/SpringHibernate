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
<ul>
  <li>
    <label for="ctg-select">Category: </label>
    <select id="ctg-select">
      <c:forEach items="${cid}" var="ctg">
        <option value="${ctg.id}">${ctg.name}</option>
      </c:forEach>
    </select>
  </li>
  <li>
    <label for="text">Question: </label>
    <input type="text" id="text"/>
  </li>
</ul>
<button onclick="submit()">Submit</button>

<script>
  function submit() {
    var select = document.getElementById("ctg-select");;
    var question = {
      text: document.getElementById("text").value,
      categoryId: select.options[select.selectedIndex].value,
      userId: document.getElementById("uid").value
    };

    $.ajax({
      url: 'add-question',
      type: 'POST',
      dataType: 'json',
      data: JSON.stringify(question),
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
