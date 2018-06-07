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
	padding: 10px;
	border-radius: 10px;
	border-color: #003366;
	border-style: solid;
	border-width: 2px;
	text-align: center;
	background-color: white;
	color: black;
	font-weight: bold;
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
#userHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
	text-align: center;
}
#userHeader h4 {
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 2px;
}
</style>
</head>
<body>
<img id="logo" src="images/logo_white.png" width="100%" height="100%" onclick="goHome()"><br>
<div class="addUserHeader">
<div id="userHeader"><h4>회원인증</h4></div>

</div><!-- addUserHeader end -->
	<br><br>
<div class="addUserContainer">
<img id="staffIcon" src="images/staff_icon.png" width="100px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img id="adminIcon" src="images/admin_icon.png" width="95px">
<br><br>
<a id="certifyStaff" class="certifyUserButton">직원 인증</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a id="certifyAdmin" class="certifyUserButton">관리자 인증</a>



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
		
		function goHome(){
			location.href="controller?cmd=homeUI";
		}
	</script>
</body>
</html>