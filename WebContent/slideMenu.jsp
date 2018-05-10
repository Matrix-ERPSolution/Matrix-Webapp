<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  
<style type="text/css">
/* .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer} */
.w3-half img:hover{opacity:1}
.w3-bar-block {
	font-size: 12pt;
	font-weight: normal;
}
</style>

</head>
<body>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-white w3-collapse w3-top w3-large" style="z-index:3;width:240px;font-weight:bold;" id="mySidebar"><br>
  <div class="w3-container">
  	<table>
  		<tr>
  			<td><img alt="프로필사진" src="images/defaultProfile.png" style="width: 70px; height: 70px;"></td>
  			<td><h5><b>가락시장점<br>관리자<br>홍윤영님</b></h5></td>
		</tr>
  	</table>
  </div>
  <div class="w3-bar-block">
    <a href="#updateUser" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">회원 정보 수정</a> 
    <a href="#notifications" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">알림 설정</a> 
    <a href="#help" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">도움말</a> 
    <a href="#version" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">버전 정보 ver 1.10</a> 
    <a href="#developer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-blue">개발자 정보</a> 
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-blue w3-large">
  <a href="javascript:void(0)" class="w3-button w3-blue w3-margin-right" onclick="w3_open()">☰</a>
  <span>Company Name</span>
</header>
  
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<script>
//Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

</script>

</body>
</html>