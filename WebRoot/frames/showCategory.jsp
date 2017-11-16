<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>

<h6 class="sub-header">
	<a href="${pageContext.request.contextPath}/frames/addCategory.jsp">添加新菜品分类</a>
</h6>
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="col-md-2 col-xs-2 col-sm-1">序号</th>
				<th class="col-md-3 col-xs-3 col-sm-3">菜系</th>
				<th class="col-md-5 col-xs-5 col-sm-5">备注</th>
				<th class="col-md-2 col-xs-2 col-sm-2">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty categorySets}">
					<tr>
						<td colspan="4"><span style="text-align: center;">当前菜品分类为空!</span></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:set var="xuhao" value="${ pageNum*pageSize-pageSize+1}"></c:set>
					<c:forEach items="${categorySets }" var="category">
						<tr>
							<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }" /></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/showEditCategory_CommodityAction?category.id=${category.id }">${category.categoryName }</a></td>
							<td>${category.categoryRemark }</td>
							<td><a
								href="${pageContext.request.contextPath}/shop/delCategory_CommodityAction?category.id=${category.id }">刪除</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</tbody>
	</table>
	
</div>




