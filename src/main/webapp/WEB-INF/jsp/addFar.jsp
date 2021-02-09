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
<form action="${pageContext.request.contextPath}/favorite/addFar" method="post">

    <input type="hidden" name="userId" value="<%=userId%>">

    <div class="form-group">
        <label>名称</label>
        <input type="text" name="favoriteName" class="form-control" placeholder="favoriteName" required>
    </div>
    <div class="form-group">
        <label>内容</label>
        <input type="text" name="content" class="form-control" placeholder="content" required>
    </div>
    <div class="form-group">
        <label>地址</label>
        <input type="text" name="farUrl" class="form-control" placeholder="farUrl" required>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>

</form>
</body>
</html>
