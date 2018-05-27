<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div id="newMember">
	<input type="text" id="userId" class="roundBox" required="required" placeholder="아이디"><div id="idCheck"></div><br>
	<input type="password" id="pw" class="roundBox" required="required" placeholder="비밀번호"><div id="pwCheck"></div><br>
	<input type="password" id="pw2" class="roundBox" required="required" placeholder="비밀번호 확인"><div id="pwCheck2"></div>
</div><br>
<!-- newMember end -->

<div id="privacy">
	<input name="name" id="name" class="roundBox" required="required" placeholder="이름"> <div id="nameCheck"></div><br>
	<div align="left">생년월일</div>
	<select name="birthYear" id="birthYear" required="required">
		<option value="">년</option>
	</select> <select name="birthMonth" id="birthMonth" required="required">
		<option value="">월</option>
	</select> <select name="birthDay" id="birthDay" required="required">
		<option value="">일</option>
	</select> 
	<div id="birthCheck"></div><br> 
	<div align="left">성별</div>
	<input type="radio" name="gender" checked="checked" value="M" id="genderM">남자 
	<input type="radio" name="gender" value="F"	id="genderF">여자 <div id="genderCheck"></div>
	<br> 
	<input name="emailId" id="emailId" class="roundBox" required="required" placeholder="이메일 입력">@<input type="text" name="emailDomain" id="emailDomain" disabled required="required">
	<select name="selectDomain" id="selectDomain">
		<option selected>선택</option>
		<option value="naver.com">naver.com</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="yahoo.com">yahoo.com</option>
		<option value="selfInput">직접입력</option>
	</select>
		<div id="emailIdCheck"></div><div id="emailDomainCheck"></div><br> 
	<div align="left">주소</div><br>
	<select name="addressCity" id="addressCity"	required="required">
		<option selected>시/도</option>
		<option value="더미시1">더미시1</option>
		<option value="더미시2">더미시2</option>
		<option value="더미시3">더미시3</option>
	</select> 
	<select name="addressGu" id="addressGu" required="required">
		<option selected>시/군/구</option>
		<option value="더미구1">더미구1</option>
		<option value="더미구2">더미구2</option>
		<option value="더미구3">더미구3</option>
	</select> 
	<select name="addressDong" id="addressDong" required="required">
		<option selected>면/읍/동</option>
		<option value="더미동1">더미동1</option>
		<option value="더미동2">더미동2</option>
		<option value="더미동3">더미동3</option>
	</select> 
	<div id="addressCheck"></div><br> 
	<input type="text" name="profilePhoto"	id=profilePhoto class="roundBox" placeholder="프로필 사진 첨부"><br>
</div>
<!-- privacy end -->
	<button id="certification" class="roundBox" >가입하기</button>

</body>
</html>