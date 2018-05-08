<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div>
	<img class="inline" src="images/back.png" width="30pt" align="left"/>
	<h1>관리자 회원 인증</h1>
</div>
<fieldset>
사업자 등록번호
	<input type="text" id="registrationNumber1" required="required">-
	<input type="text" id="registrationNumber2" required="required">-
	<input type="text" id="registrationNumber3" required="required"><i class="fa fa-check" aria-hidden="true" style="color:black"></i><br>
대표자명
	<input type="text" id="adminName" required="required"><br>
지점명
	<input type="text" id="branchName" required="required">점 <button href="" class="ui-button ui-widget ui-corner-all" id="findBranch">지점찾기</button><br>
매장 전화번호<input type="tel" id="branchTel" required="required"><br>
영업시간<input type="text" id="time" required="required"><br>
</fieldset>
<button href="" class="ui-button ui-widget ui-corner-all" id="certify">인증요청</button>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});
</script>
</body>
</html>