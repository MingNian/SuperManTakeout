<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	var temp = 0;
	function applyOffer(){
		var btn = event.srcElement;
		window.location.href="offer_AdminAction.action?shopApplyId=" + btn.getAttribute("applyId");
	};
	$(document).ready(function() {
	
		$("#not").click(function() {
			temp = $(this).attr("applyId");
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


	<form method="post" action="notOffer_AdminAction.action"
		class="form-horizontal" role="form" id="myForm" onsubmit="return ">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>认证不通过</h4>
					</div>

					<div class="modal-body">
						<!--  模态框内容，我在此处添加一个表单 -->
						<form class="form-horizontal" role="form">
							<input type="hidden" name="shopApplyId" value="0" id="hidden">
							<div class="form-group">
								<div style="width: 94%; margin-left:3%;">
									<input type="text" id="uname" name="content"
										class="form-control well" placeholder="在这里输入认证失败的原因" />
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


<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="col-md-1 col-xs-1 col-sm-1">序号</th>
				<th class="col-md-2 col-xs-2 col-sm-2">用户名称</th>
				<th class="col-md-2 col-xs-2 col-sm-2">商家名称</th>
				<th class="col-md-2 col-xs-2 col-sm-2">商家备注</th>
				<th class="col-md-2 col-xs-2 col-sm-2">认证材料</th>
				<th class="col-md-5 col-xs-5 col-sm-3">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty shopApplies }">
					<td colspan="5"><span style="text-align: center;">当前没有申请</span></td>
				</c:when>
				<c:otherwise>
					<c:set var="xuhao" value="${ pageNum*pageSize-pageSize+1}" />
					<c:forEach items="${shopApplies }" var="apply">
						<tr>
							<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }" /></td>
							<td><a href="shopApplyHistory_AdminAction.action?uid=${apply.user.id}">${apply.user.nickName}</a></td>
							<td>${apply.shopName}</td>
							<td>${apply.shopRemark }</td>
							<td><a href="${pageContext.request.contextPath}${apply.applyPath}">${apply.shopName }的材料</a></td>
							<td><button class="btn btn-primary btn-xs" class="offer" onclick="applyOffer();"
									applyId="${apply.id}">认证通过</button>
								<button class="btn btn-danger btn-xs" data-toggle="modal"
									data-target="#myModal" id="not" applyId="${apply.id}">认证不通过</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>

</div>

<ul class="pager">
	<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shou"
		href="shopApply_AdminAction.action?pageNum=1">&lt;&lt;</a></li>
	<li ${pageNum==1? " class='disabled' ":"class=''" }><a id="shang"
		href="shopApply_AdminAction.action?pageNum=${pageNum-1}">&lt;</a></li>
	<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
		id="xia" href="shopApply_AdminAction.action?pageNum=${pageNum+1}">&gt;</a></li>
	<li ${pageNum==pageCount? " class='disabled' ":"class=''" }><a
		id="wei" href="shopApply_AdminAction.action?pageNum=${pageCount}">&gt;&gt;</a></li>
</ul>

