<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
		<head>
		<%@ include file="../head.jsp"%>
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
			<form action="../shop/addCommodity_CommodityAction" method="post" enctype="multipart/form-data">
				<table class="tbl">
					<tr>
						<th>菜品图片</th>
						<td>
						<img src="" style="width:100px;" title="点击更换图片"/><br/>
						<input class="form-control" type="file" name="commodityImg" />
						</td>
					</tr>
					<tr>
						<th>菜品类别</th>
						<td>
							<select class="form-control" name="commodity.category.id">  
							  <c:choose>
							  	<c:when test="${empty categories}">
							  	
							  	</c:when>
							  	<c:otherwise>
							  		<c:forEach items="${categories}" var="category">
								  			<option value="${category.id}" >${category.categoryName}</option>
							  		</c:forEach>
							  	</c:otherwise>
							  </c:choose>
							</select>  
						</td>
					</tr>
					<tr>
						<th>菜品名称</th>
						<td><input type="text" class="form-control" name="commodity.commodityName" /></td>
					</tr>
					<tr>
						<th>菜品价格</th>
						<td><input type="text" class="form-control" name="commodity.price" placeholder="请输入菜品价格(整数或小数)" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>
					</tr>
					<tr>
						<th>菜品简介</th>
						<td><input type="text" class="form-control" name="commodity.commodityRemark" /></td>
					</tr>
					<tr>
						<th colspan="2">
							<div style="float:right;"><input type="submit"  class="btn btn-primary" value="确认添加"></div>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>