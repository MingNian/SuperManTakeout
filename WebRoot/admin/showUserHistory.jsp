<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>

<div class="container">
	<h6 class="sub-header">
		<a href="javascript:;">&nbsp;</a>
	</h6>
	<span>${disPlayUser.nickName }</span>的历史订单<br>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md-1 col-xs-1 col-sm-1">序号</th>
					<th class="col-md-2 col-xs-2 col-sm-2">商铺</th>
					<th class="col-md-2 col-xs-2 col-sm-2">总价</th>
					<th class="col-md-2 col-xs-2 col-sm-2">状态</th>
					<th class="col-md-5 col-xs-5 col-sm-5">评价</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty historyOrder }">
						<td colspan="5"><span style="text-align: center;">该用户暂无订单记录</span></td>
					</c:when>
					<c:otherwise>
						<c:set var="xuhao" value="${ pageNum*pageSize-pageSize+1}"></c:set>
						<c:forEach items="${historyOrder }" var="order">
							<tr>
								<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }"/></td>
								<td>${order.shop.shopName }</td>
								<td>${order.orderBeanMoney}</td>
								<td>
									<c:choose>
										<c:when test="${order.status == 0 }">
											尚未接单
										</c:when>
										<c:when test="${order.status == 1 }">
											已接单
										</c:when>
										<c:when test="${order.status == 2 }">
											正在配送
										</c:when>
										<c:when test="${order.status == 3 }">
											已完成
										</c:when>
										<c:when test="${order.status == -1 }">
											拒绝接单
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty order.evaluate }">
											没有评论
										</c:when>
										<c:otherwise>
											${order.evaluate.content }
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

</div>

