<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<%@include file = "loginCheckUser.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
/* .addUserInput {
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
} */
.certifyUserButton {
	width: 100px;
	padding: 40px;
	border-radius: 50%;
	border: none;
	text-align: center;
	background-color: rgb(153, 204, 255);
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
/* .addUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #005580;
	color: #FFFFFF;
} */
/* .cancelButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
} */
.addUserHeader {
	text-align: center;
	padding-top: 15%;
	height: 40px;
	font-size: 18pt;
}
.addUserContainer {
	text-align: center;
	padding-top: 20px;
	width: 300px;
	margin: auto;
}
</style>
</head>
<body>
<img id="logo" src="images/logo_white.png" width="100%" height="100%" ><br>
<div class="addUserHeader">
<br>
	<span>회원인증</span>
	<br><br>
</div><!-- addUserHeader end -->
<div class="addUserContainer">
<!-- <img id="staffLogo" src="images/profile/defaultProfile.png" width="20%" height="20%"><br> -->
<button id="certifyStaff" class="certifyUserButton">직원 인증</button>

<button id="certifyAdmin" class="certifyUserButton">관리자 인증</button>

<!-- <i class="fa fa-user" aria-hidden="true"></i> --><!-- 직원용 그림-->

<!-- <i class="fa fa-user-circle-o" aria-hidden="true"></i> --><!-- 관리자용 그림 -->

</div><!-- addUserContainer end -->
 	<script type="text/javascript">
 <!--	$(document).ready(function() {$(".inline").css({"display" : "inline"})});-->
 		
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