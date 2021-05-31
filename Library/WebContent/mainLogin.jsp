<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书馆登录界面</title> 
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	
<link href="box.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="file.js"></script>
</head>

<body background="img/background.jpg" style="width: 100%; height: 100%;">
	<jsp:include page="admin/show_info.jsp"></jsp:include>
	<div class="container">
		<h2 align="center" style="margin-top: 20px">欢迎访问图书馆管理系统</h2>

		<MARQUEE scrollAmount=5 direction=left>请访客登录！！！</MARQUEE>

		<div style="" align="center" class="container">

			<div class="exam-login row vertical-center">

				<h5 align="center">请选择登录类型</h5>


				<form class="form-horizontal" action="loginCheck" method="post"
					style="margin-left: 20px; margin-top: 15px; margin-right: 20px"
					role="form">
					<div>

						<input type="button" data-toggle="modal" data-target="#user"
							class="btn btn-primary"
							style="width: 100%; height: 80px; font-size: 25px" value="借阅者" />


						<input type="button" data-toggle="modal" data-target="#master"
							class="btn btn-primary"
							style="width: 100%; height: 80px; margin-top: 50px; font-size: 25px;"
							value="管理员" />

					</div>
				</form>
			</div>
		</div>
		<div class="modal fade"
			style="position: absolute; height: auto; top: 50%; left: 50%; transform: translateX(-50%) translateY(-50%);"
			id="master">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 align="center" class="modal-title">管理员登录</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- 模态框主体 -->
					<form action="LoginCheck?name=manager" method="post">
						<div class="alert navbar-inverse"
							style="background-color: #ffffff; height: auto;">
							<table align="center"
								style="border-collapse: separate; border-spacing: 5px 20px;">
								<tr>
									<td><h6 align="right">管理员账号</h6></td>
									<td><input style="width: 250px" type="text"
										class="form-control" name="masterid"></td>
								</tr>
								<tr>
									<td align="right">
										<h6>密码</h6>
									</td>
									<td><input type="password" style="width: 250px"
										name="masterpwd" class="form-control"></td>
								</tr>
							</table>
							<div align="center">
								<button type="submit" style="width: 65%" class="btn btn-primary">
									登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal fade"
			style="position: absolute; height: auto; top: 50%; left: 50%; transform: translateX(-50%) translateY(-50%);"
			id="user">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 align="center" class="modal-title">借阅者登录</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- 模态框主体 -->
					<form action="LoginCheck?name=user" method="post">
						<div class="alert navbar-inverse "
							style="background-color: #ffffff; height: auto;">
							<table align="center"
								style="border-collapse: separate; border-spacing: 5px 20px;">
								<tr>
									<td><h6 align="right">学号</h6></td>
									<td><input name="userid" style="width: 250px" type="text"
										class="form-control"></td>
								</tr>
								<tr>
									<td align="right">
										<h6>姓名</h6>
									</td>
									<td><input name="userpwd" type="text" style="width: 250px"
										class="form-control"></td>
								</tr>
							</table>
							<div align="center">
								<button type="submit" style="width: 65%" class="btn btn-primary">
									登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="bottom">
			@好好学习 天天代码 <span>版权所有</span>
		</div>
	</div>
</body>
</html>