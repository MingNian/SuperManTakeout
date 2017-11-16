<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div style="width: 300px;overflow: hidden;background-color:white;position: fixed;bottom: 0px;left: auto; right: auto;margin-left: 870px">
	
<c:choose>
	<c:when test="${empty currCartItems}">
		<div style="width: 100%;height: 50px;background-color: #333;"> 
			<div style="width: 100px;height: 100%;float: left;"> 
				<div style="width: 100%;height:8px;"></div> 
				<span class="glyphicon glyphicon-shopping-cart" style="font-size: 35px;color: white;margin-left: 8px;"></span>
			</div> 
			<div style="float: left;width: 200px;height: 50px;text-align: center;background-color: #a0a0a0;">
				<div style="width: 100%;height: 14px;text-align: right;"></div>
				<strong style="color: white;">还差${shop.shopDetail.leastMoney}元起送</strong>
			</div>
		</div> 
	</c:when>
	<c:otherwise>
		<div style="width: 100%;height: 30px;background-color: #fafafa">
			<div style="width: 60px;height: 20px;float: left;margin-left: 8px;padding-top: 4px;">购物车</div>
			<div style="width: 90px;height: 20px;float: left;margin-left: 8px;padding-top: 4px;" class="pull-right">
				<a href="User/clearCartItems_UserAction" style="color: black;"><span class="glyphicon glyphicon-trash"></span>清空菜品</a>
			</div>
				
		</div>
		<c:forEach items="${currCartItems}" var="cartItem">
			<div style="width:284px;height: 45px;margin-left: auto;margin-right: auto;border-bottom: 1px solid #e5e5e5;">
				<div style="width: 145px;padding-top: 15px;float: left;">${cartItem.commodity.commodityName}</div>
				<div style="width: 70px;height: 20px;float: left;padding-top: 15px;">
					<div style="width: 16px;height: 16px;float: left;">
						<a href="User/cutOne_UserAction?commodity.id=${commodity.id}"><span class="glyphicon glyphicon-minus"  style="color: black;"></span></a>
					</div>
					<div style="width: 38px;height: 16px;float: left;text-align: center;">
						${cartItem.count}
					</div>
					<div style="width: 16px;height: 16px;float: left;">
						<a href="User/addOne_UserAction?commodity.id=${commodity.id}"><span class="glyphicon glyphicon-plus" style="color: black;"></span></a>
					</div>
				</div>
				<div style="width: 60px;height: 16px;float: left;padding-top: 15px;text-align: right;">￥${cartItem.commodity.price * cartItem.count}</div>
			</div>
		</c:forEach>
		<div style="width:284px;height: 45px;margin-left: auto;margin-right: auto;border-bottom: 1px solid #e5e5e5;">
			<div style="width: 220px;padding-top: 15px;float: left;">配送费（不计入起送价）</div>
			<div style="width: 55px;padding-top: 15px;float: left;text-align: right;">￥${shop.shopDetail.serviceMoney}</div>
		</div>
		<div style="width: 100%;height: 50px;background-color: #333;"> 
			<div style="width: 200px;height: 100%;float: left;"> 
				<div style="width: 100%;height:8px;"></div> 
				<span class="glyphicon glyphicon-shopping-cart" style="font-size: 35px;color: white;margin-left: 8px;"></span>
			</div> 
			<div style="background-color:#ffd161;float: left;width: 100px;height: 50px;text-align: center;">
				<div style="width: 100%;height: 14px;"></div>
				<a href="User/addresses_UserAction" style="color: black;font-size:16px;"><strong>立即下单</strong></a>
			</div>
		</div>
	</c:otherwise>
</c:choose>
	
</div>
