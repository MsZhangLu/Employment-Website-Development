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


		<!--main content start-->

		<section class="wrapper">
			<div class="gray-box mbot50">
				<div class="container">
					<div class="breadcrumbs" style="margin-bottom: 0px;">
						<div class="container">
							<div class="row">
								<div class="col-lg-4 col-sm-4">
									<h1>职位详情</h1>
								</div>
								<div class="col-lg-8 col-sm-8">
									<ol class="breadcrumb pull-right">
										<li><a
											href="${pageContext.request.contextPath }/job/jobType"><i
												class="icon-home"></i><strong>
													&nbsp;&nbsp;&nbsp;蓝领职位行业类别</strong></a></li>
										<li><a
											href="${pageContext.request.contextPath}/job/jobQuery?job_type_name=${jobCustom3.job_type_name}"><strong>${job_type_name}职位列表</strong></a></li>
										<li class="active"><strong>职位详情</strong></li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">

								<!-- 列表 开始 -->
								<div class=" container">

									<!-- Modal -->
									<div class="modal fade" id="myModalApply" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title">填写简历，申请职位</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal" role="form"
														action="${pageContext.request.contextPath }/job/jobApplySubmit?userid=${user.id}&jobid=${job.id}" method="post">
														<div class="form-group">
															<label class="col-lg-2 control-label">姓名</label>
															<div class="col-lg-4">
																<input type="text" class="form-control"
																	name="resume_name" placeholder="">
															</div>
															<label class="col-lg-2 control-label">性别</label>
															<div class="col-lg-4">
																<select class="form-control m-bot15" name="resume_sex">
																	<option>男</option>
																	<option>女</option>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-lg-2 control-label">年龄 </label>
															<div class="col-lg-4">
																<input type="text" class="form-control"
																	name="resume_age">
															</div>
															<label class="col-lg-2 control-label">相关经验</label>
															<div class="col-lg-4">
																<select class="form-control m-bot15"
																	name="resume_experience">
																	<option>无经验</option>
																	<option>1年以下</option>
																	<option>1-2年</option>
																	<option>3-5年</option>
																	<option>6-10年</option>
																	<option>10年以上</option>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-lg-2 control-label">联系电话</label>
															<div class="col-lg-4">
																<input type="text" class="form-control"
																	name="resume_mobile" placeholder="">
															</div>
														</div>
														<div class="form-group">
															<label class="col-lg-2 control-label">自我介绍</label>
															<div class="col-lg-10">
																<textarea name="resume_summary" class="form-control"
																	rows="8" style="overflow: auto；"></textarea>
															</div>
														</div>
														<div class="form-group">
															<div class="col-lg-offset-2 col-lg-10">
																<button type="submit" class="btn btn-send">提交</button>
																<button type="button" class="btn btn-default">取消</button>
															</div>
														</div>

													</form>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->

									<form class="form-horizontal" role="form">
										<div class="form-group">
											<label class="col-lg-10 control-label"
												style="font-size: 25px;"><strong>${jobCustom3.job_name }</strong></label>
										</div>

										<div class="form-group">
											<label class="col-lg-10 control-label" style="color: black">${jobCustom3.cp_name }</label>
										</div>

										<div class="form-group">
											<label class="col-lg-2 control-label" style="color: black">行业：${jobCustom3.job_cat_name }</label>
											<label class="col-lg-2 control-label" style="color: black">${jobCustom3.job_type_name }</label>
										</div>

										<div>
											<label></label>
										</div>

										<div class="form-group">
											<label class="col-lg-1 control-label">招聘人数 </label> <label
												class="col-lg-2 control-label" style="color: black"><strong>${jobCustom3.job_amount }
											</strong></label> <label class="col-lg-1 control-label">薪酬</label> <label
												class="col-lg-2 control-label" style="color: black"><strong>${jobCustom3.job_pay }</strong></label>
										</div>

										<div>
											<label></label>
										</div>

										<div class="form-group">
											<label class="col-lg-1 control-label">工作区域</label> <label
												class="col-lg-2 control-label" style="color: black;"><strong>${jobCustom3.district_name }</strong></label>
										</div>

										<div>
											<label></label>
										</div>

										<div class="form-group">
											<label class="col-lg-1 control-label">联系电话</label> <label
												class="col-lg-1 control-label" style="color: orange"><strong>${jobCustom3.job_phone }</strong></label>
											<label class="col-lg-2 control-label" style="color: black"><strong>${jobCustom3.job_contact }</strong></label>

										</div>

										<div>
											<label></label>
										</div>

										<div class="form-group">
											<div class="col-lg-2 col-lg-2">
												<a data-toggle="modal" href="#myModalApply"><button
														class="btn btn-send ">申请职位</button></a>
											</div>

										</div>

										<div>
											<label></label> <label></label>
										</div>

										<div class="form-group">
											<label class="col-lg-1 control-label">职位简介</label> <label
												class="col-lg-5 control-label">${jobCustom3.job_summary }</label>
										</div>

									</form>

								</div>
								<!-- 列表 结束 -->


							</section>
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

