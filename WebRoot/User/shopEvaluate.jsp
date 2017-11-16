<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div
	style="width: 980px;overflow:hidden;background-color: #F5F5F5;margin-left: auto; margin-right: auto;">
	<div
		style="width: 660px;overflow:hidden;background-color: white;margin-top: 12px;padding-left: 20px;padding-right: 20px;float: left;">
		<div>
			<c:choose>
				<c:when test="${empty evaluates}">
					<div><h3>该商家暂时没有收到任何评论</h3></div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${evaluates}" var="evaluate">
						<div style="width:100%;float: left; ">
							<div style="width: 70px;floa;left;">
								<img class="img-circle"
									alt="${evaluate.orderBean.user.nickName }"
									src="${evaluate.orderBean.user.realName}" width="60"
									height="60" style="margin-left: 5px;">
							</div>
							<div style="width: 530px;float: left;margin-left: 15px;">
								<div style="width: 100%;height: 8px;"></div>
								<span class="h4">${evaluate.orderBean.user.realName}</span> <span style="width: 10px;"></span>
								<span class="glyphicon glyphicon-star" style="color: orange"></span>
								<span class="glyphicon glyphicon-star" style="color: orange"></span>
								<span class="glyphicon glyphicon-star" style="color: orange"></span>
								<span class="glyphicon glyphicon-star" style="color: orange"></span>
								<span class="glyphicon glyphicon-star" style="color: orange"></span>
								<span style="width: 10px;">${evaluate.stars}</span> <span class="pull-right"
									style="color: gray;">订单日期：${evaluate.orderBean.orderBeanTime}</span> <br>
										<span style="font-size:x-large">评论内容：${evaluate.content}</span>
										<div style="float:right"><span class="pull-right" style="color: gray;">评论日期：${evaluate.evaluateDate}</span></div><hr>
								<c:choose>
									<c:when test="${empty evaluate.reply}">
									</c:when>
									<c:otherwise>
										<!-- 判断是否有商家回复，如果有则显示商家回复，如果没有隐藏此行 -->
										<span style="color: orange">商家回复:</span> <span>${evaluate.reply.content}</span>
											<div style="float:right"><span class="pull-right" style="color: gray;">回复日期：${evaluate.reply.replyDate}</span></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<hr>

												<%-- <td>${evaluate.orderBean.user.nickName}</td>
												<!-- 此处应该是头像 --> --%>
												<%-- <td>${evaluate.stars}</td>
												<!-- 用stars决定显示的星星数 -->
												<td>${evaluate.stars}</td>
												<!-- 判断星星数大于3显示好评，小于3显示差评 --> --%>
							
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div
		style="width: 310px;height:260px;float: left;margin-left: 10px;background-color: white;margin-top: 12px;">
		<div style="width: 100%;height: 15px;"></div>
		<span class="h4" style="color: orange;margin-left: 15px;">总体评分</span>
		<hr>
		<div style="width: 280px;float: left;margin-left: 15px;height: 180px;">
			<strong class="h2">3.6</strong><span class="glyphicon glyphicon-star"
				style="color: orange; font-size: 20px"></span> <span
				class="glyphicon glyphicon-star"
				style="color: orange; font-size: 20px"></span> <span
				class="glyphicon glyphicon-star"
				style="color: orange; font-size: 20px"></span> <span
				class="glyphicon glyphicon-star"
				style="color: orange; font-size: 20px"></span> <span
				class="glyphicon glyphicon-star"
				style="color: orange; font-size: 20px"></span>

		</div>

	</div>

</div>

























