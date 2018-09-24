<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		<form:form cssClass="form-signin" commandName="userCustom"
			action="${pageContext.request.contextPath }/user/userRegisterSubmit"
			onsubmit="return register()" method="post">
			<fieldset>
				<h2 class="form-signin-heading" style="font-size: 25px">
					<strong>蓝领劳务对接网</strong>
				</h2>
				<div class="login-wrap">

					<p>
						<form:input id="user_name" path="user_name" type="text"
							placeholder="用户名" cssClass="form-control" />
					</p>
					<p>
						<form:input id="user_password" path="user_password"
							type="password" placeholder="密码" cssClass="form-control" />
					</p>
					<p>
						<form:input id="user_password2" path="user_password2"
							type="password" placeholder="确认密码" cssClass="form-control" />
					</p>
					<p>
						<form:input id="user_mobile" path="user_mobile" type="text"
							placeholder="手机号码" cssClass="form-control" />
					</p>
					<p>
						<form:input id="user_email" path="user_email" type="text"
							placeholder="电子邮箱" cssClass="form-control" />
					</p>
					<button class="btn btn-lg btn-login btn-block" type="submit">注册</button>
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
		function register(e) {
			if (!checkname()) {
				return false;
			} else if (!checkpass()) {
				return false;
			} else if (!checkrpass()) {
				return false;
			} else if (!checkemail()) {
				return false;
			} else if (!checkmobile()) {
				return false;
			} else{
				return true;
			}
			
		}
		
		function checkname() {
			var user_name = $("#user_name").val();
			if(user_name == "" || user_name == null){
				swal("用户名不能为空");
				return false;
			} else if(user_name.length<2|| user_name.length>10){
				swal("用户名长度须在2-10之间");
				return false;
			}
			return true;
		}
		
		function checkpass() {
			var user_password = $("#user_password").val();
			if(user_password == "" || user_password == null){
				swal("密码不能为空");
				return false;
			} else if (user_password.length<6 || user_password.length >15) {
				swal("密码长度须在6-15之间");
				return false;
			}
			return true;
		}
		
		function checkrpass() {
			var user_password = $("#user_password").val();
			var user_password2 = $("#user_password2").val();
			if(user_password2 == "" || user_password2 == null){
				swal("请输入确认密码");
				return false;
			} else if (user_password != user_password2) {
				swal("两次密码输入不一致!");
				return false;
			}
			return true;
		}

		function checkemail() {
			var user_email = $("#user_email").val();
			if(user_email == "" || user_email == null){
				swal("请输入邮箱");
				return false;
			} else if (!isEmail(user_email)) {
				swal("邮箱格式不正确!");
				return false;
			}
			return true;
		}
		
		function isEmail(str) {
			var reg = /[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}/;
			return reg.test(str);
		}
		
		function checkmobile() {
			var user_mobile = $("#user_mobile").val();
			if(user_mobile == "" || user_mobile == null){
				swal("请输入手机号码");
				return false;
			} else if (!isMobile(user_mobile)) {
				swal("手机号码格式不正确!");
				return false;
			}
			return true;
		}

		function isMobile(str) {
			var reg = /^1[3458]\d{9}$/;
			return reg.test(str);
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