<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>


<h6 class="sub-header">
	<a href="javascript:;">&nbsp;</a>
</h6>
<form action="addCategory_AdminAction.action" method="post">

	<div style="width: 80%;margin-left: 10%;">

		<div style="width: 100%">
			<div style="width: 25%;float:left">
				<h4>分类名称</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="text" class="form-control" name="currCategory.categoryName" />
			</div>
		</div>

		<div style="width: 100%;float: left">
			<div style="width: 25%;float:left">
				<h4>分类备注</h4>
			</div>
			<div style="width: 70%;float:left">
				<input type="text" class="form-control" name="currCategory.categoryRemark" />
			</div>
		</div>
	</div>

	<div style="width: 100%;height: 25px;"></div>
	<div style="width:100%;padding-top: 30px;">
		<div style="width: 20%;float: left;margin-left: 25%;">
			<button type="submit"  class="btn btn-primary btn-block">确认添加</button>
		</div>
		<div style="width: 20%;float: left;margin-left: 10%;">
			<input type="reset" name="reset" class="btn btn-primary btn-block"
				value="重置">
		</div>
	</div>
</form>

