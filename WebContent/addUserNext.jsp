<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<button id="addUserButton" class="roundBox" >가입하기</button>

</body>
<script>
//아이디 입력값 형식 검사: 
//아이디 : 6~16자 영소문자, 숫자-영소문자 1자 반드시 포함/정규표현식: ^(?=.*[a-z])[a-z0-9]{6,16}$
$("#userId").keyup(function() {
	var regExpId = new RegExp("^(?=.*[a-z])[a-zA-Z0-9]{6,16}$");
		if ($("#userId").val().length >= 17) {
			$("#idCheck").html("아이디는 6~16자여야 합니다.");
		} else if(!regExpId.test($("#userId").val())) {
			$("#idCheck").html("아이디는 영문 소문자, 숫자만 사용가능합니다.");
		} else {
		//아이디 중복검사
		$.ajax({
			url: "controller?cmd=isUserIdAction",
			data: {
				userId: $("#userId").val()
			},
			success: function(result) {
				var result = JSON.parse(result);
				if(result["result"] == "false") {
					$("#idCheck").html("");
				} else {
					$("#idCheck").html("사용중인 아이디입니다.")
				}
			}
		});
	}
});

//비밀번호 입력값 형식 검사
//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$
$("#pw").keyup(function(){
	var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
	if($("#pw").val().length >=17) {
		$("#pwCheck").html("비밀번호는 6~16자여야 합니다.");
	} else if( !regExpPw.test($("#pw").val())) {
		$("#pwCheck").html("비밀번호는 영문 대소문자, 숫자, 특수문자로 구성되어야 합니다.");
	} else {
		$("#pwCheck").html("");
	}
});

//비밀번호 확인 일치여부 검사
$("#pw2").keyup(function(){
	if($("#pw").val()!=$("#pw2").val()){
		$("#pwCheck2").html("불일치")
	} else {
		$("#pwCheck2").html("");
	}
});

//이름 입력값 형식 검사: 2~12자의 한글, 영문만 사용 가능합니다.
//[가-힣a-z]{2,12}
$("#name").keyup(function(){
	var regExpName=new RegExp("[가-힣a-z]{2,12}");
	if($("#name").val.length >=13) {
		$("#nameCheck").html("이름은 2~12자여야 합니다.");
	} else if(!regExpName.test($("#name").val()))  {
		$("#nameCheck").html("이름은 한글, 영소문자만 사용 가능합니다.");
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
		$("#birthCheck").html("월을 먼저 선택해주세요.");
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
$("#emailId").keyup(function() {
	var regExpEmailId = /^([\w-]+(?:\.[\w-]+)*)$/i;
	if ($("#emailId").val().length < 3 || !regExpEmailId.test($("#emailId").val())) {
		$("#emailIdCheck").html("이메일 아이디를 입력하세요");
	} else {
		$("#emailIdCheck").html("");
	}
});

$("#emailDomain").keyup(function() {
	var regExpEmailDomain = /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if ($("#emailDomain").val().length < 5 || !regExpEmailId.test($("#emailDomain").val())) {
		$("#emailDomainCheck").html("이메일 도메인을 입력하세요");
	} else {
		$("#emailDomainCheck").html("");
	}
});

//주소 선택지 보기: 더미데이터 퉁. kill'em all

//주소 선택여부 검사: 더미데이터 퉁.

//프로필 사진 첨부

//다음페이지 이동 = 입력받아야 할 파트 null + xxxCheck 파트 체크 -> 다 입력되어야 ajax로 가입처리
$("#addUserButton").click(function() {
	var check=true;
	if(check){
		if ($("#userId").val() == "" || $("#userId").html() != "") {
			$("#idCheck").html("아이디를 다시 확인해주세요");
			$("#userId").focus();
			check=false;
		}
	}
	
	if(check){
		if ($("#pw").val() == "" || $("#pwCheck").html()!="") {
			$("#pwCheck").html("비밀번호를 다시 확인해주세요");
			$("#pw").focus();
			check=false;
		}
	}
	
	if(check) {
		if($("#phoneNum").val()=="" || $("#certifyResult").html()!="") {
			$("#certifyResult").html("휴대폰 번호를 다시 확인해주세요");
			$("#phoneNum").focus();
			check=false;
		}
	}
	
	if(check) {
		if ($("#name").val() == "" || $("#nameCheck").html()!="") {
			$("#nameCheck").html("이름을 다시 확인해주세요");
			$("#name").focus();
			check=false;
		}
	}
	if(check){
		if (($("#birthYear").val() == "")
				|| ($("#birthMonth").val() == "")
				|| ($("#birthDay").val() == "")
				) {
			$("#birthCheck").html("생년월일을 다시 확인해주세요");
			$("#birthYear").focus();
			check=false;
		} 
	}
	
	if(check){
		if (($("gender").val() == "") || ($("#genderCheck").html() != "")) {
			$("#genderCheck").html("성별을 다시 확인해주세요");
			$("#gender").focus();
			check=false;
		}	
	}
	
	if(check) {
		if (($("#emailId").val() == "")) {
			$("#emailIdCheck").html("이메일 아이디를 다시 확인해주세요");
			$("#emailId").focus();
			check=false;
		} 
	}
	
	if(check) {
		if($("#emailDomain").val() == ""){
			$("#emailDomainCheck").html("이메일 도메인을 다시 확인해주세요");
			$("#emailDomain").focus();
			check=false;
		} 
	}
	
	if(check) {
		if (($("#addressCity").val() == "")
				|| ($("#addressGu").val() == "")
				|| ($("#addressDong").val() == "") 
				|| ($("#addressCheck").html!="")) {
			$("#addressCheck").html("주소를 다시 확인해주세요");
			$("#addressCity").focus();
			check=false;
		}
	}
	
	if(check) {
		$.ajax({
			url : "controller?cmd=addUserAction",
			data : {
					userId : $("#userId").val(),
					pw : $("#pw").val(),
					phoneNum : $("#phoneNum").val(),
					name : $("#name").val(),
					birthYear : $("#birthYear").val(),
					birthMonth : $("#birthMonth").val(),
					birthDay : $("#birthDay").val(),
					gender : $("gender").val(),
					emailId : $("#emailId").val(),
					emailDomain : $("#emailDomain").val(),
					addressCity : $("#addressCity").val(),
					addressGu : $("#addressGu").val(),
					addressDong : $("#addressDong").val(),
					profilePhoto : $("#profilePhoto").val()
					},
			success : function(result) {
			if (result) {
					alert("Matrix의 회원이 되신 것을 환영합니다!")
					location.href = "controller?cmd=certificationUI";
				} 
			}
		});	
	} else {
		alert("회원가입에 실패하였습니다.");
	}
});
</script>
</html>