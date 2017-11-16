<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	    <%@ include file="../head.jsp"%>
		<base href="http://localhost:8080/wm/"/>
		<link rel="stylesheet" type="text/css" href="css/shopManageCommon.css">
		<style type="text/css">
		div{
		float:left;}
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
			#div1{
				margin-top:30px;
				margin-left:40px;
			}
			#div2{
				margin-top:30px;
				margin-left:10px;
			}
			#div3{
				margin-top:30px;
				margin-left:10px;
			}
			#div4{
				margin-top:30px;
				margin-left:10px;
			}
			#div5{
				margin-top:30px;
				margin-left:30px;
			}
			#div_tbl{
				width:100%;
				margin-top:20px;
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
				window.location.href="shop/preOrderBean_OrderBeanAction?currPage="+pageNum;
			}
		</script>
	</head>
	<body>
		<div id="div0">
			<div id="div_main">
				<div id="div1" >
					<a href="shop/preToday_OrderBeanAction?currPage=1">今日订单</a>
				</div>
				<div id="div2">
					<a href="shop/preWeek_OrderBeanAction?currPage=1">最近一周订单</a>
				</div>
				<div id="div3">
					<a href="shop/preMonth_OrderBeanAction?currPage=1">最近一个月订单</a>
				</div>
				<div id="div4">
					<a href="shop/preSeason_OrderBeanAction?currPage=1">最近三个月订单</a>
				</div>
				<br/>
				<div id="div_tbl">
						<table id="tbl" border="1" style="width:96%;margin-left:2%;">
							<tr>
								<th style="text-align:center;">序号</th>
								<th style="text-align:center;">订餐用户</th>
								<th style="text-align:center;">订单总价</th>
								<th style="text-align:center;">订单日期</th>
								<th style="text-align:center;">订单状态</th>
								<th style="text-align:center;">订单详情</th>
							</tr>
							<c:choose>
								<c:when test="${empty orderBeans3}">
								<tr>
									<th colspan="6" style="text-align:center;">暂时没有任何历史订单</th>
								</tr>
								</c:when>
								<c:otherwise>
									<c:set var="i" value="0"/>
									<c:forEach items="${orderBeans3}" var="orderBean">
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