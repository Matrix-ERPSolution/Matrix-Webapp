<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 뒤로가기 기능 구현 필요 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<a href="">뒤로가기</a>
<h1>회원가입</h1>
<div>
휴대폰 번호<select id="numberField1" required="required">
			<option value="">선택</option>
			<option value="010">010</option>
		 </select>-
		<input type="tel" id="numberField2" required="required">-
		<input type="tel" id="numberField3" required="required">
			<a href="" >인증</a><br>
인증번호입력<input type="text" id="certificationNumber"> 
			<a href="" >확인</a><br>
</div><br>
		<a href="addMember2.jsp">다음 단계</a>
</body>
</html>