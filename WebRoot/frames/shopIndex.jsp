<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<title>超人外卖商家管理平台</title>

<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
	background-color: #F5F5F5;
}
</style>

</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container"
			style="min-width: 960px;margin-left: 100px;margin-right: 100px;">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="shopIndex.jsp">超人外卖商家管理平台</a>
			</div>

			<div class="navbar-right">
				<c:choose>
					<c:when test="${empty currShop1 }">
						<a class="navbar-brand" style="font-size: 12px;"
							href="../index.jsp">退出</a>
					</c:when>
					<c:otherwise>
						<a class="navbar-brand" style="font-size: 12px;">欢迎用户:${currShop1.shopName}</a>
						<a class="navbar-brand" style="font-size: 12px;"
							href="${pageContext.request.contextPath}/index.jsp">退出登录</a> 
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<div style="width: 100%;height: 70px;"></div>

	<div class="container" style="height: 75%;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3" style="background-color: white;overflow: hidden;">
					<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
						<li class="active"><a> <i
								class="glyphicon glyphicon-th-large" style="background-color: #555555"></i> 超人外卖商家管理平台
						</a></li>
						<li><hr></li>
						<li><a class="adminInfo" href="${pageContext.request.contextPath}/frames/upShopInfo.jsp"
							target="main"> <i class="glyphicon glyphicon-credit-card"></i>
								商铺信息
						</a></li>
						<li><a class="shopApply" href="${pageContext.request.contextPath}/shop/categoryManage_CommodityAction"
							 target="main"> <i class="glyphicon glyphicon-globe"></i>
								菜品分类管理
						</a></li>
						<li><a class="shopApply" href="${pageContext.request.contextPath}/shop/preCommodity_CommodityAction"
							 target="main"> <i class="glyphicon glyphicon-globe"></i>
								在售菜品管理
						</a></li>
						<li><a class="shopApply" href="${pageContext.request.contextPath}/shop/preDelCommodity_CommodityAction"
							 target="main"> <i class="glyphicon glyphicon-inbox"></i>
								已下架菜品管理
						</a></li>
						<li><a class="categoryManage" href="${pageContext.request.contextPath}/shop/prePending_OrderBeanAction" target="main"> <i
								class="glyphicon glyphicon-calendar"></i> 待处理订单
						</a></li>
						<li><a class="showShops" href="${pageContext.request.contextPath}/shop/preOrderBean_OrderBeanAction"
							target="main"> <i class="glyphicon glyphicon-fire"></i>
								历史账单查询
						</a></li>
					</ul>
				</div>

				<div id="index_div" class="col-md-9"> 
					<iframe name="main" src="${pageContext.request.contextPath}/shop/getShopdetail_ShopAction"
						frameborder="0" width="90%" height="480px;" scrolling="no" ></iframe>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../copyRight.jsp"%>
</body>
</html>