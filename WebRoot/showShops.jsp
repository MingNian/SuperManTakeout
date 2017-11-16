<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: white;
	overflow-x: hidden;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	if(${pageNum}==1){
		$("#shou").attr("href","javascript:;");
		$("#shang").attr("href","javascript:;");
	}
	if(${pageNum}==${pageCount}){
		$("#xia").attr("href","javascript:;");
		$("#wei").attr("href","javascript:;");
	}
});
	
</script> 

<title>超人外卖</title>
</head>
<body>
<div style="background-color: white;width: 98%;height:530px;rgin-left: 1%;margin-top: 1%;">
			<c:choose>
				<c:when test="${empty displayShops }">
					<div class="shopItem" style=" margin-right: auto;margin-top: 12px;">
						<span class="h1">没有商家</span>
					</div>
				</c:when> 
				<c:otherwise>
					<c:forEach items="${displayShops}" var="shop">
						<div class="shopItem">
							<div style="width: 100%;height: 14px;"></div>
							<div style="margin-left:10px;">   
								<a target="_top"
									href="${pageContext.request.contextPath}/User/browsingShop_UserAction?id=${shop.id}"> <img
									width="210px" height="160px" alt="${shop.shopName}"
									src="${shop.shopDetail.shopImg} ">
								</a>
							</div> 
							<div style="width: 100%;height: 5px;"></div> 
							<div style="width: 90%;margin-left: 7%;">
								<span class="h4" >${shop.shopName}</span><br>
								<div style="width: 100%;height: 5px;"></div>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span style="margin-left:10px; ">5分</span><br> 
								<div style="width: 100%;height: 5px;"></div>
								<span class="h6" >起送&nbsp;￥&nbsp;${shop.shopDetail.leastMoney}&nbsp;配送费&nbsp;&nbsp;￥&nbsp;${shop.shopDetail.serviceMoney}</span>
								<span class="glyphicon glyphicon-time">${shop.shopDetail.duration }</span>
							</div>
						</div>
					</c:forEach>
				</c:otherwise> 
			</c:choose>			
	</div>
	<ul class="pager">
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shou"
			href="${pageContext.request.contextPath}/User/showShops_UserAction?pageNum=1">&lt;&lt;</a></li>
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shang"
			href="${pageContext.request.contextPath}/User/showShops_UserAction?pageNum=${pageNum-1}">&lt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
			id="xia" href="${pageContext.request.contextPath}/User/showShops_UserAction?pageNum=${pageNum+1}">&gt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
			id="wei" href="${pageContext.request.contextPath}/User/showShops_UserAction?pageNum=${pageCount}">&gt;&gt;</a></li>
	</ul>
</body>