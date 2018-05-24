<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<title>로그인</title>
<script type="text/javascript"></script>
</head>
<body>
<h1>Matrix</h1>

<input type="text" id="id" name="id" placeholder="아이디"><div id="idCheck"></div><br>
<input type="password" id="pw" name="pw" placeholder="비밀번호"><div id="pwCheck"></div><br>
<button id="login">로그인</button><br>

<input type="checkbox" class="check" name="autoLogin" id="autoLogin">자동 로그인
<input type="checkbox" class="check" name="saveId" id="saveId">아이디 저장
<br>
<button id="findIdPassword" >아이디/비밀번호찾기</button><br>
<button id="addUser" >신규 회원가입</button>

<script type="text/javascript">


$("button").button();
$("saveID").checkboxradio();

	//비밀번호 찾기 페이지 이동
	$("#findIdPassword").on("click", function() {
		location.href = "findIdPassword.jsp";
	});

	//회원가입 페이지 이동
	$("#addUser").click(function() {
		location.href = "addUser.jsp";
	});

	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자-영소문자 1자 반드시 포함/정규표현식: ^(?=.*[a-z])[a-z0-9]{6,16}$
	var regExpId = new RegExp("^(?=.*[a-z])[a-zA-Z0-9]{6,16}$");

	$("#id").keyup(function() {
		if ($("#id").val().length >= 17 || !regExpId.test($("#id").val())) {
			$("#idCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#idCheck").html("");
		}
	});

	//비밀번호 입력값 형식 검사
	//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$
	var regExpPw = new RegExp(
			"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
	$("#pw").keyup(function() {
		if ($("#pw").val().length >= 17 || !regExpPw.test($("#pw").val())) {
			$("#pwCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#pwCheck").html("");
		}
	});
	
	//자동로그인: #autologin check -> id, pw를 어디에 저장?
			
	//로그인 버튼 클릭 
	//1-1. id, pw가 비어있으면 메시지 출력("id,pw를 입력해주세요") + id 박스로 focus + 
	//1-2. idcheck, pwcheck div 박스가 비어있는지(=유효성 검사 통과)
	//2. 아이디 저장: saveId 체크박스를 클릭하면 ID를 로컬 스토리지에 저장
	//3. 로그인 처리: DB로 id, pw 전달 - ajax
				
	$("#login").click(function(){
		if($("#id").val()=="") {
			$("#idCheck").html("아이디를 입력해주세요");
			$("#id").focus();
		} else if($("#pw").val()=="") {
			$("#pwCheck").html("비밀번호를 입력해주세요");
			$("#pw").focus();
		} else if($("#idCheck").html() != "" && $("#pwCheck").html() != "") {
			alert("아이디와 비밀번호를 다시 확인해주세요.");	//나중에 사라지는 메시지 박스로 처리 바람.
		} else if($("#saveId").prop("checked")) {
			localStorage.setItem("loginId", $("#id").val());
		} /* $.ajax(function(){
			url: "",
			data: {
				id: $("#id").val(), 
				pw: $("#pw").val()
			},
			success: function(result) {
				if($("#id").val()==result) {
					location.href="headerAdmin.jsp";
				} else {
					alert("아이디와 비밀번호를 다시 확인해주세요");
				}
			}
		}) */
	});
	
</script>
</body>
</html>