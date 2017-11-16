<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	if(${pageNum}==1){
		$("#shou").attr("href","javascript:;");
		$("#shang").attr("href","javascript:;");
	}
	if(${pageNum}==${pageCount}){
		$("#xia").attr("href","javascript:;");
		$("#wei").attr("href","javascript:;");
	}
});
</script>

<h6 class="sub-header">
	<a href="addCategory.jsp">添加新菜品分类</a>
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
				<c:when test="${empty categories}">
					<tr>
						<td colspan="4"><span style="text-align: center;">当前菜品分类为空!</span></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:set var="xuhao" value="${ pageNum*pageSize-pageSize+1}"></c:set>
					<c:forEach items="${categories }" var="category">
						<tr>
							<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }" /></td>
							<td><a
								href="toCategoryEdit_AdminAction.action?CategoryId=${category.id }">${category.categoryName }</a></td>
							<td>${category.categoryRemark }</td>
							<td><a
								href="deleteCategory_AdminAction.action?actegoryId=${category.id }">刪除</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</tbody>
	</table>
	<ul class="pager">
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shou"
			href="categoryManage_AdminAction.action?pageNum=1">&lt;&lt;</a></li>
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shang"
			href="categoryManage_AdminAction.action?pageNum=${pageNum-1}">&lt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
			id="xia"
			href="categoryManage_AdminAction.action?pageNum=${pageNum+1}">&gt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
			id="wei"
			href="categoryManage_AdminAction.action?pageNum=${pageCount}">&gt;&gt;</a></li>
	</ul>
</div>




