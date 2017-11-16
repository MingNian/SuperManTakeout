<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div
	style="width: 980px;overflow:hidden;background-color: #F5F5F5;margin-left: auto; margin-right: auto;margin-top: 12px; ">
	<div
		style="width: 660px;overflow:hidden;background-color: white;margin-top: 12px;padding-left: 20px;padding-right: 20px;">
		<div style="width: 100%;height: 3px;"></div> 
		<div>
			<c:choose>
				<c:when test="${empty categories}"> 
					<h3>抱歉哦亲！此商家暂无菜品信息哦！！！</h3>
				</c:when>
				<c:otherwise> 
					<div style="width: 100%;height: 10px;"></div>
					<c:forEach items="${categories }" var="category">
						<c:choose>
							<c:when test="${empty category.commodities}">
							</c:when>
							<c:otherwise>
								<c:forEach items="${category.commodities}" var="commodity">
									<div class="commodityItem">
									<div style="width:100%;height: 22px;float: left;"></div> 
									<div style="width: 15px;height: 210px;float: left;"></div> 
									<div style="width:175 ;height:130 ;float: left;">
										<img width="173" height="127" alt="${commodity.commodityName }" src="${commodity.commodityImg}"><br>
										<strong>${commodity.commodityName }</strong><br>
										<small>${commodity.commodityRemark }</small><br>
										<span class="pull-left"><span style="color: red">￥${commodity.price }</span></span>
										<span class="pull-right">
											<a href="User/addCart_UserAction?commodity.id=${commodity.id}">
											<span class="glyphicon glyphicon-plus" style="color: #ffd161"></span>
											</a> 
										</span>
										<br><hr>
									</div>
										<br>
									</div> 
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div style="width: 100%;height: 10px;float: left; "></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div style="width: 300;"></div>
	
</div>








