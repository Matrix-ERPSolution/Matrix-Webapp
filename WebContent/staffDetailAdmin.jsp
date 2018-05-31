<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="headSetting.jsp"%>
<title>직원상세정보</title>
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
	<div align="center">
	<h2>
		<i id="backToStaffManagementAdmin" class="fa fa-chevron-left" aria-hidden="true" style="margin-right: 25px"></i>직원 상세 정보
	</h2>
	<table>
		<tr>
			<td>
				<img class="profilePhoto inline" src="https://www.puriindahmall.co.id/assets/img/default.png" width="80" height="80">
			</td>
			<td>
				<table>
					<tr>
						<td>이름</td>
						<td id="staffDetailName">민형준</td>
					</tr>
					<tr>
						<td>성별</td>
						<td id="staffDetailName">남</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td id="staffDetailBirthday">1993/06/25</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div id="privateInfo" style="float: center;">
		<table class="detailedTable" style="float: center;">
			<tr>
				<td>파트</td>
				<td>마감조</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><span>010-4087-2442</span>
					<img src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					id="detailStaffCall" width="30" height="30" style="float: right;">
				</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td><span>110-011-123456</span><span style="float: right;">신한은행</span></td>
			</tr>
			<tr>
				<td>입사날짜</td>
				<td>2015/03/17</td>
			</tr>
			<tr>
				<td>퇴사날짜</td>
				<td>2016/12/30</td>
			</tr>
			<tr>
				<td>통장사본</td>
				<td>bank.pdf</td>
			</tr>
			<tr>
				<td>이력서</td>
				<td>resume.doc</td>
			</tr>
			<tr>
				<td>보건증</td>
				<td>health.png</td>
			</tr>
		</table>
	</div>
	</div>
</body>
<script>
	$("#detailStaffCall").click(function(){
		alert("전화연결");	
	});
	
	$(".inline").css({
		"display" : "inline"
	});
	$("#backToStaffManagementAdmin").click(function() {
		$.ajax({
			url : "controller?cmd=staffManagementAdminUI",
			data: {
			},
			success : function(result) {
				$("#result").html(result);
			}
		});
	});
</script>
</html>