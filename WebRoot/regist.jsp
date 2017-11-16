<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/account.css"
	rel="stylesheet">
<title>超人外卖-登录</title>
<script type="text/javascript">
window.onload= function (){
	if (window.top!=window.self) {
		window.top.location="${pageContext.request.contextPath}/login.jsp";
	}
}
</script>
</head>

<body>

	<div class="container" style="padding-bottom: 160px;">

		<form class="form-signin" action="RegisterAction" method="post">
			<h2 class="text-center">超人外卖</h2>
			<input name="loginId" class="form-control" placeholder="请输入用户名"
				autofocus>
			<div style="width: 100%;height: 10px;"></div>
			<input name="email" type="email" id="inputEmail" class="form-control"
				placeholder="请输入邮箱" required>
			<div style="width: 100%;height: 10px;"></div>
			<input name="password" type="password" id="inputPassword"
				class="form-control" placeholder="请输入密码" required>
			<div class="form-group"></div>
			<div style="width: 100%;height: 10px;"></div>
			<button class="btn btn-lg btn-primary btn-block pad" type="submit">注册</button>
			<div style="width: 100%;height: 5px;"></div>
			<a href="login.jsp">登录</a> 
		</form>
	</div>

	<%@ include file="copyRight.jsp"%>

</body>

</html>