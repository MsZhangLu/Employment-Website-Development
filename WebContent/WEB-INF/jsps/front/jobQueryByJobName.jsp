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
								href="${pageContext.request.contextPath }/user/userLogout"
								><span><i class="icon-key"></i><b>退出登录</b></span></a></li>
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
									<h1>搜索结果</h1>
								</div>
							</div>
						</div>
						<div class="contaniner">
							<div>
								<label></label>
							</div>
							<div class="row col-lg-12">
								<div class="form-group">

									<div>

										<form
											action="${pageContext.request.contextPath }/job/jobQueryByDetail"
											method="post">
											<div id="city_5">
												<div class="col-lg-2">
													<select class="prov form-control"></select>
												</div>
												<div class="col-lg-2">
													<select class="city form-control" name="job_type_name"></select>
												</div>
											</div>
											<div class="col-lg-4">
												<input type="text" onkeydown="javascript:butOnClick();"
													class="form-control " name="job_name"
													placeholder="请输入职位名、公司名、区域名 ..." />
											</div>
											<div class="col-lg-1 ">
												<button type="submit" class="btn">筛选</button>
											</div>
										</form>
									</div>

								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">

								<div class=" ">
									<!-- 列表 开始 -->

									<table class="table table-striped border-top" id=" ">
										<thead>
											<tr>
												<th>序号</th>
												<th class="hidden-phone">职位名称</th>
												<th class="hidden-phone">公司名称</th>
												<th class="hidden-phone">工作区域</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${jobList }" var="job" varStatus="status">
												<tr class="odd gradeX">
													<td>${status.index + 1 }</td>
													<td class="hidden-phone"><a
														href="${pageContext.request.contextPath }/job/jobDetail.action?jobid=${job.id}">${job.job_name}</a></td>
													<td class="hidden-phone">${job.cp_name}</td>
													<td class="hidden-phone">${job.district_name}</td>
													<td></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 列表 结束 -->

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


	<script type="text/javascript">
		$(function() {
			$("#job_area").citySelect({
				prov : "江苏",
				nodata : "none"
			});

			//demo05
			$("#city_5").citySelect({
				url : {
					"citylist" : [ {
						"p" : " ",
						"c" : [ {
							"n" : " "
						} ]
					}, {
						"p" : "餐饮",
						"c" : [ {
							"n" : "服务员"
						}, {
							"n" : "传菜员"
						}, {
							"n" : "洗碗工"
						}, {
							"n" : "杂工"
						}, {
							"n" : "送餐员"
						} ]
					}, {
						"p" : "美容 &amp; 美发",
						"c" : [ {
							"n" : "洗头工"
						}, {
							"n" : "美发助理／学徒"
						}, {
							"n" : "美容助理／学徒"
						}, {
							"n" : "化妆"
						}, {
							"n" : "宠物美容"
						} ]
					}, {
						"p" : "保健按摩",
						"c" : [ {
							"n" : "足疗师"
						}, {
							"n" : "按摩师"
						}, {
							"n" : "搓澡工"
						} ]
					}, {
						"p" : "家政保洁／安保",
						"c" : [ {
							"n" : "洗衣工"
						}, {
							"n" : "保洁"
						}, {
							"n" : "保姆"
						}, {
							"n" : "月嫂"
						}, {
							"n" : "钟点工"
						}, {
							"n" : "保安"
						}, {
							"n" : "护工"
						}, {
							"n" : "送水工"
						} ]
					}, {
						"p" : "超市 &amp; 百货 &amp; 零售",
						"c" : [ {
							"n" : "促销／导购员"
						}, {
							"n" : "收银员"
						}, {
							"n" : "理货员／陈列员"
						} ]
					}, {
						"p" : "普工 &amp; 技工",
						"c" : [ {
							"n" : "木工"
						}, {
							"n" : "油漆工"
						}, {
							"n" : "普工"
						}, {
							"n" : "电工"
						}, {
							"n" : "钳工"
						}, {
							"n" : "切割／焊工"
						}, {
							"n" : "钣金工"
						}, {
							"n" : "车工／铣工"
						} ]
					} ]
				},
				prov : "",
				city : "",
				dist : "",
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

