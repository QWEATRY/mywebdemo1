<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Integer userId= (Integer) request.getSession().getAttribute("userId");
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <meta charset="utf-8">
	  <!-- Title and other stuffs -->
	  <title>Bootstrap响应式后台管理系统</title> 
	  <meta name="keywords" content="Bootstrap后台管理系统" />
	  <meta name="description" content="Bootstrap后台管理系统" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="author" content="">
	  <!-- Stylesheets -->
	  <link href="<%=basePath%>assets/style/bootstrap.css" rel="stylesheet">
	  <!-- Font awesome icon -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/font-awesome.css">
	  <!-- jQuery UI -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/jquery-ui.css">
	  <!-- Calendar -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/fullcalendar.css">
	  <!-- prettyPhoto -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/prettyPhoto.css">
	  <!-- Star rating -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/rateit.css">
	  <!-- Date picker -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/bootstrap-datetimepicker.min.css">
	  <!-- CLEditor -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/jquery.cleditor.css">
	  <!-- Uniform -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/uniform.default.css">
	  <!-- Bootstrap toggle -->
	  <link rel="stylesheet" href="<%=basePath%>assets/style/bootstrap-switch.css">
	  <!-- Main stylesheet -->
	  <link href="<%=basePath%>assets/style/style.css" rel="stylesheet">
	  <!-- Widgets stylesheet -->
	  <link href="<%=basePath%>assets/style/widgets.css" rel="stylesheet">

	  <link href="<%=basePath%>assets/style/prettyPhoto.css" rel="stylesheet">

	  <link href="<%=basePath%>assets/style/jquery-ui.css" rel="stylesheet">

<%--	  <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
	  
	  <!-- HTML5 Support for IE -->
	  <!--[if lt IE 9]>
<!--	  <script src="<%=basePath%>assets/js/html5shim.js"></script>-->
	  <script src="<%=basePath%>assets/js/html5shim.js"></script>
	  <!--[endif]-->
	
	  <!-- Favicon -->
	  <link rel="shortcut icon" href="<%=basePath%>assets/img/favicon/favicon.png">

      <script type="text/javascript">
          function checkUsername() {
              var xmlHttp=new XMLHttpRequest();
              xmlHttp.onreadystatechange=function () {
              	if(xmlHttp.readyState==4&&xmlHttp.status==200){
					alert("删除成功");
				}
			  };
			  xmlHttp.open("get","${pageContext.request.contextPath}/favorite/deleteFar?favoriteId="+favoriteId,true);
              xmlHttp.send();
          }
      </script>

  </head>
  
  <body>
	    <div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
	  
	    <div class="conjtainer">
	      <!-- Menu button for smallar screens -->
	      <div class="navbar-header">
			  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
				<span>Menu</span>
			  </button>
			  <!-- Site name for smallar screens -->
			  <a href="<%=basePath%>index.html" class="navbar-brand hidden-lg">MacBeth</a>
			</div>

	      <!-- Navigation starts -->
	      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         

	        <!-- Links -->
	        <ul class="nav navbar-nav pull-right">
	          <li class="dropdown pull-right">            
	            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
	              <i class="icon-user"></i> Admin <b class="caret"></b>              
	            </a>
	            
	            <!-- Dropdown menu -->
	            <ul class="dropdown-menu">
	              <li><a href="${pageContext.request.contextPath}/user/logout"><i class="icon-off"></i> Logout</a></li>
				  <li><a href="${pageContext.request.contextPath}/user/deleteUser?userId=<%=userId%>" onclick="doAjax()"><i class="icon-off"></i> write off</a></li>
<%--				  <li><a onclick="doAjax()" href="${pageContext.request.contextPath}/index.jsp"><i class="icon-off"></i> write off</a></li>--%>
	            </ul>
	          </li>
	          
	        </ul>
	      </nav>
	
	    </div>
	  </div>
	
	
	<!-- Header starts -->
	  <header>
	    <div class="container">
	      <div class="row">
	
	        <!-- Logo section -->
	        <div class="col-md-4">
	          <!-- Logo. -->
	           <div class="logo">
	            <h1><a href="#">Mac<span class="bold"></span></a></h1>
	            <p class="meta">后台管理系统</p>
	          </div>
	          <!-- Logo ends -->
	        </div>

	        <!-- Data section -->
	
	        <div class="col-md-4">
	          <div class="header-data">
	
	            <!-- Traffic data -->
	            <div class="hdata">
	              <div class="mcol-left">
	                <!-- Icon with red background -->
	                <i class="icon-signal bred"></i> 
	              </div>
	              <div class="mcol-right">
	                <!-- Number of visitors -->
	                <p><a href="#">7000</a> <em>visits</em></p>
	              </div>
	              <div class="clearfix"></div>
	            </div>
	
	            <!-- Members data -->
	            <div class="hdata">
	              <div class="mcol-left">
	                <!-- Icon with blue background -->
	                <i class="icon-user bblue"></i> 
	              </div>
	              <div class="mcol-right">
	                <!-- Number of visitors -->
	                <p><a href="#">3000</a> <em>users</em></p>
	              </div>
	              <div class="clearfix"></div>
	            </div>
	
	            <!-- revenue data -->
	            <div class="hdata">
	              <div class="mcol-left">
	                <!-- Icon with green background -->
	                <i class="icon-money bgreen"></i> 
	              </div>
	              <div class="mcol-right">
	                <!-- Number of visitors -->
	                <p><a href="#">5000</a><em>orders</em></p>
	              </div>
	              <div class="clearfix"></div>
	            </div>                        
	
	          </div>
	        </div>
	
	      </div>
	    </div>
	  </header>
	
	<!-- Header ends -->
	
	<!-- Main content starts -->
	
	<div class="content">
	
	  	<!-- Sidebar -->
	    <div class="sidebar">
	        <div class="sidebar-dropdown"><a href="#">Navigation</a></div>
	
	        <!--- Sidebar navigation -->
	        <ul id="nav" style="display: block;">
	          <!-- Main menu with font awesome icon -->
	          <li><a href="${pageContext.request.contextPath}/favorite/showAllFar"><i class="icon-table"></i> 收藏</a></li>
	          <li><a href="#"><i class="icon-calendar"></i> Calendar</a></li>
	        </ul>

			<div class="clearfix"></div>

	    </div>
	    <!-- Sidebar ends -->
	
	  	<!-- Main bar -->
	  	<div class="mainbar">
	
	      <!-- Page heading -->
	      <div class="page-head">
	        <h2 class="pull-left"><i class="icon-file-alt"></i> 收藏列表</h2>
	
	        <!-- Breadcrumb -->
	        <div class="bread-crumb pull-right">
	          <a href="<%=basePath%>index.jsp"><i class="icon-home"></i> Home</a>
	          <!-- Divider -->
<%--	          <span class="divider">/</span> --%>
<%--	          <a href="#" class="bread-current">Dashboard</a>--%>
	        </div>
	
	        <div class="clearfix"></div>
	
	      </div>
	      <!-- Page heading ends -->
	
		    <!-- Matter -->
	
		    <div class="matter">
	        <div class="container">
	          <div class="row">
	            <div class="col-md-12">
	
	              <div class="widget">
	                <div class="widget-head">
	                  <div class="pull-left">收藏</div>
	                  <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
	                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
	                  </div>  
	                  <div class="clearfix"></div>
	                </div>
	                <div class="widget-content">
	                  <div class="padd invoice">
	                    
	                    <div class="row">
	
	                      <div class="col-md-4">
	                        <h4>MacBeath</h4>
	                        <p>
	                          19/133, New New York Street<br>
	                          Near Bus Stop, Right side <br>
	                          Mexico, NY - 63442<br>
	                          USA
	                        </p>
	                      </div>
	
	                      <div class="col-md-4">
	                        <h4>MacMedia</h4>
	                        <p>
	                          24/133, Mexico Street<br>
	                          Near Airport, Right side <br>
	                          Mexico, CA - 53432<br>
	                          Mexico
	                        </p>                        
	                      </div>
	
	                      <div class="col-md-4">
	                        <h4>Invoice</h4>
	                        <p>
	                          Invoice No : 52322<br>
	                          Date : 12/34/2012<br>
	                          Account No : 4290293203
	                        </p>
	                      </div>
	
	                    </div>

						  <div class="widget-foot">

							  <form class="col-md-4" role="search" action="${pageContext.request.contextPath}/favorite/queryFar">
								  <div class="form-group inline" >
									  <a style="color: red;font-weight: bold">${error}</a>
									  <input type="text" class="form-control" placeholder="请输入搜索内容" name="queryFar">
									  <span class="add-on">
									  <input type="submit" class="btn btn-default pull-right" value="查询">
									  </span>
								  </div>
							  </form>

							  <a href="${pageContext.request.contextPath}/favorite/toAddFar"><button class="btn btn-default pull-right" >添加收藏</button></a>
							  <div class="clearfix"></div>
						  </div>

	                    <div class="row">

	                      <div class="col-md-12">
	                        <hr />
	                        <table class="table table-striped table-hover table-bordered">
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
									  <td><a href="${pageContext.request.contextPath}/favorite/toUrl?url=${fa.farUrl}">${fa.farUrl}</a> </td>
									  <td>
										  <a href="${pageContext.request.contextPath}/favorite/toUpdateFar?favoriteId=${fa.favoriteId}">修改</a>
										  &nbsp; | &nbsp;
										  <a href="${pageContext.request.contextPath}/favorite/deleteFar?favoriteId=${fa.favoriteId}">删除</a>
<%--										  <a onclick="doA(${fa.favoriteId})">删除</a>--%>
<%--										  <button onclick="doA(${fa.favoriteId})">删除</button>--%>
									  </td>
								  </tr>
							  </c:forEach>
	                          </tbody>
	                        </table>

	                      </div>
	
	                    </div>
	
	                  </div>
	                </div>
	              </div>  
	              
	            </div>
	          </div>
	        </div>
			  </div>
	
	    </div>
	
	   <!-- Mainbar ends -->	    	
	   <div class="clearfix"></div>
	
	</div>
	<!-- Content ends -->
	
	<!-- Footer starts -->
	<footer>
	  <div class="container">
	    <div class="row">
	      <div class="col-md-12">
	            <!-- Copyright info -->
			  <div class="clearfix"></div>
	            <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
	      </div>
	    </div>
	  </div>
	</footer> 	
	
	<!-- Footer ends -->
	
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
	
	<!-- JS -->
	<script src="<%=basePath%>assets/js/jquery.js"></script> <!-- jQuery -->
	<script src="<%=basePath%>assets/js/bootstrap.js"></script> <!-- Bootstrap -->
	<script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
	<script src="<%=basePath%>assets/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="<%=basePath%>assets/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
	<script src="<%=basePath%>assets/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->
	
	<!-- jQuery Flot -->
	<script src="<%=basePath%>assets/js/excanvas.min.js"></script>
	<script src="<%=basePath%>assets/js/jquery.flot.js"></script>
	<script src="<%=basePath%>assets/js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>assets/js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>assets/js/jquery.flot.stack.js"></script>
	
	<!-- jQuery Notification - Noty -->
	<script src="<%=basePath%>assets/js/jquery.noty.js"></script> <!-- jQuery Notify -->
	<script src="<%=basePath%>assets/js/themes/default.js"></script> <!-- jQuery Notify -->
	<script src="<%=basePath%>assets/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
	<script src="<%=basePath%>assets/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
	<script src="<%=basePath%>assets/js/layouts/top.js"></script> <!-- jQuery Notify -->
	<!-- jQuery Notification ends -->
	
	<script src="<%=basePath%>assets/js/sparklines.js"></script> <!-- Sparklines -->
	<script src="<%=basePath%>assets/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
	<script src="<%=basePath%>assets/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
	<script src="<%=basePath%>assets/js/jquery.uniform.min.js"></script> <!-- jQuery Uniform -->
	<script src="<%=basePath%>assets/js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
	<script src="<%=basePath%>assets/js/filter.js"></script> <!-- Filter for support page -->
	<script src="<%=basePath%>assets/js/custom.js"></script> <!-- Custom codes -->
	<script src="<%=basePath%>assets/js/charts.js"></script> <!-- Charts & Graphs -->
	<script src="<%=basePath%>assets/js/jquery.prettyPhoto.js"></script>

  </body>
</html>
