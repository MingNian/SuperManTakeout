<%@page contentType="text/html; charset=utf-8"%>
<html>
	<head>
		<base href="http://localhost:8080/wm/">
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
			#div_top{
				background-color: #0066CC;
				width:100%;
				height:100%;
			}
			html,body{
				margin:0;
				padding:0;
			}
			#div_title{
				width:100%;
				font-weight:bold;
				font-size:40px;
				font-family: serif;
				margin-left:10px;
				margin-top:20px;
			}
			#div_currShop{
				width:100%;
			}
			div{
				float:left;
				position:relative;
			}
		</style>
		<script type="text/javascript">
			function myExit(){
				if(confirm("是否确认退出?")){
					window.top.location.href="index.jsp";
				}		
			}
		</script>
	</head>
	<body>
		<div id="div_top">
			<div id="div_title">超人外卖商家管理平台</div>
			<div id="div_currShop">
				<div style="text-align:right;width:85%;height:10%;padding-right:20px;">当前商家:${currShop1.shopName}</div><br/>
				<div style="text-align:right;width:95%;height:10%;padding-right:20px;">
					<a style="color:black;" href="javascript:myExit();">退出</a>
				</div> 
			</div>
		</div>
	</body>
</html>