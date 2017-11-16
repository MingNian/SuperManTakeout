<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<style type="text/css">
	body {
	background-color: white;	
}
</style>

<div>
	<div style="width: 420px;height: 100%;margin-left:auto;margin-right: auto;overflow: hidden;">
		<div style="width: 100%;height: 36px;"></div>
		<div style="height: 30px;">订单详情</div>
		<div>
			<c:set var="total" value="0"/>		
			<div style="width: 420px;overflow: hidden;border-bottom: 1px solid gray;">
				<c:forEach items="${currOrderBean.orderItems}" var="orderItem">
					<div style="width: 200px;height: 30px;float: left;">${orderItem.commodity.commodityName}</div>
					<div style="width: 120px;height: 30px;float: left;">${orderItem.count}</div>
					<div style="width: 100px;height: 30px;float: left;">${orderItem.count * orderItem.commodity.price}</div>
					<c:set var="total" value="${total + orderItem.count * orderItem.commodity.price}"/>
				</c:forEach>
			</div>
			<div style="width:420px;height: 30px; border-bottom: 1px solid gray;">
				<div style="float: left;">配送费：</div>
				<div style="float:left;margin-left: 10px;" class="pull-right">${shop.shopDetail.serviceMoney}</div>
			</div>
			<div style="width: 420px;height: 30px;border-bottom: 1px solid gray;">
				<div style="float: left;">总支付：</div>
				<div style="float:left;margin-left: 10px;" class="pull-right">${total + shop.shopDetail.serviceMoney}</div>
			</div>
			<div style="width: 420px;height: 50px;"></div>
			<div style="width: 420px;height: 30px;">
				<div style="float: left;">订单状态：</div>
				<div style="float:left;margin-left: 10px;" class="pull-right">
				<c:choose>
					<c:when test="${currOrderBean.status == -1}">
						<div>您的订单已被商家拒接！</div>
					</c:when>
					<c:when test="${currOrderBean.status == 0}">
						<div>商家尚未接单，请稍后！</div>
					</c:when>
					<c:when test="${currOrderBean.status == 1}">
						<div>商家已接单，正在制作中！</div>
					</c:when>
					<c:when test="${currOrderBean.status == 2}">
						<div>商家制作完成，正在配送中！</div>
					</c:when>
					<c:otherwise>
						<div>已送达，订单完成！</div>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div style="width: 420px;min-height: 30px;overflow: hidden;">
				<c:choose>
					<c:when test="${empty currOrderBean.evaluate}">
						<form action="addNewEvaluate_UserAction?orderBean.id=${currOrderBean.id}" method="post">
							<div>反馈留言</div>
							<div style="width: 100%;min-height: 60px;overflow: hidden;">
								<textarea name="evaluate.content" class="form-control" placeholder="我们非常珍视您的反馈，请留下您的宝贵意见."></textarea>
							</div>
							<div style="width: 70px;height: 30px;" class="pull-right"><input type="submit" class="btn btn-primary pull-right" value="发送"></div>
						</form>
					</c:when>
					<c:otherwise>
						<div>订单反馈：<span></span>${currOrderBean.evaluate.content}</div>
					</c:otherwise>
				</c:choose>
			</div>
			
		</div>	
	</div>
</div>