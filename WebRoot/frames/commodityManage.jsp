<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@ include file="../head.jsp"%>
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			#div0{
				height:100%;
				width:100%;
				background-color: white;
			}
			html,body{
				margin:0;
				padding:0;
				height:100%;
				background-color: white;
			}
			#div1 {
			width: 100%;
			height: 100%;
		}
		#div2{
			margin-left:15px;
			margin-top:15px;
		}
		#tbl {
			margin-left:1%;
			margin-top:15px;
		}
		#tbl th,#tbl td{
			height:30px;
		}
		#page_div{
			margin-top:20px;
			margin-left:30%;
			width:40%;
		}
		</style>
		<script type="text/javascript">
			function toPage(pageNum){
				window.location.href="shop/preCommodity_CommodityAction?currPage="+pageNum;
			}
		</script>
	</head>
	<body>
		<div id="div0">
			<div id="div1">
				<div id="div2">
					<a href="../frames/addCommodityInfo.jsp">添加新菜品</a>
				</div>
				<table id="tbl" border="1" style="width:98%;">
					<tr>
						<th style="width: 10%;text-align:center;">编号</th>
						<th style="width: 15%;text-align:center;">菜品名称</th>
						<th style="width: 15%;text-align:center;">所属菜品类别</th>
						<th style="width: 30%;text-align:center;">备注</th>
						<th style="width: 10%;text-align:center;">价格</th>
						<th style="width: 20%;text-align:center;">操作</th>
					</tr>
					<c:choose>
						<c:when test="${empty commodities}">
						<tr>
							<th colspan="6" style="text-align:center;">暂时没有任何菜品</th>
						</tr>
						</c:when>
						<c:otherwise>
							<c:set var="i" value="0"/>
							<c:forEach items="${commodities}" var="commodity">
								<c:set var="i" value="${i+1}"/>
								<tr style="text-align:center;">
									<td>${i}</td>
									<td><a href="detail_CommodityAction?commodity.id=${commodity.id}">${commodity.commodityName}</a></td>
									<td>${commodity.category.categoryName}</td>
									<td>${commodity.commodityRemark}</td>
									<td>${commodity.price}</td>
									<td>
										<c:choose>
											<c:when test="${commodity.status==true}">
												<a href="reduceStatus_CommodityAction?commodity.id=${commodity.id}&commodity.status=${commodity.status}">下架</a>
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<c:set var="pageNum" value="${(not empty currPage) ? currPage : 1}" scope="session"/>
				<c:set var="pageCount" value="${(not empty pageCount) ? pageCount : 0}" scope="session"/>
				<div id="page_div">
					<input type="button" value="首页" class="btn" onclick="toPage(1)" ${ (pageNum le 1) ? "disabled" : "" }/>
					<input type="button" value="上一页" class="btn" onclick="toPage(${pageNum-1})" ${ (pageNum le 1) ? "disabled" : "" }/>
					<input type="button" value="下一页" class="btn" onclick="toPage(${pageNum+1})" ${(pageCount==pageNum) ? "disabled" : "" }/>
					<input type="button" value="尾页" class="btn" onclick="toPage(${pageCount})"  ${(pageCount==pageNum) ? "disabled" : "" } />
				</div>
			</div>
		</div>
	</body>
</html>