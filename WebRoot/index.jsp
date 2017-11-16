<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<title>超人外卖</title>
</head>
<body>
	<%@ include file="User/address.jsp"%>
	<%@ include file="User/logo.jsp"%>
	<%@ include file="User/quick.jsp"%>
	
	
	<div style="width: 980px;background-color: white;margin-left: auto;   margin-right: auto;margin-top: 12px; overflow: hidden;">
		<iframe src="User/showShops_UserAction" frameborder="0" width="100%" height="630px" style="min-height:100px;overflow: hidden;"></iframe>
	</div>
	
	
	<%@ include file="copyRight.jsp"%>
</body>
</html>


