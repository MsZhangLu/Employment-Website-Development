<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;//+ "/";
%><!DOCTYPE html>
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

<body>

	<section id="container" class="">
		<!--header start-->
		<header class="header white-bg" style="height: 101px;">
			<!--logo start-->
			<a href="${pageContext.request.contextPath }/job/jobType"
				class="logo" style="font-size: 35px; padding-left: 20px"><strong
				style="color: black;">蓝领劳务<span>对接网</span></strong></a>
			<!--logo end-->
			<div class="top-nav " style="margin-top: 20px">
				<!--search & user info start-->

				<ul class="nav pull-right top-menu">

					<li><form
							action="${pageContext.request.contextPath }/job/jobQueryByJobName?city_name=${city_selected}"
							method="post">
							<input type="text" onkeydown="javascript:butOnClick();"
								class="form-control search" name="job_name"
								placeholder="请输入职位名 ..." />
						</form></li>

					<!-- user login dropdown start-->
					<c:if test="${user!=null }">
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle"><span class="username">
									${user.user_name } </span> <b class="caret"></b> </a>
							<ul class="dropdown-menu extended logout">
								<li><a href="#"><i class=" icon-eye-open"></i>我的求职</a></li>
								<li><a
									href="${pageContext.request.contextPath }/user/myHire?userid=${user.id}"><i
										class="icon-bell"></i> 我的招聘</a></li>
								<li><a
									href="${pageContext.request.contextPath }/user/myProfile?userid=${user.id}"><i
										class="icon-user"></i>个人信息</a></li>
								<li><a
									href="${pageContext.request.contextPath }/user/userLogout"><span><i
											class="icon-key"></i><b>退出登录</b></span></a></li>
							</ul></li>
					</c:if>
					<c:if test="${user==null }">
						<li><a
							href="${pageContext.request.contextPath }/user/userLogin"><span
								class="username"> 请登录 </span></a></li>
					</c:if>

					<!-- user login dropdown end -->
				</ul>


				<ul class="nav pull-right navbar-nav" style="font-size: 18px;">
					<li class="active"><a
						href="${pageContext.request.contextPath }/job/welcome">主页</a></li>
					<li><a href="${pageContext.request.contextPath }/job/jobType">职位类别</a></li>
					<li><a href="${pageContext.request.contextPath }/user/myHelp">帮助中心</a></li>
					<c:if test="${user!=null }">
						<li class="dropdown"><a data-toggle="modal"
							href="${pageContext.request.contextPath }/job/jobAdd.action">
								<i class=" icon-plus"></i><b style="padding-left: 10px">发布新职位</b>
						</a></li>
					</c:if>
					<c:if test="${user==null }">
						<li class="dropdown"><a data-toggle="modal" href="#"
							onClick="err()"> <i class=" icon-plus"></i><b
								style="padding-left: 10px">发布新职位</b>
						</a></li>
					</c:if>
					<li class="dropdown"><a data-toggle="modal"
						href="${pageContext.request.contextPath}/job/cityChange"> <i
							class=" icon-wrench"></i><b style="padding-left: 10px">${city_selected }</b>
					</a></li>
				</ul>

				<!--search & user info end-->
			</div>
		</header>
		<!--header end-->

		<!--main content start-->
		<section class="wrapper" style="margin-top: 100px;">
			<div class="gray-box mbot50">
				<div class="container">
					<div class="row">
						<div class="row">
							<div class="text-center feature-head">
								<h1>切换工作的城市</h1>
								<p>您可以在这里切换您所在的，或者您想去工作的城市，找到当地正在招聘的岗位～</p>
							</div>
							<div class="services">
								<div class="col-lg-6 col-sm-6">
									<div class="icon-wrap ico-bg round"></div>
									<div class="content ">
										<h3 class="title ">江苏</h3>
										<p style="font-size: 18px">
											<a
												href="${pageContext.request.contextPath}/job/cityChangeSubmit.action?city_name=苏州">苏州</a>
											<a
												href="${pageContext.request.contextPath}/job/cityChangeSubmit.action?city_name=南京">南京</a>
											<a href="#">无锡</a> <a href="#">常州</a> <a href="#">南通</a>
										</p>
									</div>
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="icon-wrap ico-bg round"></div>
									<div class="content">
										<h3 class="title">浙江</h3>
										<p style="font-size: 18px">
											<a
												href="${pageContext.request.contextPath}/job/cityChangeSubmit.action?city_name=杭州">杭州</a>
											<a href="#">宁波</a> <a href="#">温州</a> <a href="#">嘉兴</a> <a
												href="#">金华</a>
										</p>
									</div>
								</div>
							</div>
							<div class="services">
								<div class="col-lg-6 col-sm-6">
									<div class="icon-wrap ico-bg round"></div>
									<div class="content">
										<h3 class="title">安徽</h3>
										<p style="font-size: 18px">
											<a href="#">合肥</a> <a href="#">芜湖</a>
										</p>
									</div>
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="icon-wrap ico-bg round"></div>
									<div class="content">
										<h3 class="title">山东</h3>
										<p style="font-size: 18px">
											<a href="#">青岛</a> <a href="#">济南</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!--main content end-->


	</section>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-sm-5"></div>
				<div class="col-lg-4 col-sm-4">
					<h1></h1>
					<h1>联系我们</h1>
					<address>
						<p>地址：上海市杨浦区军工路516号</p>
						<p>电话 : (021) 8888-8888</p>
						<p>传真 : (021) 8888-8888</p>
						<p>
							Email : <a href="javascript:;">support@bluejobs.com</a>
						</p>
					</address>
				</div>
			</div>
		</div>
	</footer>
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
	<script src="<%=basePath%>/resources/js/sparkline-chart.js"></script>
	<script src="<%=basePath%>/resources/js/easy-pie-chart.js"></script>
	<script src="<%=basePath%>/resources/js/sweet-alert.js"></script>
	<script>
		function err() {
			swal("提示", "登录后才能发布职位，请您先登录～")
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
		function err() {
			swal("提示", "登录后才能发布职位，请您先登录～")
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

