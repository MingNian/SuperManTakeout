<%@page contentType="text/html; charset=utf-8"%>
<html>
	<head>
		<base href="http://localhost:8080/wm/">
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		
		<style type="text/css">
		#div0 {
			width: 96%;
			margin-left: 2%;
			height: 100%;
			background-color: white;
		}
		html, body {
			margin: 0px;
			padding: 0px;
			height: 100%;
			background-color: white;
		}
		#div_top {
			width: 100%;
			height: 20%;
		}
		#div_left {
			width: 20%;
			height: 80%;
		}
		#div_main{
			width:80%;
			height:70%;
		}
		#div_bottom {
			width: 80%;
			height: 10%;
		}
		*{
			margin:0px;
			padding:0px;
			
		}
		</style>
</head>
<body>
	<div id="div0">
		<div id="div_top">
			<iframe src="shop/getCurrShop_ShopAction" scrolling="no" frameborder="0" width="100%" height="100%"></iframe>
		</div>
		<div id="div_left">
			<iframe src="frames/shopManaLeft.jsp" scrolling="no" frameborder="0" width="100%" height="100%"></iframe>
		</div>
		<div id="div_main">
			<iframe src="shop/getShopdetail_ShopAction" name="shopManaMain" scrolling="no" frameborder="0" width="100%" height="100%"></iframe>
		</div>
		<div id="div_bottom">
			<iframe src="frames/shopManaBottom.jsp" scrolling="no" frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
		</div>
	</div>
</body>
</html>