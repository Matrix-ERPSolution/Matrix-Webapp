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
		휴대폰 번호 <select id="numberField1" required="required">
			<option value="">선택</option>
			<option value="010">010</option>
		</select>- <input type="tel" id="numberField2" required="required">- <input
			type="tel" id="numberField3" required="required">
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
</script>
</body>
</html>