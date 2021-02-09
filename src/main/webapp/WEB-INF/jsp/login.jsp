<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/user/login">
<%--    <span style="color: red;font-weight: bold">${error}</span>--%>
    <a>${error}</a>
    用户名：<input type="text" name="username" placeholder="username" required> <br>
    密码：<input type="password" name="psw" placeholder="password" required> <br>
    <input type="submit" value="提交">
</form>
</body>
</html>
