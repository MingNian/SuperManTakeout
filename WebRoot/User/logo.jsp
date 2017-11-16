<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div style="width: 100%;height: ;background-color: white; ">
	<div
		style="width: 980px;height: 80px;background-color: white;margin-left: auto;   margin-right: auto; ">
		<div
			style="width:180px ;height:67px ;margin-top: 13px;float: left;color: white;">
			<a href="/wm/index.jsp"> <img src="/wm/img/superman.png" alt="美团外卖">
			</a>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/User/toggleShopKeyword_UserAction" method="post">
				<a href="javascript:;" class="marleft"><span>&nbsp;</span></a> <a
					href="/wm/index.jsp" class="marleft"><span class="hoverYellow">首页</span></a>
				<a href="${empty user ?  '/wm/login.jsp' :'/wm/my.jsp' }" class="marleft"><span
					class="hoverYellow">我的订单</span></a> <a href="${empty user.shop ? '/wm/join.jsp' :'javascript:alert(\'您已有店铺,请从我的订单-我的店铺进入查看\');' }"
					class="marleft"><span class="hoverYellow">入驻加盟</span></a> 
				<a href="javascript:;" class="marleft"><span>&nbsp;</span></a> 
				<input type="hidden" name="pageNum" value="1">
				<input  type="text" class="searchText" name="shopKeyword"  
					placeholder="搜索商家，美食" style="margin-top: 33px;margin-left: 65px;"> 
				<button class="searchText" type="submit">搜索</button>  
  
			</form>  
		</div>
	</div>


</div>





