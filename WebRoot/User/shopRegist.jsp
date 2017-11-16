<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #081733;
	margin: 0 px;
	padding: 0 px;
}

.btndiv {
	width: 200px;
	height: 70px;
	margin-left: auto;
	margin-right: auto;
	background-color: #0e95c8;
}
</style>
<script type="text/javascript">
	function toShopRegist(){
		window.location.href="writeRegistInfo.jsp";
	};
</script>

<title>超人外卖</title>
</head>
<body>
	<div
		style="height:700px;width: 100%; background: center center url(${pageContext.request.contextPath}/img/header_bg.png) no-repeat;">
		<div class="container">
			<div style="width: 100%;height: 100px;"></div>
			<h1
				style="text-align: center;color: white;font-size:50px; margin-bottom: 40px;">加入超人外卖，实现销量用户双增长</h1>
			<div style="width: 100%;height: 250px;margin-bottom: 40px;">
				<div
					style="width:220px;height:240px ;float: left;margin-left: 160px; border: 2px solid white;">
					<div style="width: 100%;height: 20px;"></div>
					<h3 style="text-align: center;color: white;margin-bottom: 20px;">骑手</h3>
					<h1 style="text-align: center;color: white;font-size:50px; margin-bottom: 20px;">30万</h1>
				</div>
				<div
					style="width:220px;height:240px ;float: left;margin-left: 75px; border: 2px solid white;">
					<div style="width: 100%;height: 20px;"></div>
					<h3 style="text-align: center;color: white;margin-bottom: 20px;">每日订单</h3>
					<h1 style="text-align: center;color: white;font-size:50px; margin-bottom: 20px;">1200万</h1>
				</div>
				<div
					style="width:220px;height:240px ;float: left;margin-left: 75px; border: 2px solid white;">
					<div style="width: 100%;height: 20px;"></div>
					<h3 style="text-align: center;color: white;margin-bottom: 20px;">累计用户</h3>
					<h1 style="text-align: center;color: white;font-size:50px; margin-bottom: 20px;">2.0亿</h1>
				</div>
			</div>
			<button class="btndiv btn center-block" onclick="toShopRegist();">
				<h3 style="color: white;">我要加入</h3>
			</button>
		</div>
	</div>
</body>
</html>




