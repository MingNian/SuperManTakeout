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
</style>

<title>超人外卖</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${empty orderBeans0}">
				<div>抱歉哦亲！您暂无历史订单哦！</div>
			</c:when>
			<c:otherwise>
					<div>&nbsp;</div>
					<c:forEach items="${orderBeans0}" var="orderBean">  
						<div style="width: 720px;height: 130px;background-color: #F5F5F5;margin-bottom: 10px;margin-left: 15px;">
							<div style="width: 100%;height: 10px;"></div>
							<div style="float: left;margin-left: 10px;"><a href="browsingShop_UserAction?id=${orderBean.shop.id}" target="_top"><img alt="" width="130px" height="110px;" src="${orderBean.shop.shopDetail.shopImg}"></a></div>
							<div style="width: 560px;height: 100%;float: left;margin-left: 14px;">
								<div style="width: 100%;height: 10px;"></div>
								<div><a href="browsingShop_UserAction?id=${orderBean.shop.id}" target="_top"><strong>${orderBean.shop.shopName}</strong></a></div>
								<div style="width:100%;height: 20px;"></div>
								<div>订单日期：${orderBean.orderBeanTime}&nbsp;&nbsp;&nbsp;订单总计:${orderBean.orderBeanMoney + orderBean.shop.shopDetail.serviceMoney}</div>
								<div class="pull-right">
									<div style="float: left;"><a href="browsingShop_UserAction?id=${orderBean.shop.id}" target="_top">再来一单</a></div>
									<div style="float: left;">&nbsp;&nbsp;&nbsp;<a href="orderBeanDetail_UserAction?id=${orderBean.id}">订单详情</a></div>
								</div>
							</div>
						</div>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>



















