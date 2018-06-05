<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원상세정보</title>
<%@include file="headSetting.jsp"%>
<%@include file = "tabMenuAdmin.jsp" %>
<style>
.detailedTable {
	width: 300px;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin-top: 15px;
	font-size: 11pt;
}

table.detailedTable td {
	border: 1px solid #444444;
	padding: 5px;
}

ul {
	list-style-type: none;
	width: 100px;
	display: table;
	table-layout: fixed;
}

li {
	display: table-cell;
	width: 70%;
}
</style>
</head>
<body>
<div class="staffDetailContainer">
	<i id="backToStaffManagementAdmin" class="fa fa-chevron-left" aria-hidden="true" style="margin-right: 25px"></i>
	<span style="font-size: 16pt;">직원 상세 정보</span>
	<div id="getStaffDetailContent" style="padding-top: 5%;"></div>
	</div>
</body>
<script>
var detailStaffCall = function(input){
	alert($(input).prev().html());
};	//추후 업데이트

$("#backToStaffManagementAdmin").click(function(){
	location.href = "controller?cmd=staffManagementAdminUI";
});

var staffId = "${param.staffId}";
$(document).ready(function(){
	$.ajax({
		url : "controller?cmd=getStaffDetailAction",
		data : {
			staffId : staffId
		},
		success : function(result){
			$("#getStaffDetailContent").html(result);
		}
	});
})
</script>
</html>