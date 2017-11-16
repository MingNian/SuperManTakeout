<%@page contentType="text/html; charset=utf-8"%>
<html>
		<head>
		<link rel="stylesheet" type="text/css" href="/wm/css/shopManageCommon.css">
		<style type="text/css">
		
		#div0 {
			width: 80%;
			margin-left: 10%;
			height: 100%;
			background-color: white;
		}
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			background-color: white;
		}
		
		#div1 {
			width: 80%;
			margin-left: 10%;
			height: 80%;
			margin-top: 3%;
		}
		.tbl {
			height: 100%;
			width:390px;
		}
		input{
			margin-bottom: 8px;
		}
		</style>
		<script type="text/javascript">
		</script>
		<%@ include file="../head.jsp"%>
</head>
<body>
			<form action="../shop/updateShop_ShopAction" method="post" enctype="multipart/form-data">
					<div style="width: 480px;height: overflow:hidden;margin-left: auto;margin-right: auto;">
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">店铺图片</div>
							<div style="width:370px;height: 110px;float: left;">
								<div style="width: 100px; height: 100px;float: left;">
									<img src="${shopDetail2.shopImg}" style="width:100px;" title="点击更换图片"/><br/>
								</div>
								<div style="width: 250px;float: left;margin-left: 12px;">
									<div style="width: 100%;height: 65px;"></div>
									<input type="file" name="shopImg" class="form-control"/>
								</div>
							</div>
						</div>
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">开始营业</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.startTime" value="${currShop2.startTime}"/>
							</div>
						</div>
						
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">打烊时间</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.closeTime" value="${currShop2.closeTime}"/>
							</div>
						</div>
						
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">店铺地址</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.shopDetail.shopAddress" value="${shopDetail2.shopAddress}"/>
							</div>
						</div>
						
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">起送费</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.shopDetail.leastMoney" value="${shopDetail2.leastMoney}" placeholder="请输入起送费(整数或小数)"
								 onkeyup="value=value.replace(/[^\d.]/g,'')"/>
							</div>
						</div>
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">配送费</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.shopDetail.serviceMoney" value="${shopDetail2.serviceMoney}" placeholder="请输入配送费(整数或小数)"
								 onkeyup="value=value.replace(/[^\d.]/g,'')"/>
							</div>
						</div>
						<div style="width: 100%;overflow: hidden;margin-bottom: 10px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">店铺简介</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<textarea rows="2" name="shop.shopDetail.shopRemark" class="form-control">${shopDetail2.shopRemark}</textarea>
							</div>
						</div>
						<div style="width: 100%;overflow: hidden;margin-bottom: 15px;">
							<div style="width: 100px;float: left;font-size: 18px;font-weight: 200;">店铺公告</div>
							<div style="width: 370px;float: left;font-size: 18px;font-weight: 200;">
								<input class="form-control" type="text" name="shop.shopDetail.notice" value="${shopDetail2.notice}"/>
							</div>
						</div>
						<div style="width: 80px;height: 18px;" class="pull-right">
							<input type="submit"  class="btn btn-primary" value="确认修改">
						</div>
						
					</div>
			</form>
</body>
</html>