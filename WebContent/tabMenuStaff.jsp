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
.tabs {
	padding: 0px;
	min-width: 360px;
};
.inline {
	display : inline;
}
.w3-bar-block {
	font-size: small;
	font-weight: bold;
}
header, body {
	max-width: 500px;
    margin: auto;
	text-align: center;
}
</style>
</head>

<body>
<header style="height: 50px;">
<!-- Sidebar/menu -->
<div class="w3-sidebar w3-white w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
  <button class="w3-bar-item w3-button w3-small" onclick="w3_close()" style="text-align:right;">&times;</button>
  <div class="w3-container">
  	<table>
  		<tr>
  			<td><img alt="프로필사진" src="images/defaultProfile.png" style="width: 70px; height: 70px;"></td>
  			<td><span id="branchName"></span><br>관리자<br><span id="name"></span>님</td>
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
  <a href="controller?cmd=homeUI"><img src="images/logo.png" style="width: 160px; "></a>
</header>

<script>

//Script to open and close sidebar
function w3_open() {
    document.querySelector("#mySidebar").style.display = "block";
}
 
function w3_close() {
    document.querySelector("#mySidebar").style.display = "none";
}

/* $( document ).ready(function() {
	$.ajax({
	url: "controller?cmd=getSlideInfoAction",
	success: function(result) {
		result = JSON.parse(result);
		$("#branchName").html(result["branchName"]);
		$("#name").html(result["name"]);
	}
	});
}); */
</script>
</body>
</html>