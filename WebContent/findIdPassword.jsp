<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<fieldset>
	<div>
		<img class="inline" src="images/back.png" width="30pt" />
		<h1 class="inline" align="center">아이디/비밀번호 찾기</h1>
	</div>
	<div id="findId">
		<h4>아이디 찾기</h4>
		<h5>본인명의 휴대폰 번호로 인증</h5><br>
		휴대폰 번호 <select id="numberField1" required="required">
			<option value="">선택</option>
			<option value="010">010</option>
		</select>- <input type="tel" id="numberField2" required="required">- 
		<input type="tel" id="numberField3" required="required"> <a href=""	id="certify1">인증</a><br>

		<div id="certifier">
			인증번호입력<input type="text" id="inputCertification"> <a href="">확인</a><br>
		</div><!-- certifier end -->

		<div id="findIdResult">
			회원님의 ID는 <span style="color:red">null</span>입니다.
		</div><!-- findIdResult end -->
	</div><!-- findId end -->
</fieldset>
<fieldset>
	<div id="findPassword">
	<h4>비밀번호 찾기</h4><br>
	아이디 <input type="text" id="id" required="required" class="requiredField"> <i class="fa fa-check" aria-hidden="true" style="color:black"></i><br>
	<h5>회원정보에 등록된 휴대폰 번호로 인증</h5>
	<input type="tel" id="telnumber" class="requiredField"> <a href="" id="certify2">인증</a> <i class="fa fa-check" aria-hidden="true" style="color:black" ></i><br>
	<h5>본인명의 휴대폰 번호로 인증</h5><br>
	휴대폰 번호 <select id="numberField1" required="required">
			<option value="">선택</option>
			<option value="010">010</option>
		</select>- <input type="tel" id="numberField2" required="required">- 
		<input type="tel" id="numberField3" required="required"> <a href=""	id="certify3">인증</a><br>
	</div><!-- findPassword end -->
	<div id="updatePassword">
	비밀번호 재설정<input type="password" id="newPassword" required="required" class="requiredField"> <i class="fa fa-check" aria-hidden="true" style="color:black"></i><br>
	비밀번호 확인<input type="password" id="checkPassword" required="required" class="requiredField"> <i class="fa fa-check" aria-hidden="true" style="color:black"></i><br>
	</div><!-- updatePassword end -->
</fieldset>
	<a href="#">입력완료</a>
	<script>
		$(document).ready(function() {
			$(".inline").css({
				"display" : "inline"
			})
		});
		
		$(document).ready(function(){
			if($(".requiredField").val() !== "") {
			$(".fa fa-check").css("color", "red");	
			}
			});
			

		
	</script>
</body>
</html>