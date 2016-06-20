<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<mini-footer>
    <div class="row">
        <div class="col-sm-6">category: ${param.categoryName}</div>
        <div class="col-sm-6 text-right">
            Publish date: ${param.date}
            <a href="profile?id=${param.userId}">${param.userName}</a>
        </div>
    </div>
</mini-footer>
