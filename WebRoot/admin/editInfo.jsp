<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>

<form action="updateAdmin_AdminAction.action" method="post" id="form1">
	<input type="hidden" name="admin.id" value="${currAdmin.id}" /> <input
		type="hidden" name="admin.loginId" value="${currAdmin.loginId}" />
	<div style="width: 80%;margin-left: 10%;">

		<div style="width: 100%">
			<div style="width: 25%;float:left">
				<h4>当前账号</h4>
			</div>
			<div style="width: 70%;float:left">
				<h4>${currAdmin.loginId}</h4>
			</div>
		</div>

		<div style="width: 100%;float: left">
			<div style="width: 25%;float:left">
				<h4>名称</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="text" class="form-control" name="admin.adminName"
					value="${currAdmin.adminName}" />
			</div>
		</div>

		<div style="width: 100%;float: left">
			<div style="width: 25%;float:left">
				<h4>密码</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="password" class="form-control" name="admin.pwd"
					value="${currAdmin.pwd }" />
			</div>
		</div>

		<div style="width: 100%;float: left">
			<div style="width: 25%;float:left">
				<h4>性别</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="radio"  name="admin.gender" ${currAdmin.gender eq '男' ? 'checked' : '' } value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"  name="admin.gender" ${currAdmin.gender eq '女' ? 'checked' : '' } value="女" />女
			</div>
		</div>

		<div style="width: 100%;float: left">
			<div style="width: 25%;float:left">
				<h4>电子邮箱</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="text" class="form-control" name="admin.email"
					value="${currAdmin.email}" />
			</div>
		</div>
	</div>


	<div style="width:100%;padding-top: 30px;">
		<div style="width: 30%;float: left;margin-left: 13%;">
			<button type="submit" class="btn btn-primary btn-block">确认修改</button>
		</div>
		<div style="width: 30%;float: left;margin-left: 10%;">
			<input type="reset" name="reset" class="btn btn-primary btn-block"
				value="重置">
		</div>
	</div>
</form>