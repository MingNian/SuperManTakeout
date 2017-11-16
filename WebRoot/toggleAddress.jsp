<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">

<style type="text/css">
body{
	background-color: white;
}
.bgDiv {
	height: auto;
	margin-left: auto;
	margin-right: auto;
	background-image: url('img/bg.png');
	background-repeat: no-repeat;
	background-size: 100%;
	min-width: 980px;
	min-height: 500px;
	width: 100%;
	height: auto;
}
</style>
<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<title>超人外卖</title>
</head>
<body>
	<%@ include file="User/address.jsp"%>
	<div class="bgDiv">
		<div style="width: 100%;height: 320px;"></div>
		<div
			style="width: 500px;height: 60px;margin-left: auto;margin-right:auto;">
			<form action="User/toggleAddress_UserAction" method="post">
				<div style="width: 400px;height: 100%;float: left;">
					<input type="hidden" name="pageNum" value="1">
					<input name="position" class="form-control" placeholder="输入地址搜索周边美食" style="height: 46px;"
						required autofocus>
				</div>
				<div style="width: 90px;height: 100%;float: left;">
					<input type="submit" value="搜索" class="btn btn-lg btn-primary btn-block" >
				</div>
			</form>
		</div>
	</div>
	
	<div style="width: 500px;height: 140px;margin-left: auto;margin-right:auto;">
		<a href="join.jsp" >
			<img alt="商家入驻" src="img/rz.png" width="500px" height="140px">
		</a>
	</div>
	
	<%@ include file="copyRight.jsp"%>
</body>
</html>


