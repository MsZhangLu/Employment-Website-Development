<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;//+ "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="vickie">
<link rel="shortcut icon"
	href="<%=basePath%>/resources/img/favicon.html">
<title>蓝领劳务对接网</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>/resources/css/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link
	href="<%=basePath%>/resources/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="<%=basePath%>/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/resources/css/owl.carousel.css" type="text/css">
<!-- Custom styles for this template -->
<link href="<%=basePath%>/resources/css/style.css" rel="stylesheet">
<link href="<%=basePath%>/resources/css/style-responsive.css"
	rel="stylesheet" />
<link href="<%=basePath%>/resources/css/sweet-alert.css"
	rel="stylesheet" />

</head>

<body class="login-body">
	<div class="container">
		<form:form cssClass="form-signin" commandName="user" action="${pageContext.request.contextPath }/user/userLoginSumbit"
			onsubmit="return login()" id="loginForm" method="post">
			<fieldset>
				<h2 class="form-signin-heading" style="font-size:25px">
					<strong>蓝领劳务对接网</strong>
				</h2>
				<div class="login-wrap">
					<p>
						<form:input id="user_name" path="user_name" type="text" placeholder="用户名"
							cssClass="form-control" />
					</p>
					<p>
						<form:input id="user_password" path="user_password"
							type="password" placeholder="密码" cssClass="form-control" />
					</p>
					<label class="checkbox"> <input type="checkbox"
						value="remember-me"> 记住我 <span class="pull-right">
							<a href="${pageContext.request.contextPath }/user/userRegister">  注册成为新用户</a>
					</span>
					</label>
					<button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
				</div>
			</fieldset>
		</form:form>
	</div>


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>/resources/js/jquery.js"></script>
	<script src="<%=basePath%>/resources/js/jquery-1.8.3.min.js"></script>
	<script src="<%=basePath%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.scrollTo.min.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>/resources/js/jquery.sparkline.js"
		type="text/javascript"></script>
	<script
		src="<%=basePath%>/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="<%=basePath%>/resources/js/owl.carousel.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.customSelect.min.js"></script>

	<!--common script for all pages-->
	<script src="<%=basePath%>/resources/js/common-scripts.js"></script>

	<!--script for this page-->
	<script src="<%=basePath%>/resources/js/sweet-alert.js"></script>

	<script>
		function login(){
			//用户点击登录后
			var user_name = $("#user_name").val();
			var user_password = $("#user_password").val();
			
			if( user_name == "" || user_name == null){
				swal("用户名不能为空");	
				/* 
				alert("用户名不能为空");
				 */
				return false;
			} else if( user_password == "" || user_password == null){
				swal("密码不能为空");
				return false;
			} else{
				return true;
			}
			
		}
	
		function err() {
			alert('对不起，登录后才能发布职位，请您先登录！')
		}

		function butOnClick() {
			if (event.keyCode == 13) {
				var button = document.getElementById("bsubmit");
				button.click();
				return false;
			}
		}
	</script>

	<script>
		//owl carousel

		$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true

			});
		});

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});
	</script>
</body>
</html>


