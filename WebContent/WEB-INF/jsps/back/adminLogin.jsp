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

</head>

<body class="login-body">
	<div class="container">
		<form:form cssClass="form-signin" commandName="admin" action="${pageContext.request.contextPath }/admin/adminLoginSubmit"
			method="post">
			<fieldset>
				<h2 class="form-signin-heading" style="font-size:25px">
					<strong>蓝领劳务对接网-后台管理</strong>
				</h2>
				<div class="login-wrap">
					<p>
						<label for="user_name">用户名</label>
						<form:input id="admin_name" path="admin_name" type="text"
							cssClass="form-control" />
					</p>
					<p>
						<label for="user_password">密码</label>
						<form:input id="admin_password" path="admin_password"
							type="password" cssClass="form-control" />
					</p>
					<button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
				</div>
			</fieldset>
		</form:form>
	</div>

</body>
</html>

