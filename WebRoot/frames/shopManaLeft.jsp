<%@page contentType="text/html; charset=utf-8"%>
<html>
	<head>
		<base href="http://localhost:8080/wm/">
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			#div_left{
				width:100%;
				height:100%;
				background-color:#CCFFFF;
			}
			.tbl{
				width:70%;
				margin-left:15%;
			}
			.tbl tr, .tbl th{
				height:60px;
			}
			table{
				border-collapse: collapse;
				border-spacing: 0;
			}
		</style>
	</head>
	<body>
		<div id="div_left">
			<table class="tbl">
				<tr>
					<th><a href="frames/upShopInfo.jsp" target="shopManaMain">商铺信息</a></th>
				</tr>
				<tr>
					<th><a href="shop/preCommodity_CommodityAction" target="shopManaMain">热卖菜品管理</a></th>
				</tr>
				<tr>
					<th><a href="shop/preDelCommodity_CommodityAction" target="shopManaMain">已下架菜品管理</a></th>
				</tr>
				<tr>
					<th><a href="shop/prePending_OrderBeanAction" target="shopManaMain">待处理订单</a></th>
				</tr>
				<tr>
					<th><a href="shop/preOrderBean_OrderBeanAction" target="shopManaMain">历史账单查询</a></th>
				</tr>
			</table>
		</div>
	</body>
</html>