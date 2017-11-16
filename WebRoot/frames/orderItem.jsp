<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@ include file="../head.jsp"%>
		<base href="http://localhost:8080/wm/"/>
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			html,body{
				margin:0;
				padding:0;
				height:100%;
				background-color: white;
			}
			#div0{
				width:100%;
				height:100%;
				background-color: white;
				border:1px solid gray;
			}
			#div_item{
				width:98%;
				margin-left:1%;
				height:98%;
				margin-top:5px;
			}
			#tbl{
				margin-left:10%;
				margin-top:20px;
			}
			
			#tbl tr,#tbl th{
				height:25px;
			}
		
			#div_tbl{
				width:98%;
				margin-left:1%;
				margin-top:1px;
				height:68%;
				background-color:lavender;
			}
			#div_title{
				width:30%;
				margin-left:44%;
				margin-top:2px;
			}
			#div_addr{
				width:98%;
				margin-left:1%;
				height:28%;
				background-color:lavender;
			}
			#div_move{
				margin-top:10px;
			}
			#div_reply{
				margin-top:10px;
				width:90%;
				margin-left:7%;
			}
		</style>
	</head>
	<body>
		<div id="div0">
			<div id="div_item">
				<div id="div_tbl">
					<div id="div_title">
						订单详情
					</div>
					<table id="tbl" style="width:80%;">
						<c:choose>
								<c:when test="${empty orderBean}">
									<tr>
										<th colspan="3">暂时没有任何历史订单</th>
									</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${orderBean.orderItems}" var="orderItem">
									<tr style="text-align:center;">
										<td>${orderItem.commodity.commodityName}</td>
										<td>${orderItem.count}</td>
										<td>${orderItem.commodity.price * orderItem.count}</td>
									</tr>
								</c:forEach>
								<tr style="text-align:center;">
										<th>配送费</th>
										<td></td>
										<td>${orderBean.shop.shopDetail.serviceMoney}</td>
									</tr>
									<tr style="text-align:center;">
										<th>实际支付</th>
										<td></td>
										<td colspan="2" style="color:red;font-size:25px;">￥${orderBean.orderBeanMoney}</td>
									</tr>
									<tr style="text-align:center;">
										<th>订单备注</th>
										<td colspan="2">${orderBean.orderBeanRemark}</td>
									</tr>
									<tr style="text-align:center;">
										<th>订单评论</th>
										<td colspan="2">${orderBean.evaluate.content}</td>
									</tr>
								</c:otherwise>
						</c:choose>
					</table>
					<div id="div_reply">
						<form action="shop/addReply_OrderBeanAction" method="post">
							<input type="hidden" name="id" value="${orderBean.id}"/>
							<textarea class="form-control" rows="2" cols="60" name="reply.content" placeholder="请输入商家回复"></textarea>
							<div style="float:right;margin-top:5px;"><input class="btn btn-primary" type="submit" value="确认回复"></div>
						</form>
					</div>
				</div>
				<div id="div_addr">
					<div id="div_move">
					<table id="tbl" style="width:80%;">
						<tr>
							<th style="width:10%;">地址</th>
							<td>${orderBean.orderBeanAddr.address}</td>
						</tr>
						<tr>
							<th>姓名</th>
							<td>${orderBean.user.realName}</td>
						</tr>
						<tr>
							<th>电话</th>
							<td>${orderBean.orderBeanTel}</td>
						</tr>
						<tr>
							<th>备注</th>
							<td>${orderBean.orderBeanRemark}</td>
						</tr>
						<tr>
							<td style="text-align:center;" colspan="2">本订单由 超人专送 提供专业高品质送餐服务</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>