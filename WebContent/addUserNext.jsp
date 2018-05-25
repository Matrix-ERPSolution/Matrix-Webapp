<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<title>회원가입</title>
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
</head>
<body id="grad1">
<div>
	<!-- <img class="inline" src="images/back.png" width="30pt" align="left"/> -->
	<img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"><br>
	<h4 class="inline" align="center">회원가입</h4>
</div>
<div id="newMember">
	<input type="text" id="id" class="roundBox" required="required" placeholder="아이디"><div id="idCheck"></div><br>
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
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
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
	
	//아이디 중복 검사 - 중복/사용가능한 아이디; 일단 alert으로 처리.
	/* $.ajax(function(){
		url: "",
		data: {
			id: $("#id").val();
		},
		success: function(result) {
			if($("#id").val()!=result) {
				alert("이미 존재하는 아이디입니다.");
			} else {
				alert("사용할 수 있는 아이디입니다.")
			}
		}
	}); */
	
	//비밀번호 입력값 형식 검사
	//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$
	var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
	$("#pw").keyup(function(){
		if($("#pw").val().length >=17 || !regExpPw.test($("#pw").val())) {
			$("#pwCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#pwCheck").html("");
		}
	});
	
	//비밀번호 확인 일치여부 검사
	$("#pw2").keyup(function(){
		if($("#pw").val()==$("#pw2").val()){
			$("#pwCheck2").html("일치")
		} else {
			$("#pwCheck2").html("불일치");
		}
	});
	
	//이름 입력값 형식 검사: 2~12자의 한글, 영문만 사용 가능합니다.
	//[가-힣a-z]{2,12}
	var regExpName=new RegExp("[가-힣a-z]{2,12}");
	$("#name").keyup(function(){
		if($("#name").val.length >=13 || !regExpName.test($("#name").val())) {
			$("#nameCheck").html("이름은 2~12자의 한글, 영소문자만 사용 가능합니다");
		} else {
			$("#nameCheck").html("");
		}
	});

	//생년월일 도메인 선택지 보기
	
	var choice = function(flag) {
		return "<option value=\"\">" + flag + "</option>";
	}
	
	var list = "";
	var addOption = function(option) {
		return "<option value="+ option + ">" + option + "</option>";
	}
	
	for (var i = 2018; i >= 1920; i--) {
		list += addOption(i);
	}
	
	$("#birthYear").html(choice("생년") + list)

	list = "";
	for (var i = 1; i <= 12; i++) {
		if (i < 10) {
			i = "0" + i;
		}
		list += addOption(i);
	}
	$("#birthMonth").html(choice("월") + list);

	var dayOption = function() {
		list = "";
		var max = 31;

		switch ($("#birthMonth").val()) {
		case '02':
			max = 28;
			break;
		case '04':
		case '06':
		case '09':
		case '11':
			max = 30;
			break;
		}

		for (var i = 1; i <= max; i++) {
			if (i < 10) {
				i = "0" + i;
			}
			list += addOption(i);
		}
		$("#birthDay").html(choice("일") + list);
	}
	$("#birthMonth").change(function() {
		dayOption();
	});

	//생년월일 선택여부 검사	
	$("#birthDay").click(function() {
		if ($("#birthMonth").val() == "") {
			alert("월을 먼저 선택해주세요.");
		} 
	});

	//이메일 도메인 선택지 보기: html 파트에서 구현.

	//이메일 도메인 선택여부 검사	: 직접입력-선택	
	$('#selectDomain').change(function() {
		$("#selectDomain option:selected").each(function() {
			if ($(this).val() == "selfInput") { //직접입력일 경우 
				$("#emailDomain").val(''); //값 초기화 
				$("#emailDomain").attr("disabled", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#emailDomain").val($(this).text()); //선택값 입력 
				$("#emailDomain").attr("disabled", true); //비활성화 
			}
		})
	});

	//이메일 입력값 형식 검사
	//이메일: /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	//이메일 아이디: /^([\w-]+(?:\.[\w-_]+)*)$/i
	//이메일 도메인: /^((?:[\w-]+\.)*\w[\w-_]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	/* var regExpEmail=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	$("#emailId").click(function(){
		var emailIdText=$("#emailId").text();
		$("#email").val(emailIdText);
	}) */
	var regExpEmailId = /^([\w-]+(?:\.[\w-]+)*)$/i;
	var regExpEmailDomain = /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	$("#emailId").keyup(
			function() {
				if ($("#emailId").val().length < 3
						|| !regExpEmailId.test($("#emailId").val())) {
					$("#emailIdCheck").html("이메일 아이디를 입력하세요");
				} else {
					$("#emailIdCheck").html("");
				}
			});

	$("#emailDomain").keyup(
			function() {
				if ($("#emailDomain").val().length < 5
						|| !regExpEmailId.test($("#emailDomain").val())) {
					$("#emailDomainCheck").html("이메일 도메인을 입력하세요");
				} else {
					$("#emailDomainCheck").html("");
				}
			});

	//주소 선택지 보기: 더미데이터 퉁. kill'em all
	
	//주소 선택여부 검사: 더미데이터 퉁.
	
	//프로필 사진 첨부

	//다음페이지 이동 = 회원가입 처리 / 입력받아야 할 파트 null 체크
	$("#certification").click(
			function() {
				if ($("#id").val() == "") {
					$("#idCheck").html("아이디를 입력해주세요");
				} else if ($("#pw").val() == "") {
					$("#pwCheck").html("비밀번호를 입력해주세요");
				} else if ($("#name").val() == "") {
					$("#nameCheck").html("이름을 입력해주세요");
				} else if (($("#birthYear").val() == "")
						|| ($("#birthMonth").val() == "")
						|| ($("#birthDay").val() == "")) {
					$("#birthCheck").html("생년월일을 입력해주세요");
				} else if ($("gender").val() == "") {
					$("#genderCheck").html("성별을 입력해주세요");
				} else if (($("#emailId").val() == "")
						|| ($("#emailDomain").val() == "")) {
					$("#emailCheck").html("이메일을 입력해주세요");
				} else if (($("#addressCity").val() == "")
						|| ($("#addressGu").val() == "")
						|| ($("#addressDong").val() == "")) {
					$("#addressCheck").html("주소를 입력해주세요");
				}
				/* $.ajax(function(){
					url:"",
					data: {
						id: $("#id").val(), 
						pw: $("#pw").val(),
						name: $("#name").val(),
						birthYear: $("#birthYear").val(),
						birthMonth: $("#birthMonth").val(),
						birthDay: $("#birthDay").val(),
						gender: $("gender").val(),
						emailId: $("#emailId").val(),
						emailDomain: $("#emailDomain").val();
						addressCity: $("#addressCity").val(),
						addressGu: $("#addressGu").val(),
						addressDong: $("#addressDong").val(),
						profilePhoto: $("#profilePhoto").val()
					},
					success: function(result){
					if(result) {
						location.href="certification.jsp";
					} else {
						alert("회원가입 실패");
					}	
					}
				})*/
				location.href="certification.jsp";
			});
</script>
</body>
</html>