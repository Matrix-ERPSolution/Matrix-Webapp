<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 뒤로가기 기능 구현 필요 -->
<html>
<head>
<%@include file="headSetting.jsp"%>
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
<title>회원가입</title>
</head>
<body id="grad1">

<div>
	<!-- <img class="inline" src="images/back.png" width="30%" height="80%" style="left:20px;"> -->
	<img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"><br>
	<h4 class="inline" align="center">회원가입</h4>
</div>
	<div id="phoneNumCertify">
		<input type="text" id="phoneNum" class="roundBox" required="required" placeholder="휴대폰 번호만 입력">
			<div id="certifyResult"></div>
		<button id="certify1" class="roundBox">인증</button>
	</div><br><!-- phoneNumCertify end -->
	<nav id="next">
		<div id="certifier">
			<input type="text" id="inputCertification" class="roundBox" placeholder="인증번호입력"><br>
			<button id="certify2" class="roundBox">확인</button><br>
		</div><!-- certifier end -->
		<button id="addUserNext" class="roundBox" >다음 단계</button>
	</nav>
<script type="text/javascript">
/*회원가입*/					
		
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});

	//휴대폰 인증번호 요청 : 입력값 검사
	//휴대폰 번호 입력값 형식 검사/정규표현식: 01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}
	var regExpPhone = new RegExp("01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}");

		$("#phoneNum").keyup(function() {
			if ($("#phoneNum").val().length>=12 || !regExpPhone.test($("#phoneNum").val())) {
				$("#certifyResult").html("휴대폰 번호를 다시 입력해주세요");
			} else {
				$("#certifyResult").html("");
			}
		});
		
	//휴대폰 중복여부: 구현 끝.
	$("#certify1").click(function(){
		if($("#phoneNum").val()==""){
			alert("휴대폰 번호를 입력해주세요");
		} else {
			$.ajax({
				url: "controller?cmd=isUserPhoneAction",
				data: {
					phoneNum : $("#phoneNum").val()
				}, 
				success: function(result) {	//dao에서 result는 boolean으로 리턴될 것; false: DB에 없음=인증가능
					var result = JSON.parse(result);
					if(result["result"] == "false") {
						alert("인증번호가 발송되었습니다");
					} else {
						alert("이미 인증된 번호입니다")
					}
				}
			});	
		}
	});
			
	//인증번호 입력값 형식 검사 - 차후 구현			

	//인증번호 유효성 검사 - 차후 구현

	//다음 단계 페이지 보여주기: addUserNext에 phoneNum값을 같이 전송 -> addUserNext를 nav 태그 안에 뿌려주는 식으로.
	$("#addUserNext").click(function(){
		if($("#phoneNum").val()=="") {
			alert("휴대폰 인증을 진행하세요");
		} /* else if($("#inputCertification").val()=="") {
			alert("인증번호를 입력하세요");
		} */ else if($("#certifyResult").html() =="") {
			$.ajax({
				url:"controller?cmd=addUserNextAction",
				data: {
					phoneNum:$("#phoneNum").val()
				}, 
				success: function(result){
					$("#phoneNumCertify").hide();
					$("#next").html(result);
				}
			});
		}
	});
		
	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자-영소문자 1자 반드시 포함/정규표현식: ^(?=.*[a-z])[a-z0-9]{6,16}$
	var regExpId = new RegExp("^(?=.*[a-z])[a-zA-Z0-9]{6,16}$");

	$("#userId").keyup(function() {
		if ($("#userId").val().length >= 17) {
			$("#idCheck").html("아이디는 6~16자여야 합니다.");
		} else if(!regExpId.test($("#userId").val())) {
			$("#idCheck").html("영소문자, 숫자만 사용가능합니다.");
		} else {
			$("#idCheck").html("");
		}
	});
	
	//아이디 중복 검사 - 중복/사용가능한 아이디; 일단 alert으로 처리.
	$("#userId").mouseleave(function(){
		$.ajax({
			url: "controller?cmd=isUserIdAction",
			data: {
				userId: $("#userId").val()
			},
			success: function(result) {
				var result = JSON.parse(result);
				if(result["result"] == "false") {
					alert("사용가능한 아이디입니다");
				} else {
					alert("사용중인 아이디입니다.")
					$("#userId").val("");
				}
			}
		})	
	});  
	
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
				if ($("#userId").val() == "") {
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
				$.ajax({
					url:"controller?cmd=addUserAction",
					data: {
						userId: $("#userId").val(), 
						pw: $("#pw").val(),
						phoneNum: $("#phoneNum").val(),
						name: $("#name").val(),
						birthYear: $("#birthYear").val(),
						birthMonth: $("#birthMonth").val(),
						birthDay: $("#birthDay").val(),
						gender: $("gender").val(),
						emailId: $("#emailId").val(),
						emailDomain: $("#emailDomain").val(),
						addressCity: $("#addressCity").val(),
						addressGu: $("#addressGu").val(),
						addressDong: $("#addressDong").val(),
						profilePhoto: $("#profilePhoto").val()
					},
					success: function(result){
					if(result) {
						location.href="controller?cmd=certificationUI";
					} else {
						alert("회원가입 실패");
					}	
					}
				});				
			}); 
</script>

</body>
</html>