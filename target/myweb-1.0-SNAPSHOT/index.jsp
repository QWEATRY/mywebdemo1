<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/2/7
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>首页</h3>
    <h3><a href="${pageContext.request.contextPath}/user/toLogin">登录</a></h3>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">创建用户</a>
</body>
</html>
