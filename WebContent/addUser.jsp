<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 뒤로가기 기능 구현 필요 -->
<html>
<head>
<%@include file="headSetting.jsp"%>
<style>
#logo{
	display:block;
	padding-top:10px;
	margin-left: auto;
	margin-right: auto;
}
body {
	background-image: url("images/joinetc.png");
    background-position: center top;
    background-repeat: no-repeat;
    background-size: 360px 640px;
    margin: auto;
    width: 100%;
}
.addUserInput {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #004566;
 	line-height : normal;
	width: 200px;
	padding: 10px;
	text-align: center;
	background-color: rgba(0,0,0,0);
	color: #004566;
	font-weight: bold;
}
.certifyUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 20px;
	border: none;
	text-align: center;
	background-color: rgb(153, 204, 255);
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
.addUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 20px;
	border: none;
	text-align: center;
	background-color: #005580;
	color: #FFFFFF;
}
#cancelButton {
	width: 200px;
	padding: 10px;
	border-radius: 20px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
}
.addUserHeader {
	text-align: center;
	padding-top: 15%;
	height: 40px;
	font-size: 18pt;
}
.addUserContainer {
	text-align: center;
	padding-top: 20px;
}
</style>
</head>
<body>
<img id="logo" src="images/logo_white.png" width="100%" height="100%" ><br>

<div class="addUserHeader">
	<span>회원가입</span>
</div>

<div class="addUserContainer">
	<input type="text" id="phoneNum" class="addUserInput" required="required" placeholder="휴대폰 번호만 입력">
	<div id="certifyResult"></div>
	<button id="certify1" class="certifyUserButton">인증 요청</button>
	<input type="text" id="inputCertification" class="addUserInput" placeholder="인증번호입력">
	<button id="certify2" class="certifyUserButton">확인</button><br>
	<button id="addUserNext" class="addUserButton" >다음 단계</button>
	<button id="cancelButton">취소</button>
</div>
<script type="text/javascript">
$("#cancelButton").click(function(){
	location.href="controller?cmd=loginUI";
});

	/*회원가입*/						
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});

	//휴대폰 인증번호 요청 : 입력값 검사
	//휴대폰 번호 입력값 형식 검사/정규표현식: 01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}
	//사용자가 숫자 이외의 문자를 입력한다면 replace, 공백이 입력되면 trim.
	$("#phoneNum").keyup(function() {
		var regExpPhone = new RegExp("01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}");
		var phoneNumber=$("#phoneNum").val();
		phoneNumber=phoneNumber.replace(/[^0-9]/g,'');
		phoneNumber=phoneNumber.trim();
		if (phoneNumber.length>=12) {
			$("#certifyResult").html("길이가 맞지 않습니다.");
		} else if(!regExpPhone.test(phoneNumber)) {
			$("#certifyResult").html("잘못된 번호 양식입니다.");
		} else {
			$("#phoneNum").val(phoneNumber);
			$("#certifyResult").html("");
		}
	});
		
	//휴대폰 중복여부
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
				url:"controller?cmd=addUserNextUI",
				data: {
					phoneNum:$("#phoneNum").val()
				},
				success: function(result){
					$(".addUserContainer").html(result);
				}
			});
		}
	});
	 
</script>

</body>
</html>