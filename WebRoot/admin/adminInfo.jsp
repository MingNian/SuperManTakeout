<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	function login() {
		window.location.href = "editInfo.jsp";
	}
</script>
<div style="width: 100%;height: 22px;"></div>
<div
	style="width: 350px;height: 250px;margin-left: auto;margin-right: auto;font-size: 24px;">
	<div style="width: 100%;height: 35px; margin-bottom: 10px;">
		<div style="width: 120px;height: 100%;float: left;">登录账号:</div>
		<div style="width: 200px;height: 100%;float: left;">${currAdmin.loginId}</div>
	</div>
	<div style="width: 100%;height: 35px; margin-bottom: 10px;">
		<div style="width: 120px;height: 100%;float: left;">姓名:</div>
		<div style="width: 200px;height: 100%;float: left;">${currAdmin.adminName}</div>
	</div>
	<div style="width: 100%;height: 35px; margin-bottom: 10px;">
		<div style="width: 120px;height: 100%;float: left;">性别:</div>
		<div style="width: 200px;height: 100%;float: left;">${currAdmin.gender}</div>
	</div>
	<div style="width: 100%;height: 35px; margin-bottom: 10px;">
		<div style="width: 120px;height: 100%;float: left;">邮箱账号:</div>
		<div style="width: 200px;height: 100%;float: left;">${currAdmin.email}</div>
	</div>
	<div style="width: 100%;height: 35px;margin-bottom: 10px;">
		<div
			style="width: 200px;height: 100%;margin-left:auto;margin-right: auto;">
			<button onclick="login()" class="btn  btn-lg btn-primary btn-block" >修改资料</button>
		</div>
	</div>
</div>




