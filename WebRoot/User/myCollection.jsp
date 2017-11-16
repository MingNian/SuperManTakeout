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
	background-color: white;
}
.collectionItem{
	width: 340px;
	height: 110px;
	margin-left: 30px;
	float: left;
	margin-bottom:20px;
	border:1px solid  gray;
}
.imgItem{
	width: 110px;
	height: 82px;
	float:left;
}
.innerItem{
	margin-left: 20px;
	width: 180px;
	height: 80px;
	float: left;
}
</style>

<title>超人外卖</title>
</head>
<body>

<div style="width: 765px;overflow:hidden;">
	<div style="width: 100%;height: 34px;"></div>
	<c:choose>
	<c:when test="${empty collectShops }">
		暂未收藏商家
	</c:when>
	<c:otherwise>
		<c:forEach items="${collectShops}" var="cshop">
			<div class="collectionItem">
				<div style="width:100%;height: 12px; "></div>
				<div class="imgItem"><img alt="图片" src="${cshop.shopDetail.shopImg }" width="110px" height="82px" style="margin-left: 10px;float:left;"></div>
				<div class="innerItem">
					<a target="_blank" href="browsingShop_UserAction?id=${cshop.id }" style="color: black;font-size: 20px;margin-bottom: 4px;">${cshop.shopName }</a><br>
					<span style="font-size: 14px;margin-bottom: 4px;">2 </span><br> 
					<span style="color: gray;font-size: 12px;margin-bottom: 1px;">起送  ￥  ${cshop.shopDetail.leastMoney }  配送费   ￥  ${cshop.shopDetail.serviceMoney }</span>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
	</c:choose>
</div>
</body>
</html>




