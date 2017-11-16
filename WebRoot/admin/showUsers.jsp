<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../head.jsp"%>


<div class="container">
	<h6 class="sub-header">
		<a href="javascript:;">&nbsp;</a>
	</h6>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-md-1 col-xs-1 col-sm-1">序号</th>
					<th class="col-md-3 col-xs-3 col-sm-3">登录账号</th>
					<th class="col-md-2 col-xs-2 col-sm-2">用户名</th>
					<th class="col-md-1 col-xs-1 col-sm-1">性别</th>
					<th class="col-md-3 col-xs-3 col-sm-3">电子邮件</th>
					<th class="col-md-2 col-xs-2 col-sm-2">操作</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty users }">
						<td colspan="5"><span style="text-align: center;">没有用户入驻</span></td>
					</c:when>
					<c:otherwise>
						<c:set var="xuhao" value="${ pageNum*pageSize-pageSize+1}"></c:set>
						<c:forEach items="${users }" var="u">
							<tr>
								<td>${xuhao }<c:set var="xuhao" value="${xuhao+1 }"/></td>
								<td><a href="showUserHistory_AdminAction?uid=${u.id }">${u.loginId}</a></td>
								<td>${u.nickName }</td>
								<td>${u.gender}</td>
								<td>${u.email}</td>
								<td><c:choose>
										<c:when test="${u.state ==0}">
											<a href="recoverUser_AdminAction?uid=${u.id }">解封账号</a>
										</c:when>
										<c:otherwise>
											<a href="stopUser_AdminAction?uid=${u.id }">封禁账号</a>
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

