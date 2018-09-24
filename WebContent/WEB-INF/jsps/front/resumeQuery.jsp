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



		<section class="wrapper">
			<div class="gray-box mbot50">
				<div class="container">
					<div class="breadcrumbs" style="margin-bottom: 0px;">
						<div class="container">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<h1>我收到的简历</h1>
								</div>
								<div class="col-lg-8 col-sm-8">
									<ol class="breadcrumb pull-right">
										<li><a
											href="${pageContext.request.contextPath }/user/myHire?userid=${user.id}"><i
												class="icon-check"></i><strong>
													&nbsp;&nbsp;&nbsp;我发布的职位</strong></a></li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">



								<div class=" ">
									<!-- 列表 开始 -->


									<table class="table table-striped border-top" id="">
										<thead>
											<tr>
												<th>序号</th>
												<th class="hidden-phone">姓名</th>
												<th class="hidden-phone">性别</th>
												<th class="hidden-phone">年龄</th>
												<th class="hidden-phone">应聘岗位</th>
												<th class="hidden-phone">工作经验</th>
												<th class="hidden-phone">联系方式</th>
												<th></th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${resumeList }" var="resume"
												varStatus="status">
												<tr class="odd gradeX">
													<td>${status.index + 1 }</td>
													<td class="hidden-phone">${resume.resume_name}</td>
													<td class="hidden-phone">${resume.resume_sex}</td>
													<td class="hidden-phone">${resume.resume_age}</td>
													<td class="hidden-phone">${resume.job_name}</td>
													<td class="hidden-phone">${resume.resume_experience}</td>
													<td class="hidden-phone">${resume.resume_mobile}</td>
													<td><a href="#">
															<button class="btn btn-danger btn-xs">
																<i class="icon-trash">删除</i>
															</button>
													</a></td>
													<td></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>


								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</section>

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
	<script type="text/javascript"
		src="<%=basePath%>/resources/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/resources/assets/data-tables/DT_bootstrap.js"></script>
	<script src="<%=basePath%>/resources/js/owl.carousel.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.customSelect.min.js"></script>

	<!--common script for all pages-->
	<script src="<%=basePath%>/resources/js/common-scripts.js"></script>

	<!--script for this page-->
	<script src="<%=basePath%>/resources/js/dynamic-table.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/resources/js/jquery.cityselect.js"></script>
	<script src="<%=basePath%>/resources/js/sweet-alert.js"></script>

	<script>
		function butOnClick() {
			if (event.keyCode == 13) {
				var button = document.getElementById("bsubmit");
				button.click();
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#job_area").citySelect({
				prov : "北京",
				nodata : "none"
			});

		});
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

