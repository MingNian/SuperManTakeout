<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<title>${ empty shop ?  '商家' :  shop.shopName}</title>
</head>
<body>
	<%@ include file="User/address.jsp"%>
	<%@ include file="User/logo.jsp"%>
	<%@ include file="User/shopInfo.jsp"%>
	<%@ include file="User/shopButton.jsp"%>
	<%@ include file="User/shopEvaluate.jsp"%>
	<%@ include file="copyRight.jsp"%>
</body>
</html>







