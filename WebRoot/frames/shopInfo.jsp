<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
<style type="text/css">
.item {
	width: 100%;
	height: 34px;
	margin-bottom: 8px;
}

.item-left {
	width: 130px;
	height: 100%;
	float: left;
	font-size: 18px;
	font-weight: 200;
}

.item-right {
	width: 300px;
	height: 100%;
	float: left;
	font-size: 18px;
	font-weight: 200;
}
</style>

<%@ include file="../head.jsp"%>
<script type="text/javascript">
		   
</script>
</head>
<body>
	<div style="width: 460px;height: 460px;margin-left: auto;margin-right: auto;">
		<div style="width: 100%;height: 10px;"></div>
		<div class="item">
			<div class="item-left">开始营业</div>
			<div class="item-right">${currShop2.startTime}</div>
		</div>
		<div class="item">
			<div class="item-left">打烊时间</div>
			<div class="item-right">${currShop2.closeTime}</div>
		</div>
		<div class="item" style="height: 130px;">
			<div class="item-left">店铺图片</div>
			<div class="item-right"><img src="${shopDetail2.shopImg}" style="width:120px;" /></div>
		</div>
		<div class="item">
			<div class="item-left">店铺地址</div>
			<div class="item-right">${shopDetail2.shopAddress}</div>
		</div>
		<div class="item">
			<div class="item-left">起送费</div>
			<div class="item-right">${shopDetail2.leastMoney}</div>
		</div>
		<div class="item">
			<div class="item-left">配送费</div>
			<div class="item-right">${shopDetail2.serviceMoney}</div>
		</div>
		<div class="item">
			<div class="item-left">店铺简介</div>
			<div class="item-right">${shopDetail2.shopRemark}</div>
		</div><div class="item">
			<div class="item-left">店铺公告</div>
			<div class="item-right">${shopDetail2.notice}</div>
		</div> 
		<div style="width: 80px;height: 18px;" class="pull-right">
			<a class="btn btn-primary form-control" href="${pageContext.request.contextPath}/frames/upShopInfo.jsp">修改</a>
		</div>
	</div>

	
</body>
</html>