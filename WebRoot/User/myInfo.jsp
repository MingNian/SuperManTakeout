<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: white;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#changeInfo").click(function(){
		window.location.href="editInfo.jsp";
	});
});
</script>
<title>超人外卖</title>
</head>
<body>


	<div style="width: 765px;height: 400px;">
		<div style="width: 100%;height: 30px;"></div>
		<div
			style="width: 290px;height: 290px;margin-left: auto;margin-right: auto;">

			<div style="width: 290px;height: 100px;">
				<span class="h4" style="margin-right: 20px;">我的头像:</span> <img
					class="img-circle" width="66px" height="66px" alt="头像"
					src="${user.headImg }">
			</div>
			<div style="width: 290px;height: 50px;">
				<span class="h4" style="margin-right: 20px;">用 户 I D :</span> <span
					class="h4">${user.nickName }</span>
			</div>
			<div style="width: 290px;height: 50px;">
				<span class="h4" style="margin-right: 20px;">手机号码:</span> <span
					class="h4">${user.tel }</span>
			</div>
			<button id="changeInfo" class="btn btn-warning center-block"
				style="width: 80;height: 35;margin-left: auto;margin-right: auto;">修改</button>
		</div>

	</div>


</body>
</html>











