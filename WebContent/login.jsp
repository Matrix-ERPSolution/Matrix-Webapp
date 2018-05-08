<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 로그인: todayTaskAdmin -->
<!-- 아이디/비밀번호찾기: findIdPassword -->
<!-- 신규 회원가입: addMember -->
<!-- div는 추후 필요시 사용 -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<title>로그인</title>
</head>
<body>
<h1>Store Manager</h1>
<fieldSet>
<input type="text" id="id" name="id" placeholder="아이디"><br><div></div>
<input type="password" id="pw" name="pw" placeholder="비밀번호"><br><div></div>
<button id="login" >로그인</button><br>


<input type="checkbox" class="check" name="autoLogin" id="autoLogin">자동 로그인
 
<input type="checkbox" class="check" name="saveID" id="saveID">아이디 저장
<br>
<button id="findIdPassword" >아이디/비밀번호찾기</button><br>
<button id="addMember1" >신규 회원가입</button>
</fieldSet>
<script type="text/javascript">
$("#login").on("click", function(){
	location.href="menuAdmin.jsp";
});

$("#findIdPassword").on("click", function(){
	location.href="findIdPassword.jsp";
});

$("#addMember").on("click", function(){
	location.href="addMember.jsp";
});

$("button").button();
$("saveID").checkboxradio();

</script>
</body>
</html>