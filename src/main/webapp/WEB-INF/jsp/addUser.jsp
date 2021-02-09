<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建用户</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="${pageContext.request.contextPath}/user/addUser" method="post">

    <a>${error}</a>
    <div class="form-group">
        <label>用户名</label>
        <input type="text" name="userName" class="form-control" placeholder="username" required>
    </div>
    <div class="form-group">
        <label>密码</label>
        <input type="password" name="userPassword" class="form-control" placeholder="password" required>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>
