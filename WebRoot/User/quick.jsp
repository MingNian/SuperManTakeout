<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width: 980px;height: 80px;background-color: white;margin-left: auto;   margin-right: auto;margin-top: 12px; ">
	<div style="width: 100%;height: 30px;"></div>
	<div style="width: 92%;margin-left: 4%;">      
		<span class="glyphicon glyphicon-globe"></span><span class="h5">猜你喜欢</span>
		<a href="User/toggleShopKeyword_UserAction?shopKeyword="  class="h5" style="margin-left: 30px;">全部</a>
		<c:choose>
			<c:when test="${empty user || empty searchHistories}">
				<a href="User/toggleShopKeyword_UserAction?shopKeyword=下午茶"  class="h5" style="margin-left: 30px;" >下午茶</a> 
				<a href="User/toggleShopKeyword_UserAction?shopKeyword=黄焖鸡"  class="h5" style="margin-left: 30px;" >黄焖鸡</a> 
				<a href="User/toggleShopKeyword_UserAction?shopKeyword=精选小吃"  class="h5" style="margin-left: 30px;" >精选小吃</a>
				<a href="User/toggleShopKeyword_UserAction?shopKeyword=超市"  class="h5" style="margin-left: 30px;">超市</a>
				<a href="User/toggleShopKeyword_UserAction?shopKeyword=快餐小吃"  class="h5" style="margin-left: 30px;">快餐小吃</a>
			</c:when>
			<c:otherwise>
				<c:forEach items="${searchHistories}" var="searchHistory">
					<a href="User/toggleShopKeyword_UserAction?shopKeyword=${searchHistory.keyWord}"  class="h5" style="margin-left: 30px;" >${searchHistory.keyWord}</a> 
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</div>
</div>







