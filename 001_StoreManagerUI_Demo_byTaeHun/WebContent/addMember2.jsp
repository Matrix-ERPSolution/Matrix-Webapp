<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<a href="">뒤로가기</a>
<h1>회원가입</h1>
<body>
<div>
아이디 
	<input type="text" id="id" required="required"><br>
비밀번호
	<input type="password" id="pw1" required="required"><br>
비밀번호 확인
	<input type="password" id="pw2" required="required">
</div><br>

<div>
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
	<input type="radio" name="gender" checked="checked" value="M" id="genderM" onclick="getGender()">남자
	<input type="radio" name="gender" value="F" id="genderF" onclick="getGender()">여자
	<br>
이메일
	<input name="emailId" id="emailId" required="required">
	@<input name="emailDomain" id="emailDomain" required="required">
	<br>
	<select>
		<option value="naver.com">naver.com</option></select>
	<br>
주소	<select name="city1" id="city1" required="required">
		<option value="">시/도</option></select>
		<option value="서울특별시">서울특별시</option></select>
	</select>
	<select name="city2" id="city2" required="required">
		<option value="">시/군/구</option></select>
		<option value="송파구">송파구</option></select>
	</select>
	<select name="city3" id="city3" required="required">
		<option value="">면/읍/동</option></select>
		<option value="가락동">가락동</option></select>
	</select>
	<br>
</div>
	<a href="">가입하기</a>
</body>
</html>