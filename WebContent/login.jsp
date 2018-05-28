<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>로그인</title>
<style>
html, body {
  	height: 100%;
}
#grad1 {
	position: absolute;
 	height: 100%;
    background: linear-gradient(#3284E2, #b1c4e2);
	text-align: center;
}
.roundBox {
	width: 200px;
	padding: 10px;
	border-radius: 20px;
	text-align: center;
}
</style>
<script type="text/javascript"></script>
</head>

<body id="grad1">
<div><img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"></div>
<br><br>
<input type="text" id="userId" name="userId" placeholder="아이디" class="roundBox"><div id="idCheck"></div><br>
<input type="password" id="pw" name="pw" placeholder="비밀번호" class="roundBox"><div id="pwCheck"></div><br>
<button id="login" class="roundBox" style="background: rgba(255, 255, 255, 0.3);">로그인</button><br>
<br>
<input type="checkbox" class="check" name="autoLogin" id="autoLogin">자동 로그인
<input type="checkbox" class="check" name="saveId" id="saveId">아이디 저장
<br><br>
<a id="findIdPassword">아이디/비밀번호찾기</a><br>
<a id="addUser" >회원가입</a>


<script type="text/javascript">

$("button").button();
$("saveID").checkboxradio();

//세션에서 아이디값 받아오기
if(localStorage.getItem("loginId")){
	$("#userId").val(localStorage.getItem("loginId"));
	$("#saveId").prop("checked", true);
}


	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자/정규표현식: ^(?=.*[a-z]|(?=.*\d)).{6,16}$
	
	$("#userId").keyup(function() {
		if($("#userId").val()=="") {
			$("#idCheck").html("");
		}
	});
	
	//비밀번호 입력값 형식 검사
	//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z]|(?=.*\d)|(?=.*\W)).{6,16}$
	$("#pw").keyup(function() {
		if($("#pw").val()!="") {
			$("#pwCheck").html("");
		}
	});
	
	//로그인 단계: 1. null check -> 2. 형식 검사 -> 3. session에 아이디 저장 -> 4.ajax: 로그인 처리
	$("#login").on("click", function() {
		var check = true;
		if(check) {
			if($("#userId").val()=="") {
				$("#idCheck").html("아이디를 입력해주세요");
				$("#userId").focus();
				check=false;
			} else if($("#pw").val()=="") {
				$("#pwCheck").html("비밀번호를 입력해주세요");
				$("#pw").focus();
				check=false;
			}
		}
		var regExpId = new RegExp("^(?=.*[a-zA-Z])[a-zA-Z0-9]{6,16}$");
		var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
		if(check) {
			if(!regExpId.test($("#userId").val()) || !regExpPw.test($("#pw").val())) {
				alert("아이디, 비밀번호를 확인해주세요");
				check=false;
			} 
		}
		if (check) {
			if ($("#saveId").prop("checked")) {
				localStorage.setItem("loginId", $("#userId").val());
			} else {
				if(localStorage.getItem("loginId")){
					localStorage.removeItem("loginId");
				}
			}
			
			$.ajax({
				url: "controller?cmd=loginAction",
				data: {
						userId : $("#userId").val(), 
						pw : $("#pw").val()
				},
				success: function(result) {
					$("body").html(result);
				}
			});
		} 
	});

	//비밀번호 찾기 페이지 이동
	$("#findIdPassword").on("click", function(){
	 location.href="findIdPassword.jsp";
	 }); 

	//회원가입 페이지 이동
	 $("#addUser").on("click", function(){
	 location.href="addUser.jsp";
	 });

	
	//자동로그인: #autologin check -> id, pw를 어디에 저장했다가 불러올건가?
	
</script>
</body>
</html>