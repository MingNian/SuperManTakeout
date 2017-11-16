<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="zh-CN">

<head>
<base href="${pageContext.request.contextPath}/">
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<script type="text/javascript">
window.onload= function (){
	if (window.top!=window.self) {
		window.top.location="${pageContext.request.contextPath}/my.jsp";
	}
}
</script>
<title>超人外卖</title>
</head>
<body>
	<%@ include file="User/address.jsp"%>
	<%@ include file="User/logo.jsp"%>

	<div
		style="width: 980px;overflow:hidden;margin-left: auto; margin-right: auto;">
		<div style="width: 100%;height: 10px;"></div>
		<%@ include file="User/myMenu.jsp"%>

		<div style="width: 765px;min-height:500px;overflow: hidden;margin-left: 15px;float: left;">
			<iframe id="myMenuFrame" src="User/getUserOrderBeans_UserAction" style="width:100%;min-height:500px;overflow: hidden;"
				frameborder="0" name="myMenuFrame"> </iframe>
		</div>

	</div>

	<%@ include file="copyRight.jsp"%>
</body>
</html>








