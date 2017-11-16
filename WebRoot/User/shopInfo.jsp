<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div
	style="width: 980px;height: 100px;background-color: white;margin-left: auto;   margin-right: auto;margin-top: 12px; ">
	<div style="width: 100%;height: 10px;"></div>
	<div style="width: 92%;margin-left: 16px;">
		<div style="width: 120;height: 80; float: left">
			<img width="110px" height="80px"
				alt="${sessionScope.shop.shopName}"
				src="${sessionScope.shop.shopDetail.shopImg} ">
		</div>
		<div style="width: 20px;height: 70px;float: left;"></div>
		<div style="margin-left:12px;width: 300px;height: 80px;float: left;">
			<div style="width: 100%;height: 10px;"></div>
			<span class="h3">${  sessionScope.shop.shopName }</span><br>
			<div style="width: 100%;height: 10px;"></div>
			<span class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				style="margin-left:10px; ">5分</span><br>
		</div>
		<div style="width: 120px;height: 70px;float: left;">
			<div style="width: 100%;height: 10px;"></div>
			<span>平均送餐时间</span><br> <span class="h2">${sessionScope.shop.shopDetail.duration }</span>&nbsp;分钟
		</div>
		<div style="width: 120px;height: 70px;float: left;">
			<div style="width: 100%;height: 10px;"></div>
			<span>起送费</span><br> <span class="h2">${sessionScope.shop.shopDetail.leastMoney}</span>&nbsp;元
		</div>
		<div style="width: 120px;height: 70px;float: left;">
			<div style="width: 100%;height: 10px;"></div>
			<span>配送费</span><br> <span class="h2">${sessionScope.shop.shopDetail.serviceMoney }</span>&nbsp;元
		</div>
		<div
			style="width: 1px;height: 78px;float: left;border: 1px solid black;"></div>
		<div style="width: 10px;height: 78px;float: left;"></div>
		<div style="width: 80px;height: 78px;float: left;">
			<div style="width: 100%;height: 10px;"></div>
			<c:set var="flag" value="0"/>
			<c:choose>
				<c:when test="${empty collectShops}">
					<span style="margin-left:20px;">收藏本店</span><br>
					<a href="User/collectionShop_UserAction?user.id=${sessionScope.user.id}&shop.id=${sessionScope.shop.id}">
						 <span class="glyphicon glyphicon-heart" style="font-size: 30px;color: gray;margin-left: 30px;"></span>
					</a>
				</c:when>
				<c:otherwise>
					<c:forEach items="${collectShops}" var="collectShop">
						<c:choose>
							<c:when test="${sessionScope.shop.id == collectShop.id}">
								<c:set var="flag" value="1"/>	
							</c:when>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${flag == 1}">
							<span style="margin-left:20px;">取消收藏</span><br>
							<a href="User/removeCollection_UserAction?user.id=${sessionScope.user.id}&shop.id=${sessionScope.shop.id}"> 
								<span class="glyphicon glyphicon-heart" style="font-size: 30px;color: red;margin-left: 30px;"></span>
							</a>
						</c:when>
						<c:otherwise>
						<span style="margin-left:20px;">收藏本店</span><br>
							<a href="User/collectionShop_UserAction?user.id=${sessionScope.user.id}&shop.id=${sessionScope.shop.id}">
							 <span class="glyphicon glyphicon-heart" style="font-size: 30px;color: gray;margin-left: 30px;"></span>
						</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>


