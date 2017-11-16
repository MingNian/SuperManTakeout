<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div
	style="width: 170px;height: 500px;float: left;background-color: white;">

	<div style="width: 100%;height: 15px;"></div>

	<div class="myMenu">
		<br> <span class="glyphicon glyphicon-list-alt"
			style="font-size:18px;margin-left: 30px;"></span> <a
			href="User/getUserOrderBeans_UserAction" target="myMenuFrame"
			style="font-size: 14px;margin-left: 10px;">三个月订单</a>
	</div>

	<div class="myMenu">
		<br> <span class="glyphicon glyphicon-user"
			style="font-size:18px;margin-left: 30px;"></span> <a
			href="User/myInfo.jsp" target="myMenuFrame"
			style="font-size: 14px;margin-left: 10px;">我的账号</a>
	</div>

	<div class="myMenu">
		<br> <span class="glyphicon glyphicon-star"
			style="font-size:18px;margin-left: 30px;color: yellow;"></span> <a
			href="${pageContext.request.contextPath}/User/getAllCollections_UserAction" target="myMenuFrame"
			style="font-size: 14px;margin-left: 10px;">我的收藏</a>
	</div>


	<c:choose>
		<c:when test="${empty user.shop }">
		</c:when>
		<c:otherwise>
			<div class="myMenu">
				<br> <span class="glyphicon glyphicon-home"
					style="font-size:18px;margin-left: 30px;color:black; "></span> <a
					href="frames/shopIndex.jsp" target="_blank"
					style="font-size: 14px;margin-left: 10px;">我的店铺</a>
			</div>
		</c:otherwise>
	</c:choose>


</div>
















