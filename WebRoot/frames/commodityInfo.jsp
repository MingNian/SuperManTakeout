<%@page contentType="text/html; charset=utf-8"%>
<html>
		<head>
		<link rel="stylesheet" type="text/css" href="css/shopManageCommon.css">
		<style type="text/css">
		#div0 {
			width: 80%;
			margin-left: 10%;
			height: 100%;
			background-color: white;
		}
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			background-color: white;
		}
		
		#div1 {
			width: 80%;
			margin-left: 10%;
			height: 80%;
			margin-top: 3%;
		}
		.tbl {
			height: 100%;
			width: 100%;
		}
		</style>
		<script type="text/javascript">
			
		</script>
</head>
<body>
	<div id="div0">
		<div id="div1">
				<table class="tbl">
					<tr>
						<th>菜品类别</th>
						<td>${currCommodity.category.categoryName}</td>
					</tr>
					<tr>
						<th>菜品名称</th>
						<td>${currCommodity.commodityName}</td>
					</tr>
					<tr>
						<th>菜品价格</th>
						<td>${currCommodity.price}</td>
					</tr>
					<tr>
						<th>菜品简介</th>
						<td>${currCommodity.commodityRemark}</td>
					</tr>
					<tr>
						<th>菜品图片</th>
						<td>${currCommodity.commodityImg}</td>
					</tr>
				</table>
						<a href="frames/updateCommodityInfo.jsp">修改菜品信息</a>
		</div>
	</div>
</body>
</html>