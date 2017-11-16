<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<title>超人外卖</title>
</head>
<body>
	<%@ include file="User/address.jsp"%>
	<%@ include file="User/logo.jsp"%>
	
	<div style="width: 100%;height: 18px;"></div>
	
	<div style="width: 980px;overflow:hidden;background-color: #F5F5F5;margin-left: auto;   margin-right: auto; ">
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-home" style="font-size: 80px;margin-left:80px;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">商家入驻</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-lock" style="font-size: 80px;margin-left:80px;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">资料申请</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-road" style="font-size: 80px;margin-left:80px;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">配送加盟</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-flag" style="font-size: 80px;margin-left:80px;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">城市代理</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-shopping-cart" style="font-size: 80px;margin-left:80px;color: orange;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">零售加盟</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-globe" style="font-size: 80px;margin-left:80px;color: orange;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">开放平台</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-question-sign" style="font-size: 80px;margin-left:80px;color: orange;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">常见问题</span>
		</div>
		<div class="ruzhu">
			<div style="width: 100%;height: 60px;"></div>
			<a href="User/shopRegist.jsp" class="glyphicon glyphicon-apple" style="font-size: 80px;margin-left:80px;color: orange;"></a>
			<br><br>  
			<span class="h3" style="margin-left: 70px;">品牌合作</span>
		</div>

	</div>



	<%@ include file="copyRight.jsp"%>
</body>
</html>


