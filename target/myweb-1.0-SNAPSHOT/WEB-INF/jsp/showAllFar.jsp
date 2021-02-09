<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="${pageContext.request.contextPath}/favorite/toAddFar">增加收藏</a>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>name</th>
                <th>content</th>
                <th>url</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="fa" items="${list}">
                <tr>
                    <td>${fa.favoriteName}</td>
                    <td>${fa.content}</td>
                    <td>${fa.farUrl}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/favorite/toUpdateFar?favoriteId=${fa.favoriteId}">修改</a>
                        &nbsp; | &nbsp;
                        <a href="${pageContext.request.contextPath}/favorite/deleteFar?favoriteId=${fa.favoriteId}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
