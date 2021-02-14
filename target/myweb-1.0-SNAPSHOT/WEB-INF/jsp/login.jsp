<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <meta charset="utf-8">
	  <!-- Title and other stuffs -->
	  <title>登陆页面</title>
	  <meta name="keywords" content="Bootstrap后台管理系统" />
	  <meta name="description" content="Bootstrap后台管理系统" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="author" content="">
	  <!-- Stylesheets -->
	  <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
	  <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.css">
	  <link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
	  <link href="<%=basePath%>assets/css/bootstrap-responsive.css" rel="stylesheet">
	  
	  <!-- HTML5 Support for IE -->
	  <!--[if lt IE 9]>
<!--	  <script src="<%=basePath%>assets/js/html5shim.js"></script>-->
	  <script src="<%=basePath%>assets/js/html5shim.js"></script>
	  <![endif]-->
	
	  <!-- Favicon -->
	  <link rel="shortcut icon" href="<%=basePath%>assets/img/favicons/favicon.ico">

  </head>
  
  <body>
	    <!-- Form area -->
	<div class="admin-form">
	  <div class="container">
	
	    <div class="row">
	      <div class="col-md-12">
	        <!-- Widget starts -->
	            <div class="widget worange">
	              <!-- Widget head -->
	              <div class="widget-head">
	                <i class="icon-lock"></i> Login 
	              </div>
	
	              <div class="widget-content">
	                <div class="padd">
	                  <!-- Login form -->
	                  <form class="form-horizontal" action="${pageContext.request.contextPath}/user/login">
	                    <!-- Email -->
	                    <div class="form-group">
	                      <label class="control-label col-lg-3">用户名</label>
	                      <div class="col-lg-9">
	                        <input type="text" class="form-control" name="username" placeholder="Username">
	                      </div>
	                    </div>
	                    <!-- Password -->
	                    <div class="form-group">
	                      <label class="control-label col-lg-3">密码</label>
	                      <div class="col-lg-9">
	                        <input type="password" class="form-control" name="psw" placeholder="Password">
	                      </div>
	                    </div>
	                    <!-- Remember me checkbox and sign in button -->
	                    <div class="form-group">
						<div class="col-lg-9 col-lg-offset-3">
	                      <div class="checkbox">
	                        <label>
	                          <input type="checkbox"> Remember me
	                        </label>
							</div>
						</div>
						</div>
						  <div class="form-group">
						   <label style="color: red;font-weight: bold">${error}</label>
						  </div>
	                        <div class="col-lg-9 col-lg-offset-2">
								<button type="submit" class="btn btn-danger">登录</button>
								<button type="reset" class="btn btn-default">重置</button>
							</div>
	                    <br />
	                  </form>
					  
					</div>
	                </div>
	              
	                <div class="widget-foot">
	                  Not Registred? <a href="${pageContext.request.contextPath}/user/toAddUser">Register here</a>
	                </div>
	            </div>  
	      </div>
	    </div>
	  </div> 
	</div>
		
			
	
	<!-- JS -->
	<script src="<%=basePath%>assets/js/jquery.js"></script>
	<script src="<%=basePath%>assets/js/bootstrap.js"></script>
  </body>
</html>
