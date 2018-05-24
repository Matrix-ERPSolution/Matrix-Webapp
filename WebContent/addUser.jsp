<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 뒤로가기 기능 구현 필요 -->
<html>
<head>
<%@include file="headSetting.jsp"%>
<title>회원가입</title>
</head>
<body>
<div>
	<img class="inline" src="images/back.png" width="30pt" align="left"/>
	<h1 class="inline" align="center">회원가입</h1>
</div>
	<div id="cellPhoneCertify">
		휴대폰 번호<input type="text" id="cellPhone" required="required" placeholder="번호만 입력">
		<div id="certifyResult"></div>
		<button id="certify1" class="ui-button ui-widget ui-corner-all">인증</button>
		</div><!-- cellPhoneCertify end -->
		<br>
		<div id="certifier">
	인증번호입력 <input type="text" id="inputCertification">
		<button id="certify2" class="ui-button ui-widget ui-corner-all">확인</button>
		<br>
		</div>
		<!-- certifier end -->

	<button id="addUserNext" class="ui-button ui-widget ui-corner-all" >다음 단계</button>
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

		$("#cellPhone").keyup(function() {
			if ($("#cellPhone").val().length>=12 || !regExpPhone.test($("#cellPhone").val())) {
				$("#certifyResult").html("휴대폰 번호를 다시 입력해주세요");
			} else {
				$("#certifyResult").html("");
			}
		});
		
	//휴대폰 중복여부
	/* $("#certify1").click(function(){
		$.ajax(function(){
			url:"",
			data: {
				cellPhone:$("#cellPhone").val()
			}, 
			success: function(result){
				if($("#cellPhone").val() == result) {
					alert("이미 인증된 휴대폰 번호입니다.")
				} else {
					alert("인증번호가 발송되었습니다.")
				}
			}
		})
	}); */
			
	//인증번호 입력값 형식 검사					

	//인증번호 유효성 검사

	//다음 단계 페이지 보여주기
	$("#addUserNext").click(function(){
		if($("#cellPhone").val()=="") {
			alert("휴대폰 인증을 진행하세요");
		} else if($("#inputCertification").val()=="") {
			alert("인증번호를 입력하세요");
		} else if($("#certifyResult").html() =="") {
			location.href="addUserNext.jsp";
		}
	});

</script>
</body>
</html>