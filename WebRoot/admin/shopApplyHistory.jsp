<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>



<div class="container">
	<h6 class="sub-header">
		<span>用户${disPlayUser.nickName }历史申请记录</span>
	</h6>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md-1 col-xs-1 col-sm-1">序号</th>
					<th class="col-md-2 col-xs-2 col-sm-2">申请材料</th>
					<th class="col-md-2 col-xs-2 col-sm-2">商家名称</th>
					<th class="col-md-3 col-xs-3 col-sm-3">商家备注</th>
					<th class="col-md-2 col-xs-2 col-sm-2">申请状态</th>
					<th class="col-md-2 col-xs-2 col-sm-2">原因/操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty shopApplyHistory }">
						<td colspan="5"><span style="text-align: center;">没有商家入驻</span></td>
					</c:when>
					<c:otherwise>
						<c:set var="xuhao" value="${ pageNum*pageCount-pageCount+1}"></c:set>
						<c:forEach items="${shopApplyHistory }" var="shopApply">
							<tr>
								<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }"/></td>
								<td>${shopApply.applyPath}</td>
								<td>${shopApply.shopName}</td>
								<td>${shopApply.shopRemark}</td>
								<td><c:choose>
										<c:when test="${shopApply.state ==0 }">
											不通过
										</c:when>
										<c:otherwise>
											待处理
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${shopApply.state ==0 }">
											${shopApply.reason}
										</c:when>
										<c:otherwise>
											<button class="btn btn-primary btn-xs" class="offer" onclick="javascript:window.open('offer_AdminAction.action?shopApplyId=${shopApply.id}','_self')"
												applyId="${shopApply.id}">认证通过</button>
											<button class="btn btn-danger btn-xs" data-toggle="modal"
												data-target="#myModal" id="not" applyId="${shopApply.id}">认证不通过</button>
<div class="container">
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
			</div>
		</div>
	</form>
</div>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>


</div>

