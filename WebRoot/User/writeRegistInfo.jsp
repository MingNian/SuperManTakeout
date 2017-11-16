<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<%@ include file="../head.jsp"%>
<link href="${pageContext.request.contextPath}/css/account.css" rel="stylesheet">
<title>超人商家注册</title>
<script type="text/javascript">
window.onload= function (){
	if (window.top!=window.self) {
		window.top.location=window.self;
	}
}
</script>
</head>

<body>

	<div class="container" style="padding-bottom: 160px;">

		<form class="form-signin" action="fillShopApply_UserAction" method="post" enctype="multipart/form-data">
			<h2 class="text-center">超人商家注册</h2>
			<input required name="shopApply.shopName" class="form-control" placeholder="请输入商铺名称" style="margin-bottom: 10px;" autofocus>
			<input required name="shopApply.shopRemark" class="form-control" placeholder="请输入商铺备注" style="margin-bottom: 10px;" >
			<input required  type="file" name="file" class="form-control" style="margin-bottom: 10px;">  
			<span style="margin-bottom: 10px;">
			申请材料中应包含以下几点:<br>
			1、法人代表手持身份证照;<br>
			2、营业执照照片,可用有效特许证件代替;<br>
			3、餐饮服务许可证,可用食品流通许可证等其它有效证件代替;<br>
			4、门脸图片,要求需拍出完整门匾、门框（建议正对门店2米处拍摄）;<br>
			5、店内环境照片,要求需真实反映用餐环境（收银台、用餐桌椅）;
			</span>
			<div style="width: 100%;height: 10px;"></div>
			<button class="btn btn-lg btn-primary btn-block pad" type="submit">提交申请</button>
		</form>
	</div>

	<%@ include file="../copyRight.jsp"%>

</body>

</html>