<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원상세정보</title>
<style>
table {
	width: 250px;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
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

	<h2>
		<i id="backToStaffManagementAdmin" class="fa fa-chevron-left"
			aria-hidden="true" style="margin-right: 25px"></i>직원 상세 정보
	</h2>
	<div class="inline">
		<i class="fa fa-user fa-5x" aria-hidden="true"></i>
	</div>
	<div class="inline">
		<ul>
			<li>이름</li>
			<li>민형준</li>
		</ul>
		<ul>
			<li>성별</li>
			<li>남</li>
		</ul>
		<ul>
			<li>생일</li>
			<li>1993/06/25</li>
		</ul>
	</div>

	<div id="privateInfo" style="float: center;">
		<table>
			<tr>
				<td>파트</td>
				<td>마감조</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>010-4087-2442</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>110-011-123456</td>
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
				<td><i class="fa fa-file-o" aria-hidden="true"></i><a href="">다운로드</a></td>
			</tr>
			<tr>
				<td>이력서</td>
				<td><i class="fa fa-file-o" aria-hidden="true"></i><a href="">다운로드</a></td>
			</tr>
			<tr>
				<td>보건증</td>
				<td><i class="fa fa-file-o" aria-hidden="true"></i><a href="">다운로드</a></td>
			</tr>
		</table>
	</div>
</body>
<script>
	$(".inline").css({
		"display" : "inline"
	});
	$("#backToStaffManagementAdmin").click(function() {
		$.ajax({
			url : "staffManagementAdmin.jsp",
			success : function(result) {
				$("#result").html(result);
			}
		});
	});
</script>
</html>