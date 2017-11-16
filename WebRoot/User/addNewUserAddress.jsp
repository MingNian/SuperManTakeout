<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<style type="text/css">
			.div_content{
				width: 60%; 
				height: 35px; 
				margin-left: 20%;
				margin-top: 15px;							
			}
		</style>
		<title>超人外卖</title>
	</head>
	<body>
		<div style="width: 60%; height: 60%; margin-top: 10%; margin-left: 20%; background-color:lightgoldenrodyellow;">
			<form action="addNewAddress_UserAction" method="post">
				<div style="height: 50px; background-color:gray; text-align: center;"><strong>添加新地址</strong></div>
						<div style="height: 370px;">
							<div class="div_content">
								<div style="color: red;">*</div>
								联系人:<input style="margin-left: 20px;" type="text" name="userName" placeholder="请输入姓名">
							</div>	
							<div class="div_content">
								<div style="color: red;">*</div>收货地址:<input type="text" name="address" placeholder="请输入收货地址">
							</div>
							<div class="div_content">
								<div style="color: red;">*</div>联系电话:<input type="text" name="liuyan" placeholder="请输入11位手机号码">
							</div>
							<div class="div_content">
								<div style="color: red;">*</div>请选择收货人性别:<label><input name="gender" type="radio" value="1">男</label>
																		   <label><input name="gender" type="radio" value="0">女</label>
							</div>
						</div>
						<div class="div_content">
							<input style="width: 110px; height: 40px; background-color: yellow; margin-left: 100px;margin-right: 60px;" type="submit" value="保存">
							<!-- <input style="width: 110px; height: 40px; background-color: #fff;" type="button" value="取消" onclick=""> -->
						</div>
			</form>
		</div>
	</body>