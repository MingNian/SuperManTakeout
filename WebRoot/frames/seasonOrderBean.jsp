<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@ include file="../head.jsp"%>
		<base href="http://localhost:8080/wm/"/>
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			#div0{
				width:100%;
				height:100%;
				background-color: white;
			}
			#div_main{
				width:100%;
				height:100%;
			}
			html,body{
				margin:0;
				padding:0;
				height:100%;
				background-color: white;
			}
			#div_title{
				font-size: 16px;
				font-style: normal;
				font-weight: bolder;
				width:100%;
				margin-left:4%;
				margin-top:3%;
			}
			#div_tbl{
				width:100%;
				margin-top:20px;
			}
			#tbl{
				margin-left:2%;
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
				window.location.href="shop/preSeason_OrderBeanAction?currPage="+pageNum;
			}
		</script>
	</head>
	<body>
		<div id="div0">
			<div id="div_main">
			<div id="div_title">最近三个月订单</div><br/>
				<div id="div_tbl">
						<table id="tbl" border="1" style="width:96%;">
							<tr>
								<th style="text-align:center;">序号</th>
								<th style="text-align:center;">订餐用户</th>
								<th style="text-align:center;">订单总价</th>
								<th style="text-align:center;">订单日期</th>
								<th style="text-align:center;">订单状态</th>
								<th style="text-align:center;">订单详情</th>
							</tr>
							<c:choose>
								<c:when test="${empty orderBeans7}">
								<tr>
									<th colspan="6" style="text-align:center;">暂时没有任何历史订单</th>
								</tr>
								</c:when>
								<c:otherwise>
									<c:set var="i" value="0"/>
									<c:forEach items="${orderBeans7}" var="orderBean">
										<c:set var="i" value="${i+1}"/>
										<tr style="text-align:center;">
											<td>${i}</td>
											<td>${orderBean.user.realName}</td>
											<td>${orderBean.orderBeanMoney}</td>
											<td>${orderBean.orderBeanTime}</td>
											<td>
												<c:choose>
													<c:when test="${orderBean.status==3}">
													已完成
													</c:when>
													<c:when test="${orderBean.status==-1}">
													已拒接
													</c:when>
												</c:choose>
											</td>
											<td><a href="shop/detail_OrderBeanAction?id=${orderBean.id}">查看订单详情</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
				</div>
				<c:set var="pageNum" value="${(not empty currPage) ? currPage : 1}" scope="session"/>
				<c:set var="pageCount" value="${(not empty pageCount) ? pageCount : 0}" scope="session"/>
				<div id="page_div">
					<input type="button" value="首页" class="btn" onclick="toPage(1)" ${ (pageNum le 1) ? "disabled" : "" }/>
					&nbsp;&nbsp;
					<input type="button" value="上一页" class="btn" onclick="toPage(${pageNum-1})" ${ (pageNum le 1) ? "disabled" : "" }/>
					&nbsp;&nbsp;
					<input type="button" value="下一页" class="btn" onclick="toPage(${pageNum+1})" ${(pageCount==pageNum) ? "disabled" : "" }/>
					&nbsp;&nbsp;
					<input type="button" value="尾页" class="btn" onclick="toPage(${pageCount})"  ${(pageCount==pageNum) ? "disabled" : "" } />
				</div>
			</div>
		</div>
	</body>
</html>