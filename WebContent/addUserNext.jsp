<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<title>회원가입</title>
</head>
<div>
	<img class="inline" src="images/back.png" width="30pt" align="left"/>
	<h1 class="inline" align="center">회원가입</h1>
</div>
<fieldset id="info1">
<div id="newMember">
아이디 
	<input type="text" id="id" required="required"><br>
비밀번호
	<input type="password" id="pw1" required="required"><br>
비밀번호 확인
	<input type="password" id="pw2" required="required">
</div>
<!-- newMember end -->
</fieldset>
<fieldset id="info2">
<div id="privacy">
이름	<input name="name" id="name" required="required">
	<br>
생년월일 
	<select name="birthyear" id="birthyear" required="required">
		<option value="">년</option>
	</select>
	<select name="birthmonth" id="birthmonth" required="required">
		<option value="">월</option>
	</select>
	<select name="birthday" id="birthday" required="required">
		<option value="">일</option>
	</select>
	<br>
성별 
	<input type="radio" name="gender" checked="checked" value="M" id="genderM">남자
	<input type="radio" name="gender" value="F" id="genderF" >여자
	<br>
이메일
	<input name="emailId" id="emailId" required="required">
	@<input name="emailDomain" id="emailDomain" required="required">
	<br>
	<select>
		<option value="naver.com">naver.com</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="naver.com">naver.com</option>
	</select>
	<br>
주소	<select name="city1" id="city1" required="required">
		<option value="">시/도</option>
		<option value="서울특별시">서울특별시</option>
		<option value="인천광역시">인천광역시</option>
		<option value="경기도">경기도</option>
		<option value="제주특별자치도">제주특별자치도</option>
	</select>
	<select name="city2" id="city2" required="required">
		<option value="">시/군/구</option>
		<option value="광명시">광명시</option>
		<option value="가평군">가평군</option>
		<option value="송파구">송파구</option>
	</select>
	<select name="city3" id="city3" required="required">
		<option value="">면/읍/동</option>
		<option value="유천면">유천면</option>
		<option value="점촌읍">점촌읍</option>
		<option value="가락동">가락동</option>
	</select>
	<br>
</div>
<!-- privacy end -->
</fieldset>
	<button id="certification" class="ui-button ui-widget ui-corner-all">가입하기</button>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});
	
	$("#certification").on("click", function(){
		location.href="certification.jsp";
	});
</script>
</body>
</html>