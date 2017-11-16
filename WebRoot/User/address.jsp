<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width: 100%;height: 32px;background-color:#333;">
	<div
		style="width: 980px;height: 32px;margin-left: auto;   margin-right: auto; ">
		<div class="container">
			<span class="glyphicon glyphicon-map-marker whiteAddress addressBar"></span>
			<span class="whiteAddress addressBar">苏州市 &nbsp;|</span> 
			<span><a class="addressBar" style="color: #ffd161;" href="${pageContext.request.contextPath}/toggleAddress.jsp;">切换地址</a></span>
			<c:choose>
				<c:when test="${empty user}">
					<a href="/wm/login.jsp" class="whiteAddress" style="margin-left: 700px;">登录</a> 
					<span class="whiteAddress">&nbsp;|&nbsp;</span>
					<a href="/wm/regist.jsp" class="whiteAddress">注册</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/my.jsp" class="whiteAddress" style="margin-left: 700px;" target="_self">${user.nickName},欢迎你！</a>
				</c:otherwise>
			</c:choose>
		</div> 
	</div>  
</div> 
