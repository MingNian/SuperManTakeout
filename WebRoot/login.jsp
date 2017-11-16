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

		<form class="form-signin" action="LoginAction.action" method="post">
			<h2 class="text-center">超人外卖</h2>
			<input name="loginId" class="form-control" placeholder="请输入用户名或邮箱"
				required autofocus>
			<div style="width: 100%;height: 10px;"></div>
			<input name="password" type="password" id="inputPassword"
				class="form-control" placeholder="请输入密码" required>
			<div class="form-group">
				<select name="num" class="form-control">
					<option value="1">普通用户</option>
					<option value="0">系统管理员</option>
				</select>
			</div> 
			<div style="width: 100%;height: 10px;"></div>
			<button class="btn btn-lg btn-primary btn-block pad" type="submit">登录</button> 
			<div style="width: 100%;height: 5px;"></div>
			还没有密码？<a href="regist.jsp">点击注册</a> 
		</form>
	</div>

	<%@ include file="copyRight.jsp"%>

</body>

</html>