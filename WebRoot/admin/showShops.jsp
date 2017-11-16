<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>

<script type="text/javascript">
	var temp = 0;
	$(document).ready(function() {
		$(".stop").click(function() {
			temp = $(this).attr("shopId");
			$("#hidden").attr("value", temp);
		});
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


<div class="container">
	<h6 class="sub-header">
		<a href="javascript:;">&nbsp;</a>
	</h6>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md-1 col-xs-1 col-sm-1">序号</th>
					<th class="col-md-2 col-xs-2 col-sm-2">商家名称</th>
					<th class="col-md-2 col-xs-2 col-sm-2">认证材料</th>
					<th class="col-md-3 col-xs-3 col-sm-3">联系邮箱</th>
					<th class="col-md-2 col-xs-2 col-sm-2">营业状态</th>
					<th class="col-md-2 col-xs-2 col-sm-2">操作</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty displayShops }">
						<td colspan="5"><span style="text-align: center;">没有商家入驻</span></td>
					</c:when>
					<c:otherwise>
						<c:set var="xuhao" value="${ pageNum*pageCount-pageCount+1}"></c:set>
						<c:forEach items="${displayShops }" var="shop">
							<tr>
								<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }"/></td>
								<td><a target="_blank" href="${pageContext.request.contextPath}/User/browsingShop_UserAction?id=${shop.id}">${shop.shopName}</a></td>
								<td><a href="${pageContext.request.contextPath}${shop.docPath}">${shop.shopName }的材料</a></td>
								<td>${shop.user.email}</td>
								<td><c:choose>
										<c:when test="${shop.status ==0 }">
											禁止营业
										</c:when>
										<c:when test="${shop.status ==1 }">
											休息中
										</c:when>
										<c:otherwise>
											营业中
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${shop.status ==0 }">
											<a href="recoverBusiness_AdminAction?shopId=${shop.id }">恢复营业</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:;" data-toggle="modal"  class="stop"
												data-target="#myModal" id="stop" shopId="${shop.id}">禁止营业</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<ul class="pager">
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shou"
			href="showShops_AdminAction.action?pageNum=1">&lt;&lt;</a></li>
		<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shang"
			href="showShops_AdminAction.action?pageNum=${pageNum-1}">&lt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a id="xia" 
			href="showShops_AdminAction.action?pageNum=${pageNum+1}">&gt;</a></li>
		<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a id="wei" 
			href="showShops_AdminAction.action?pageNum=${pageCount}">&gt;&gt;</a></li>
	</ul>
</div>



<div class="container">

	<form method="post" action="stopBusiness_AdminAction"
		class="form-horizontal" role="form" id="myForm" onsubmit="return ">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>暂停营业</h4>
					</div>

					<div class="modal-body">
						<!--  模态框内容，我在此处添加一个表单 -->
						<form class="form-horizontal" role="form">
							<input type="hidden" name="shopId" value="0" id="hidden">
							<div class="form-group">
								<div style="width: 94%; margin-left:3%;">
									<input type="text" id="uname" name="content"
										class="form-control well" placeholder="在这里输入暂停营业的原因" />
								</div>
							</div>
						</form>
					</div>

					<div class="modal-footer">
						<!--  模态框底部样式，一般是提交或者确定按钮 -->
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- /.modal -->
	</form>
</div>


