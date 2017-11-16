<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<title>超人外卖管理平台</title>

<link href="${pageContext.request.contextPath}/css/menu.css"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #F5F5F5;
}
</style>

</head>

<body>

	<%@ include file="admin_navbar.jsp"%>
	<div class="container" style="height: 75%;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
						<li class="active"><a> <i
								class="glyphicon glyphicon-th-large"></i> 超人外卖管理系统
						</a></li>

						<li><a class="adminInfo" href="adminInfo_AdminAction.action"
							target="main"> <i class="glyphicon glyphicon-credit-card"></i>
								个人信息
						</a></li>
						<li><a class="shopApply"
							href="shopApply_AdminAction.action?pageNum=1" "  target="main">
								<i class="glyphicon glyphicon-globe"></i> 新商家认证 
						</a></li>
						<li><a class="categoryManage"
							href="userManage_AdminAction.action?pageNum=1" target="main">
								<i class="glyphicon glyphicon-calendar"></i> 用户管理
						</a></li>
						<li><a class="showShops"
							href="showShops_AdminAction.action?pageNum=1" target="main">
								<i class="glyphicon glyphicon-fire"></i> 查看商家用户信息
						</a></li>
					</ul>
				</div>

				<div id="index_div" class="col-md-9">
					<iframe name="main" src="adminInfo_AdminAction.action"
						frameborder="0" width="90%" height="480px;"></iframe>
				</div>
			</div>
		</div>

	</div>



	<%@ include file="../copyRight.jsp"%>

</body>

</html>