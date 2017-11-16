<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@ include file="../head.jsp"%>
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			html,body{
				margin:0;
				padding:0;
				height:100%;
				background-color: white;
			}
			#div0{
				height:100%;
				width:100%;
				background-color: white;
			}
			#div1 {
			width: 100%;
			height: 98%;
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
		<script>
			$(function() {
			$('#myModal').modal('hide')
			});
		</script>
		<script>
			$(function() {
			$('#myModal').on('hide.bs.modal', function() {
			})
		});
		</script>
		<script type="text/javascript">
			function toPage(pageNum){
				window.location.href="shop/prePending_OrderBeanAction?currPage="+pageNum;
			}
		</script>
	</head>
	<body>
		<div id="div0">
			<div id="div1">
				<table id="tbl" border="1" style="width:98%;margin-left:1%;margin-top:20px;">
					<tr>
						<th style="text-align:center;">序号</th>
						<th style="text-align:center;">订餐用户</th>
						<th style="text-align:center;">订单时间</th>
						<th style="text-align:center;">订单状态</th>
						<th style="text-align:center;">操作</th>
						<th style="text-align:center;">订单详情</th>
					</tr>
					<c:choose>
						<c:when test="${empty orderBeans2}">
						<tr>
							<th colspan="6" style="text-align:center;">暂时没有任何订单</th>
						</tr>
						</c:when>
						<c:otherwise>
							<c:set var="i" value="0"/>
							<c:forEach items="${orderBeans2}" var="orderBean">
								<c:set var="i" value="${i+1}"/>
								<tr style="text-align: center;">
									<td>${i}</td>
									<td>${orderBean.user.realName}</td>
									<td>${orderBean.orderBeanTime}</td>
									<td>
										<c:choose>
											<c:when test="${orderBean.status==0}">
												待结单
											</c:when>
											<c:when test="${orderBean.status==1}">
												已结单
											</c:when>
											<c:when test="${orderBean.status==2}">
												正在配送
											</c:when>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${orderBean.status==0}">
												<a href="dealPendingOrderBean_OrderBeanAction?id=${orderBean.id}&status=${orderBean.status}">接单</a>
												&nbsp;&nbsp;&nbsp;
												<a data-toggle="modal" data-target="#myModal${orderBean.id }">不接单</a>
											</c:when>
											<c:when test="${orderBean.status==1}">
												<a href="dealPendingOrderBean_OrderBeanAction?id=${orderBean.id}&status=${orderBean.status}">配送</a>
											</c:when>
											<c:when test="${orderBean.status==2}">
												<a href="dealPendingOrderBean_OrderBeanAction?id=${orderBean.id}&status=${orderBean.status}">已送达</a>
											</c:when>
										</c:choose>
									</td>
									<td><a href="detail_OrderBeanAction?id=${orderBean.id}">查看订单详情</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
				<c:choose>
				<c:when test="${not empty orderBeans2}">
			     <c:set var="i" value="0"/>
				<c:forEach items="${orderBeans2}" var="orderBean">
				<form action="setPendingOrderBean_OrderBeanAction" method="post">
					<c:set var="i" value="${i+1}"/>
				<input type="hidden" name="id" value="${orderBean.id}"/>
				<input type="hidden" name="status" value="0"/>
				<div class="modal fade" id="myModal${orderBean.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
							</button>
							<h4 class="modal-title" id="myModalLabel">
								请商家输入不接单理由
							</h4>
						</div>
						<div class="modal-body">
							<textarea cols="95" rows="10" name="content" placeholder="请输入理由"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" class="btn btn-primary">
								确认提交
							</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				</form>
				</c:forEach>
				</c:when>
			</c:choose>
		
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