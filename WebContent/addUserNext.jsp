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
	<input type="password" id="pw2" class="roundBox" required="required" placeholder="비밀번호 확인"><div id="pwCheck2"></div><br>
	<button id="addPrivacy" class="roundBox" >다음 단계</button>
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
	<input type="radio" name="gender" value="M" id="genderM" checked="checked">남자 
	<input type="radio" name="gender" value="F" id="genderF" >여자
	<br> 
	<input name="emailId" id="emailId" class="roundBox" required="required" placeholder="이메일 입력">@<input type="text" name="emailDomain" id="emailDomain" readonly required="required">
	<select name="selectDomain" id="selectDomain" required="required">
		<option selected value=''>선택</option>
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
	</select> <br>
	<div id="addressCheck"></div><br> 
	<input type="text" name="profilePhoto"	id=profilePhoto class="roundBox" placeholder="프로필 사진 첨부"><br>
	<button id="addUserButton" class="roundBox" >가입하기</button>
</div>
<!-- privacy end -->
	

</body>
<script>
//privacy 박스: 처음에는 사라져 있도록 설정;
$("#privacy").hide();
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

//아이디, 비밀번호, 비밀번호 확인이 다 입력 + addPrivacy 버튼 클릭 -> privacy div 박스가 보이도록. + newMember div 박스가 사라지도록.
$("#addPrivacy").click(function(){
		if ($("#userId").val() == "") {
			$("#idCheck").html("아이디를 입력해주세요");
			$("#userId").focus();
		} else if($("#idCheck").html() != "") {
			$("#idCheck").html("아이디를 다시 확인해주세요");
			$("#userId").focus();
		} else if($("#pw").val() == "") {
			$("#pwCheck").html("비밀번호를 입력해주세요");
			$("#pw").focus();
		}  else if ($("#pwCheck").html()!="") {
			$("#pwCheck").html("비밀번호를 다시 확인해주세요");
			$("#pw").focus();
		} else if($("#pw2").val()=="") {
			$("#pwCheck2").html("비밀번호 확인을 입력해주세요");
			$("#pw2").focus();
		} else if ($("#pwCheck2").html()!="") {
			$("#pwCheck2").html("비밀번호 확인을 다시 진행해주세요");
			$("#pw2").focus();
		} else {
			$("#newMember").hide();
			$("#privacy").show();			
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
	} else if($("#birthYear").val()!="" && $("#birthMonth").val()!="" && $("#birthDay").val()!="") {
		$("#birthCheck").html("");
	}
});

//이메일 아이디 입력
$("#emailId").keyup(function() {
	var regExpEmailId = /^([\w-]+(?:\.[\w-]+)*)$/i;
	if ($("#emailId").val().length < 3) {
		$("#emailIdCheck").html("이메일 아이디를 다시 입력해주세요");
	} else if(!regExpEmailId.test($("#emailId").val())) {
		$("#emailIdCheck").html("형식에 맞지 않는 이메일 아이디입니다");
	} else {
		$("#emailIdCheck").html("");
	}
});

//이메일 도메인 선택지 보기: html 파트에서 구현.

//이메일 도메인 선택여부 검사	: 직접입력-선택	
	$('#selectDomain').change(function() {
		$("#selectDomain option:selected").each(function() {
			if ($(this).val() == "selfInput") { //도메인을 직접 입력할 경우 
				$("#emailDomain").val(''); 		//값 초기화 
				$("#emailDomain").removeAttr("readonly"); 
			} else { 							//도메인을 선택할 경우 
				$("#emailDomain").val($(this).text()); //선택값 입력 
				$("#emailDomain").attr("readonly", "true");  
			}
		})
	});

$("#emailDomain").keyup(function() {
	var regExpEmailDomain = /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if ($("#emailDomain").val().length < 5) {
		$("#emailDomainCheck").html("이메일 도메인을 다시 입력해주세요");
	} else if(!regExpEmailDomain.test($("#emailDomain").val())) {
		$("#emailDomainCheck").html("이메일 도메인을 입력하세요");
	} $("#emailDomainCheck").html("");
}); 

//주소 선택지 보기: 더미데이터 퉁. kill'em all

//주소 선택여부 검사: 더미데이터 퉁.

//프로필 사진 첨부

//다음페이지 이동 = 입력받아야 할 파트 null + xxxCheck 파트 체크 -> 다 입력되어야 ajax로 가입처리
$("#addUserButton").click(function() {
	var check=true;
	if(check){
		if ($("#userId").val() == "") {
			$("#idCheck").html("아이디를 입력해주세요");
			$("#userId").focus();
			check=false;
		} else if($("#idCheck").html() != "") {
			$("#idCheck").html("아이디를 다시 확인해주세요");
			$("#userId").focus();
			check=false;
		}
	}
	
	if(check){
		if ($("#pw").val() == "") {
			$("#pwCheck").html("비밀번호를 입력해주세요");
			$("#pw").focus();
			check=false;
		} else if($("#pw2").val()=="") {
			$("#pwCheck2").html("비밀번호 확인을 입력해주세요");
			$("#pw2").focus();
			check=false;
		} else if ($("#pwCheck").html()!="") {
			$("#pwCheck").html("비밀번호를 다시 확인해주세요");
			$("#pw").focus();
			check=false;
		} else if ($("#pwCheck2").html()!="") {
			$("#pwCheck2").html("비밀번호 확인을 다시 진행해주세요");
			$("#pw2").focus();
			check=false;
		}
	}
		
	if(check) {
		if ($("#name").val() == "") { 
			$("#nameCheck").html("이름을 입력해주세욧");
			$("#name").focus();
			check=false;
		} else if($("#nameCheck").html()!="") {
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
			$("#birthCheck").html("생년월일을 선택해주세요");
			$("#birthYear").focus();
			check=false;
		} else if($("#birthCheck").html()!=""){
			$("#birthCheck").html("생년월일을 다시 확인해주세요");
			$("#birthYear").focus();
			check=false;
		}
	}
	
	if(check) {
		if ($("#emailId").val() == "") {
			$("#emailIdCheck").html("이메일 아이디를 입력해주세요");
			$("#emailId").focus();
			check=false;
		} else if($("#emailIdCheck").html()!="") {
			$("#emailIdCheck").html("이메일 아이디를 다시 확인해주세요");
			$("#emailId").focus();
			check=false;
		}
	} 
	
	if(check) {
		if($("#emailDomain").val() == ""){
			$("#emailDomainCheck").html("이메일 도메인을 입력해주세요");
			$("#emailDomain").focus();
			check=false;
		} else if($("#emailDomainCheck").html()!="") {
			$("#emailDomainCheck").html("이메일 도메인을 다시 확인해주세요");
			$("#emailDomain").focus();
			check=false;
		}
	} 
	
	if(check) {
		if ($("#addressCity").val() == "") {
			$("#addressCheck").html("시/도를 선택해주세요");
			$("#addressCity").focus();
			check=false;
		} else if($("#addressGu").val() == "") {
			$("#addressCheck").html("시/군/구를 선택해주세요");
			$("#addressGu").focus();
			check=false;
		} else if($("#addressDong").val() == "") {
			$("#addressCheck").html("동/읍/면을 선택해주세요");
			$("#addressDong").focus();
			check=false;
		} else if($("#addressCheck").html()!="") {
			$("#addressCheck").html("주소를 다시 확인해주세요");
			$("#addressCity").focus();
			check=false;
		}
	}
	
	 if(check) {
		$.ajax({
			url : "controller?cmd=addUserAction",
			type: "POST",
			data : {
					userId : $("#userId").val(),
					pw : $("#pw").val(),
					phoneNum : $("#phoneNum").val(),
					name : $("#name").val(),
					birthYear : $("#birthYear").val(),
					birthMonth : $("#birthMonth").val(),
					birthDay : $("#birthDay").val(),
					gender : $("input:radio:checked").val(),
					emailId : $("#emailId").val(),
					emailDomain : $("#emailDomain").val(),
					addressCity : $("#addressCity").val(),
					addressGu : $("#addressGu").val(),
					addressDong : $("#addressDong").val(),
					profilePhoto : $("#profilePhoto").val()
					},
			success : function(result) {
			if (result) {
					var result = JSON.parse(result);
					if(result["result"]=="성공"){
						location.href = "controller?cmd=certificationUI";	
					} else {
						alert("다시해봐");
					}					
				} 
			}
		}); 	
	} else {
		alert("회원가입에 실패하였습니다.");
	}
});
</script>
</html>