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


	<!--header start-->
	<header class="header white-bg" style="height: 101px;">
		<!--logo start-->
		<a href="${pageContext.request.contextPath }/job/jobType" class="logo"
			style="font-size: 35px; padding-left: 20px"><strong
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
	<section class="wrapper">
		<div class="gray-box mbot50">
			<div class="container">
				<div class="col-lg-12">
					<!-- 职位类别列举 开始 -->
					<section class="panel">
						<div id="myCarousel" class="carousel slide">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<!-- Carousel items -->
							<div class="carousel-inner">
								<div class="active item">
									<img src="<%=basePath%>/resources/img/me1.jpg">
								</div>
								<div class="item">
									<img src="<%=basePath%>/resources/img/me2.jpg">
								</div>
								<div class="item">
									<img src="<%=basePath%>/resources/img/me3.jpg">
								</div>
							</div>
							<!-- Carousel nav -->
							<a class="carousel-control left" href="#myCarousel"
								data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
								href="#myCarousel" data-slide="next">&rsaquo;</a>
						</div>

						<div class="container">

							<div class="row">
								<div class="text-center feature-head">
									<h1>欢迎来到蓝领劳务对接网</h1>
									<p>专业的蓝领劳务供求对接平台，为您找工作、招职员提供高效服务！</p>
								</div>
								<div class="col-lg-2 col-sm-2"></div>
								<div class="col-lg-4 col-sm-4">
									<section>

										<a href="${pageContext.request.contextPath }/job/jobType">
											<div class="f-box">
												<i class=" fa  icon-search"></i>
												<h2>找工作</h2>
											</div>
										</a>
										<p class="f-text">查看系统中的职位类别表，选择感兴趣的职位类型，根据工作区域选择自己感兴趣的岗位，查看详细信息后可根据自身条件申请相应职位。</p>





									</section>
								</div>

								<div class="col-lg-4 col-sm-4">

									<c:if test="${user!=null }">
										<a
											href="${pageContext.request.contextPath }/job/jobAdd.action">
											<div class="f-box ">
												<i class=" fa icon-plus"></i>
												<h2>招职员</h2>
											</div>
										</a>
										<p class="f-text">发布您想招收工作人员的具体要求，方便更多符合条件的人才看到招聘信息。</p>
									</c:if>
									<c:if test="${user==null }">
										<a data-toggle="modal" href="#" onClick="err()">
											<div class="f-box ">
												<i class=" fa icon-plus"></i>
												<h2>招职员</h2>
											</div>
										</a>
										<p class="f-text">发布您想招收工作人员的具体要求，方便更多符合条件的人才看到招聘信息。</p>
									</c:if>




								</div>
							</div>

						</div>
					</section>

					<!-- 职位类别列举 结束 -->

				</div>
			</div>

		</div>

	</section>
	<!--main content end-->



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
	<script src="<%=basePath%>/resources/js/revulation-slide.js"></script>
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

