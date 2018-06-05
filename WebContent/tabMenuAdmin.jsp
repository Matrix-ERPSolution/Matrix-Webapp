<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>	
body {
	width: 360px;
	height: 640px;
}
.tabs {
	padding: 0px;
	max-width: 360px;
	margin-top: 230px;
	background-color: rgba(255,255,255,0.5); 
	position: relative;
}
.w3-col.s4 {

}
.w3-bar-block {
	font-size: small;
	font-weight: bold;
}
header {
	width: 360px;
	text-align: center;
	background-image: url("images/header.png");
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>

<body>
<header>
<!-- Sidebar/menu -->
<div class="w3-sidebar w3-white w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
  <button class="w3-bar-item w3-button w3-small" onclick="w3_close()" style="text-align:right;">&times;</button>
  <div class="w3-container">
  	<table>
  		<tr>
  			<td><img id="slideProfilePhoto" alt="프로필사진" src="images/profile/defaultProfile.png" style="width: 70px; height: 70px; border-radius: 50%"></td>
  			<td><span id="branchName"></span><br><span id="certifyType"></span><br><span id="name"></span>님</td>
		</tr>
  	</table>
  </div>
  <div class="w3-bar-block">
    <a href="#updateUser" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">회원 정보 수정</a> 
    <a href="#notifications" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">알림 설정</a> 
    <a href="#help" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">도움말</a> 
    <a href="#version" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">버전 정보 ver 1.0.0</a> 
    <a href="#developer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">개발자 정보</a> 
  </div>
</div>
  <a href="javascript:void(0)" class="w3-button w3-large" onclick="w3_open()" style="float: left;">☰</a>

<!-- 위치조정 필요 -->
<nav class = "containerw3-overlay" onclick="w3_close()" style="cursor:pointer" id="myOverlay">
	<div class="tabs w3-bar">
	    <div class="w3-col s4">
	      <a id="dailyTaskTab" class="w3-button w3-block">일일업무</a>
	    </div>
	    <div class="w3-col s4">
	      <a id="manualTab" class="w3-button w3-block">매뉴얼</a>
	    </div>
	    <div class="w3-col s4">
	      <a id="staffManagementTab" class="w3-button w3-block">직원관리</a>
	    </div>
	</div> 
</nav>
</header>
<script>
$("#dailyTaskTab").click(
		function(){
			 location.href="controller?cmd=dailyTaskAdminUI";
		});
$("#manualTab").click(
		function(){
			location.href="controller?cmd=manualAdminUI";
		});
$("#staffManagementTab").click(
		function(){
			location.href="controller?cmd=staffManagementAdminUI";
		});

//Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

$( document ).ready(function() {
	$.ajax({
	url: "controller?cmd=getSlideInfoAction",
	success: function(result) {
		result = JSON.parse(result);
		$("#branchName").html(result["branchName"]);
		$("#name").html(result["name"]);
		$("#slideProfilePhoto").prop("src", "images/profile/"+result["profilePhoto"]);
		if(result["type"] == "staff"){
			$("#certifyType").html("직원");
		} else if(result["type"] == "admin"){
			$("#certifyType").html("관리자");
		}
		
	}
	});
});
</script>
</body>
</html>