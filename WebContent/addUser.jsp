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
	<fieldset>
	<div id="cellPhoneCertify">
		휴대폰 번호<input type="text" id="cellPhone" required="required" pattern="(01[0|1|6|7|8|9]{1})([1-9]{3,4})([0-9]{4})" title="전화번호 양식"><div id="certifyResult"></div>
		<button href="" id="certify1"
			class="ui-button ui-widget ui-corner-all">인증</button>
		<br>
		<div id="certifier">
			인증번호입력 <input type="text" id="inputCertification">
			<button href="" class="ui-button ui-widget ui-corner-all">확인</button>
			<br>
		</div>
		<!-- certifier end -->
	</div>
	<!-- cellPhoneCertify end -->
	</fieldset>

	<button id="addMember2" class="ui-button ui-widget ui-corner-all" >다음 단계</button>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});
	
	$("#addMember2").on("click", function(){
		location.href="addMember2.jsp";
	});
	
	//휴대전화 유효성 검사 	
	$(document).ready(function() {
		$("#certify1").click(function() {
			var regCellPhone = /^(01[0|1|6|7|8|9]{1})([1-9]{3,4})([0-9]{4})$/;
			if (!$("#cellPhone").val()) {
				$("#certifyResult").html('휴대전화번호를 입력하세요');
				$("#cellPhone").focus();
				return false;//값이 비어있을 경우
			} else if (!regCellPhone.test($("#cellPhone").val())) {
				$("#certifyResult").html('올바르지 않은 전화번호입니다');
				$("#cellPhone").val('');
				$("#cellPhone").focus();
				return false;//형식에 맞지 않을 경우
			}
		});
	});
	
</script>
</body>
</html>