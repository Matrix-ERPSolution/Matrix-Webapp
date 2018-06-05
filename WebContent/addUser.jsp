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
				/* data: {
					phoneNum:$("#phoneNum").val()
				}, */ 
				success: function(result){
					$("#phoneNumCertify").hide();
					$("#next").html(result);
				}
			});
		}
	});
	 
</script>

</body>
</html>