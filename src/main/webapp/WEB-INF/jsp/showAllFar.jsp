<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userId=(Integer)request.getSession().getAttribute("userId");
%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="${pageContext.request.contextPath}/favorite/toAddFar">增加收藏</a>
<a href="${pageContext.request.contextPath}/user/deleteUser?userId=<%=userId%>">注销用户</a>
<form action="${pageContext.request.contextPath}/favorite/queryFar" method="post" class="form-inline" >
    <span style="color: red;font-weight: bold">${error}</span>
    <input type="text" name="queryFar" class="form-control" placeholder="请输入">
    <input type="submit" value="查询" class="btn btn-primary">
</form>
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
