<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<title>로그인</title>
<style>
#grad1 {
    height: 640px;
    background: #2E64FE;
    background: linear-gradient(#2E64FE, white);
	text-align: center;
}
.roundBox {
	width: 200px;
	height: 30px;
	border-radius: 20px;
	text-align: center;
}
</style>
<script type="text/javascript"></script>
</head>

<body id="grad1">
<div><img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"></div>

<input type="text" id="id" name="id" placeholder="아이디" class="roundBox"><div id="idCheck"></div><br>
<input type="password" id="pw" name="pw" placeholder="비밀번호" class="roundBox"><div id="pwCheck"></div><br>
<button id="login" class="roundBox">로그인</button><br>

<input type="checkbox" class="check" name="autoLogin" id="autoLogin">자동 로그인
<input type="checkbox" class="check" name="saveId" id="saveId">아이디 저장
<br>
<button id="findIdPassword"  class="roundBox">아이디/비밀번호찾기</button><br>
<button id="addUser"  class="roundBox">신규 회원가입</button>


<script type="text/javascript">


$("button").button();
$("saveID").checkboxradio();


/* document.querySelector("#login").onclick=function(){
	alert("아이디 저장?");
	if(document.querySelector("#saveId").checked){
		localStorage.setItem("loginId", document.querySelector("#id").value);
		alert(document.querySelector("#id").value);		
	}
} */
//로그인: db로 id, pw 전달
//아이디 저장: saveId 체크박스를 클릭하면 ID를 로컬 스토리지에 저장
	$("#login").on("click", function() {
		var check = true;
		if (check) {
			//alert("아이디 저장?");
			if ($("#saveId").prop("checked")) {
				localStorage.setItem("loginId", $("#id").val());
				//alert($("#id").val());
			}
			 	/* $.ajax({
				 url: "",
				 data: {
				 id : $("#id").val(), 
				 pw : $("#pw").val()
				 },
				 success: function( result ) {
				 location.href="headerAdmin.jsp"
				 }) */
		} else {
			alert("입력한 정보를 다시 확인해주세요");
		}
	})

	//비밀번호 찾기 페이지 이동
	$("#findIdPassword").on("click", function(){
	 location.href="findIdPassword.jsp";
	 }); 

	//회원가입 페이지 이동
	 $("#addUser").on("click", function(){
	 location.href="addUser.jsp";
	 });

	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자/정규표현식: ^(?=.*[a-z]|(?=.*\d)).{6,16}$
	var regExpId = new RegExp("^(?=.*[a-zA-Z])[a-zA-Z0-9]{6,16}$");
	
	$("#id").keyup(function(){
		if($("#id").val().length >=17 || !regExpId.test($("#id").val())) {
			$("#idCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#idCheck").html("");
		}
	});
	
	//비밀번호 입력값 형식 검사
	//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z]|(?=.*\d)|(?=.*\W)).{6,16}$
	var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
	$("#pw").keyup(function(){
		if($("#pw").val().length >=17 || !regExpPw.test($("#pw").val())) {
			$("#pwCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#pwCheck").html("");
		}
	});
	//자동로그인: #autologin check -> id, pw를 어디에 저장했다가 불러올건가?
	
</script>
</body>
</html>