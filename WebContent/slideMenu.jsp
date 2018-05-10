<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
.w3-bar-block {
	font-size: 12pt;
	font-weight: normal;
}
/* 퍼온소스 */
.w3-button{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}
.w3-button{-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
.w3-button:disabled{cursor:not-allowed;opacity:0.3}
.w3-button:hover{color:#000!important;background-color:#ccc!important}
.w3-sidebar{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
.w3-white,.w3-hover-white:hover{color:#000!important;background-color:#fff!important}
@media (min-width:993px){.w3-modal-content{width:900px}.w3-hide-large{display:none!important}.w3-sidebar.w3-collapse{display:block!important}}
@media (max-width:992px) and (min-width:601px){.w3-hide-medium{display:none!important}}
@media (max-width:992px){.w3-sidebar.w3-collapse{display:none}.w3-main{margin-left:0!important;margin-right:0!important}}
.w3-top,.w3-bottom{position:fixed;width:100%;z-index:1}.w3-top{top:0}
.w3-large{font-size:18px!important}
.w3-padding{padding:8px 16px!important}
.w3-container:after,.w3-container:before,.w3-panel:after,.w3-panel:before,.w3-row:after,.w3-row:before,.w3-row-padding:after,.w3-row-padding:before,
.w3-cell-row:before,.w3-cell-row:after,.w3-clear:after,.w3-clear:before,.w3-bar:before,.w3-bar:after{content:"";display:table;clear:both}
.w3-container,.w3-panel{padding:0.01em 16px}
.w3-bar-item{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0}
@media (max-width:600px){.w3-modal-content{margin:0 10px;width:auto!important}.w3-modal{padding-top:30px}
.w3-dropdown-hover.w3-mobile .w3-dropdown-content,.w3-dropdown-click.w3-mobile .w3-dropdown-content{position:relative}	
.w3-hide-small{display:none!important}.w3-mobile{display:block;width:100%!important}.w3-bar-item.w3-mobile,.w3-dropdown-hover.w3-mobile,.w3-dropdown-click.w3-mobile{text-align:center}
.w3-dropdown-hover.w3-mobile,.w3-dropdown-hover.w3-mobile .w3-btn,.w3-dropdown-hover.w3-mobile .w3-button,.w3-dropdown-click.w3-mobile,.w3-dropdown-click.w3-mobile .w3-btn,.w3-dropdown-click.w3-mobile .w3-button{width:100%}}
.w3-blue,.w3-hover-blue:hover{color:#fff!important;background-color:#2196F3!important}
.w3-xlarge{font-size:24px!important}
.w3-margin-right{margin-right:16px!important}
.w3-overlay{position:fixed;display:none;width:100%;height:100%;top:0;left:0;right:0;bottom:0;background-color:rgba(0,0,0,0.5);z-index:2}
</style>

</head>
<body>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-white w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:240px;font-weight:bold;" id="mySidebar"><br>
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
<header class="w3-container w3-top w3-blue w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-blue w3-margin-right" onclick="w3_open()">☰</a>
  <span>Company Name</span>
</header>
  
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

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