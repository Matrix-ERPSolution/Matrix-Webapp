<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body id="grad1">
	<div>
	<!-- <img class="inline" src="images/back.png" width="30%" height="80%" style="left:20px;"> -->
	<img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"><br>
	<h4 class="inline" align="center">아이디/비밀번호 찾기</h4>
	</div>
	<div id="findId">
		<h4>아이디 찾기</h4>
		<h5>본인명의 휴대폰 번호로 인증</h5>
		<br>
		<div id="phoneNumCertify">
			<input type="text" id="phoneNum" class="roundBox" required="required" placeholder="휴대폰 번호만 입력">
			<div id="certifyResult"></div>
			<button id="certify1" class="roundBox">인증</button>
		</div>
		<!-- phoneNumCertify end -->
		<br>
		<div id="certifier">
			<input type="text" id="inputCertification" class="roundBox"
				placeholder="인증번호입력"><br>
			<button id="certify2" class="roundBox">확인</button>
			<br>
		</div>
		<!-- certifier end -->
		<div id="findIdResult"></div>
		<!-- findIdResult end -->
	</div>
	<!-- findId end -->

	<div id="findPassword">
	<h4>비밀번호 찾기</h4><br>
	<input type="text" id="userId" class="roundBox" required="required" placeholder="아이디"><div id="idCheck"></div><br>
	<button id="findUserPhoneNum" class="roundBox">휴대폰 번호 찾기</button>
	<h5>회원정보에 등록된 휴대폰 번호로 인증</h5>
	<input type="text" id="getUserPhoneNum" class="roundBox" placeholder="휴대폰 번호만 입력" readonly><br>
	<button id="certify3" class="roundBox">인증</button><br>
		<h5>본인명의 휴대폰 번호로 인증</h5><br>
		<div id="phoneNumCertify">
		<input type="text" id="userPhoneNum" class="roundBox" required="required" placeholder="휴대폰 번호만 입력">
		<div id="certifyResult"></div>
		<button id="certify4" class="roundBox">인증</button>
		</div><!-- phoneNumCertify end -->
	</div><!-- findPassword end -->
	<div id="updatePassword">
	<input type="password" id="newPw" class="roundBox" required="required" placeholder="비밀번호 재설정"><div id="pwCheck"></div><br>
	<input type="password" id="checkPw" class="roundBox" required="required" placeholder="비밀번호 확인"><div id="pwCheck2"></div>
	
	</div><!-- updatePassword end -->

	<button class="roundBox" >입력완료</button>
	<script>
		$(document).ready(function() {
			$(".inline").css({
				"display" : "inline"
			})
		});
		
	/* 아이디/비밀번호 찾기		
	아이디 찾기	
		휴대폰 번호 중복 검사
		휴대폰 인증번호 요청
		인증번호 입력값 형식 검사
		인증번호 유효성 검사
	비밀번호 재설정	
		휴대폰 번호 입력값 형식 검사
		휴대폰 인증번호 요청
		인증번호 입력값 형식 검사
		인증번호 유효성 검사
		휴대폰 번호 명의자 일치여부 검사
		
 */	
 
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
		
	//휴대폰 번호 중복 검사;
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
						alert("존재하지 않는 번호입니다.");
					} else {
						alert("인증번호가 발송되었습니다.")
					}
				}
			});	
		}
	});
			
	//인증번호 입력값 형식 검사 - 차후 구현			

	//인증번호 유효성 검사 - 차후 구현
	
	//휴대폰 번호와 인증번호를 보내주면 해당하는 아이디 보여주기
	/* $("#certify2").click(function(){
		if($("#phoneNum").val()=="" || $("#inputCertification").val()=="") {
			$("#findIdResult").html("휴대폰 인증을 진행해주세요.");
		} else {}
		$.ajax({
			url: "controller?cmd=isUserIdAction"
		})
	}) */
	
	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자-영소문자 1자 반드시 포함/정규표현식: ^(?=.*[a-z])[a-z0-9]{6,16}$
	var regExpId = new RegExp("^(?=.*[a-z])[a-zA-Z0-9]{6,16}$");

	$("#userId").keyup(function() {
		if ($("#userId").val().length >= 17 || !regExpId.test($("#userId").val())) {
			$("#idCheck").html("입력이 잘못되었습니다.");
		} else {
			$("#idCheck").html("");
		} 
		//아이디 유무 검사: v표 띄우기;;;;
		$.ajax({
			url: "controller?cmd=isUserIdAction",
			data: {
				userId: $("#userId").val()
			},
			success: function(result) {
				var result = JSON.parse(result);
				if(result["result"] == "false") {
					$("#idCheck").html("존재하지 않는 아이디");					
				} else {
					$("#idCheck").html("이것이자바다");	//나중에 깔쌈한 v표 그림을 넣든지 해주세요...
					$("#userId").attr("readonly","readonly");
				}
			}
		})	
	});
	
	//아이디에 해당하는 휴대폰 번호 보기
		$("#findUserPhoneNum").click(function(){
			if($("#userId").val()=="") {
				$("#idCheck").html("아이디를 입력해주세요");
			} else {
				$.ajax({
					url: "controller?cmd=getUserPhoneAction",
					data: {
						userId : $("#userId").val()
					},
					success: function(result) {
						var result = JSON.parse(result);
						//alert(result);
						if(result["result"] == "null") {	//해당하는 경우가 없음
							$("#getUserPhoneNum").val("존재하지 않는 번호입니다");
						} else {
							//alert(result["result"]);
							$("#getUserPhoneNum").val(result["result"]);
						}
					}
				});
			}
		});
	
		//비밀번호 입력값 형식 검사
		//비밀번호 : 6~16자의 영문 대 소문자, 숫자, 특수문자/정규표현식: ^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$
		var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
		$("#newPw").keyup(function(){
			if($("#newPw").val().length >=17 || !regExpPw.test($("#newPw").val())) {
				$("#pwCheck").html("입력이 잘못되었습니다.");
			} else {
				$("#pwCheck").html("");
			}
		});
		
		//비밀번호 확인 일치여부 검사
		$("#checkPw").keyup(function(){
			if($("#newPw").val()==$("#checkPw").val()){
				$("#pwCheck2").html("일치")
			} else {
				$("#pwCheck2").html("불일치");
			}
		});
	
	</script>
</body>
</html>