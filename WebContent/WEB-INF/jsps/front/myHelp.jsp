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
								<h1>帮助中心</h1>
								<p>在这里你根据类别查看常见问题的帮助信息，方便您的使用～</p>
							</div>

							<div class="row">
								<div class="col-lg-4">
									<table class="table table-hover personal-task">
										<tbody>
											<tr>
												<td><a href="#"> <span class="badge bg-important"
														style="font-size: 20px;">新手使用指南</span>
												</a></td>
											</tr>
										</tbody>
									</table>
									<!--collapse start-->
									<div class="panel-group m-bot20" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse1">如何注册成为新用户 </a>
												</h4>
											</div>
											<div id="collapse1" class="panel-collapse collapse ">
												<div class="panel-body">
													在任意页面，点击“请登录”，您可跳转至登录页面。<br> 如果您不是我们的用户，请点击“注册成为新用户”<br>
													在注册页面正确填写您的“用户名”、“密码”、“手机号码”、“电子邮箱”<br>
													提交后，您就可以成为我们的新用户了！<br>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse2">如何发布信息</a>
												</h4>
											</div>
											<div id="collapse2" class="panel-collapse collapse">
												<div class="panel-body">
													我们为“蓝领劳务”的注册用户提供发布招聘信息的功能<br> 您可以在网站的任意界面，点击“发布新职位”<br>
													填写职位的相关信息后，即可发布职位
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse4">如何查看收到的简历</a>
												</h4>
											</div>
											<div id="collapse4" class="panel-collapse collapse">
												<div class="panel-body">
													如果有用户对您发布的职位感兴趣，将填写简历投递<br> 您可以在任意界面，在右上角点击自己的用户名<br>
													在弹出框中，选择“我的招聘”<br> 在您的职位列表上侧，点击“收到的简历”，即可查看<br>
												</div>
											</div>
										</div>
									</div>
									<!--collapse end-->
								</div>

								<div class="col-lg-4">
									<table class="table table-hover personal-task">
										<tbody>
											<tr>
												<td><a href="#"> <span class="badge bg-success"
														style="font-size: 20px;">用户登录与个人信息管理</span>
												</a></td>
											</tr>
										</tbody>
									</table>

									<!--collapse start-->
									<div class="panel-group m-bot20" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse11">用户登录</a>
												</h4>
											</div>
											<div id="collapse11" class="panel-collapse collapse ">
												<div class="panel-body">
													注册成功的用户，可在任意页面点击“请登录”<br> 正确输入您的“用户名”、“密码”，即可登录<br>
													登录后，用户不仅可以浏览“蓝领劳务”提供的各类职位信息及详情<br> 还可以发布自己的招聘信息～
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse11">个人信息管理</a>
												</h4>
											</div>
											<div id="collapse11" class="panel-collapse collapse ">
												<div class="panel-body">
													注册成功的用户，如果想要更改自己的“用户名”、“密码”、“手机号码”、“电子邮箱”<br>
													请在登录后，在右上角点击自己的用户名<br> 在弹出框中，选择“个人中心”<br>
													即可浏览、修改您的个人信息～
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse12">无法登录</a>
												</h4>
											</div>
											<div id="collapse12" class="panel-collapse collapse">
												<div class="panel-body">
													登录时输入的"用户名"、"密码"有错误<br> 这种情况请检查用户名和密码，重试登录
												</div>
											</div>
										</div>
									</div>
									<!--collapse end-->

								</div>

								<div class="col-lg-4">

									<table class="table table-hover personal-task">
										<tbody>
											<tr>
												<td><a href="#"> <span class="badge bg-info"
														style="font-size: 20px;">信息发布与删除</span>
												</a></td>
											</tr>
										</tbody>
									</table>


									<!--collapse start-->
									<div class="panel-group m-bot20" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse3">如何管理信息</a>
												</h4>
											</div>
											<div id="collapse3" class="panel-collapse collapse">
												<div class="panel-body">
													如果您需要对已经发布的职位信息做出修改，或删除相关职位信息<br>
													您可以在任意界面，在右上角点击自己的用户名<br> 在弹出框中，选择“我的招聘”，即可查看您所发布的职位<br>
													点击“职位名称”，可以查看职位详情<br> 点击职位右侧的“修改”或“删除”，可以对职位信息做响应操作
												</div>
											</div>
										</div>
									</div>
									<!--collapse end-->

								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!--main content end-->

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
	<script src="<%=basePath%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.scrollTo.min.js"></script>
	<script src="<%=basePath%>/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=basePath%>/resources/assets/gritter/js/jquery.gritter.js"></script>


	<!--common script for all pages-->
	<script src="<%=basePath%>/resources/js/common-scripts.js"></script>

	<!--script for this page only-->
	<script src="<%=basePath%>/resources/js/gritter.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>/resources/js/sweet-alert.js"></script>


	<script>
		/* function logout(e) {
			//alert(e);
			swal({
				title : "确定退出登录？",
				text : "退出登录后，将自动返回首页～",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "退出登录",
				cancelButtonText : "取消",
				closeOnConfirm : false,
				closeOnCancel : true,
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = e.target.href;
					//return true;
				} else {
					//return false;
				}
			});
			console.log('sdasdas', e);
			//e.stopPropagation()
			e.preventDefault();
		}

		$('#logout').on('click', logout); */

		function logout() {
			alert("登录后才能发布职位，请您先登录～")
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


</body>
</html>
