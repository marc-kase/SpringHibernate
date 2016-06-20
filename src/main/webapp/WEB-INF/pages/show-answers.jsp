<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>

<h3>Client ${question.username} asks: '${question.text}'</h3>
<p/>
<h4>Available answers:</h4>
<form action="add-answer-form" method="get">
  <input type="submit" value="Add New"/>
  <input type="hidden" name="qid" value="${question.id}">
</form>


<table>
  <thead>
  <th>ID</th>
  <th>ANSWER</th>
  <th>USERNAME</th>
  </thead>
  <tbody>
  <c:forEach var="a" items="${answers}">
    <tr>
      <td>${a.id}</td>
      <td>${a.text}</td>
      <td></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
