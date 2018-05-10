<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  
 <style type="text/css">
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1} 
/* 찬영오빠 위의 코드는 어디에 쓰이는 건지 잘 모르겠어요 일단 살려둠 from 연진*/
.w3-bar-block {
	font-size: small;
	font-weight: bold;
}
#logo {
	width: 150px;
	height: 35px;
}
</style> 

</head>
<body>
<!-- Sidebar/menu -->
<div class="w3-sidebar w3-white w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
  <button class="w3-bar-item w3-button w3-small" onclick="w3_close()" style="text-align:right;">&times;</button>
  <div class="w3-container">
  	<table>
  		<tr>
  			<td><img alt="프로필사진" src="images/defaultProfile.png" style="width: 70px; height: 70px;"></td>
  			<td><h6><b>가락시장점<br>관리자<br>홍윤영 님</b></h6></td>
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
</div>

<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>


<header class="w3-container w3-large">
  <a href="javascript:void(0)" class="w3-button w3-margin-right w3-large" onclick="w3_open()">☰</a>
    <span><img id="logo" src="images/logo.png"></span>
</header>

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