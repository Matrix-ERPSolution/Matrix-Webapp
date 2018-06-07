<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<%@include file = "loginCheckUser.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top:100px;"><br>
	<h4 class="inline" align="center">회원가입을 환영합니다!</h4>
</div>


<i class="fa fa-user" aria-hidden="true"></i><!-- 직원용 그림-->
<button id="certifyStaff" class="ui-button ui-widget ui-corner-all">직원 인증</button>

<i class="fa fa-user-circle-o" aria-hidden="true"></i><!-- 관리자용 그림 -->
<button id="certifyAdmin" class="ui-button ui-widget ui-corner-all">관리자 인증</button>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".inline").css({
				"display" : "inline"
			})
		});
		//이동.	
		$("#certifyStaff").click(function() {
			location.href = "controller?cmd=certifyStaffUI";
		});

		$("#certifyAdmin").click(function() {
			location.href = "controller?cmd=certifyAdminUI";
		});
	</script>
</body>
</html>