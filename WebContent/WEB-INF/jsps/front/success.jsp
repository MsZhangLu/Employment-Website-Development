<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;//+ "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功</title>
<!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=basePath%>/resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="<%=basePath%>/resources/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/css/style-responsive.css" rel="stylesheet" />

</head>
<body>
	
	<div class="container" style="margin-top:100px;">

		<section class="error-wrapper">
		<p>
			${success }<a href="${pageContext.request.contextPath }/${back}">返回${info }</a>
		</p>
		</section>

	</div>
</body>
</html>