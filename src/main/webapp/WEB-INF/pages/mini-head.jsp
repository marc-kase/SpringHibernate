<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<mini-head>
    <div class="row">
        <div class="col-sm-6"><span><h1>${param.title}</h1></span></div>
        <div class="col-sm-6 text-right">
            <c:choose>
                <c:when test="${param.loggedin eq 'true'}">
                    <a href="logout"><h4>sign out</h4></a>
                </c:when>
                <c:otherwise>
                    <a href="login"><h4>sign in</h4></a>
                </c:otherwise>
            </c:choose>


        </div>
    </div>
</mini-head>
