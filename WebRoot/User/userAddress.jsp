<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<title>超人外卖</title>
</head>
<body>
	<%@ include file="address.jsp"%>
	<%@ include file="logo.jsp"%>

<div style="width: 980px;min-height:18px;margin-left: auto;   margin-right: auto;margin-top: 12px;overflow: hidden; ">
	<a href="browsingShop_UserAction?shop.id=${shop.id}">${shop.shopName}</a>确认购买
</div>

<div style="width: 980px;min-height: 100px;margin-left: auto;   margin-right: auto;margin-top: 12px;overflow: hidden; ">

	<div style="width: 370px;overflow: hidden;background-color: white;float: left;">
		<div style="width: 100%;height: 30px;margin-left: 12px;border-bottom: 1px solid gray;">
			<div style="width: 100%;heig;12px;"></div> 
			<strong style="font-size: 14px;">菜品</strong>
			<strong style="font-size: 14px;margin-right: 20px;" class="pull-right">价格</strong>
		</div>
		<c:choose>
			<c:when test="${empty currCartItems }">
				<h3>购物车内暂时没有商品</h3>
			</c:when>
			<c:otherwise>
				<c:set var = "total" value = "0"></c:set>
				<c:forEach items="${currCartItems }" var="cartItem">
					<div style="width: 100%;height: 40px;margin-left: 12px;">
						<div style="width: 100%;height: 10px;"></div>
						<span>${cartItem.commodity.commodityName}</span>
						<span class="pull-right" style="margin-right: 20px;">￥${cartItem.count * cartItem.commodity.price}</span>
						<c:set var = "total" value="${total + cartItem.count * cartItem.commodity.price}"></c:set>
					</div>
				</c:forEach>
				<div style="width: 100%;height: 40px;margin-left: 12px;border-bottom: 1px solid gray;">
					<div style="width: 100%;height: 10px;"></div>
					<span>配送费</span>
					<span class="pull-right" style="margin-right: 20px;">￥${shop.shopDetail.serviceMoney}</span>
					<c:set var = "total" value="${total + shop.shopDetail.serviceMoney}"></c:set>
				</div>
				<div style="width: 100%;height: 30px;margin-left: 12px;">
					<div style="width: 100%;heig;12px;"></div> 
					<strong style="font-size: 14px;">总计</strong>
					<strong style="font-size: 14px;margin-right: 20px;" class="pull-right">￥${total }</strong>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div style="width: 560px;overflow: hidden;background-color: white;float: left;" class="pull-right">
		<form action="pay_UserAction" method="post">
		<div style="width: 540px;margin-left: 12px;">
			<div style="width: 100%;height: 20px;"></div>
			<span style="font-size: 18px;">送餐详情</span>
			<a href="addNewUserAddress.jsp"><span class="pull-right">添加新地址</span></a>
			<c:choose>
				<c:when test="${empty addresses }">
					<h3>暂无地址</h3>
				</c:when>
				<c:otherwise>
					<c:forEach items="${addresses }" var="addr"> 
						<div style="width: 530px;height: 90px;background-color: #fafafa;margin-bottom: 10px;">
							<div style="width: 500px;margin-left: auto;margin-right: auto;">
								<div style="width: 100%;height: 10px;"></div>
								<span style="font-size: 18px;"> ${addr.username }&nbsp;:&nbsp;${addr.tel }</span>		
								<div style="width: 100%;height: 10px;border-bottom: 1px solid gray;"></div>
								<div style="width: 100%;height: 10px;"></div> 
								<span style="font-size: 18px;"> ${addr.address }&nbsp;:&nbsp;</span>	
								<span class="pull-right">使用地址<input type="radio" name="def" value="${addr.id }" ${addr.defaultAddrFlag? 'checked="checked"':'' }></span>
							</div>
						</div>
					</c:forEach>
					<div style="width: 530px;height: 32px;margin-bottom: 10px;">
						<div style="width: 90px;float: left;height: 22px;">给商家留言</div>
						<div style="width: 430px;float: left;height: 22px;">
							<input type="text" name="liuyan" placeholder="不要辣,多放盐等口味需求" class="form-control">
						</div>
						<div style="width: 100%;height: 10px;"></div>
					</div>
					
					<div style="width: 530px;height: 90px;">
						<div style="width: 480px;height: 20px;"></div>
						<div style="width: 190px;height: 50px;float: left;">
							<strong>你需支付</strong><span style="font-size: 22px;color: #ffa735">${total }</span>元
						</div>
						<div style="width: 300px;height: 50px;float: left;">
							<div style="width: 110px;height: 33px;">
								<input type="submit" value="去付款" class="btn btn-warning">
							</div>
						</div>
						<div style="width: 480px;height: 20px;"></div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		</form>
	</div>
</div>
</body>
</html>

