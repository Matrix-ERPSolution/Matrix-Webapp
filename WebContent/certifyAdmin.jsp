<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
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
    text-align: center;
}
.addUserInput {
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
}
.certifyUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: rgb(153, 204, 255);
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
.addUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #005580;
	color: #FFFFFF;
}
.cancelButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
}
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
	<span>관리자 회원 인증</span>
</div>
	<input type="text" id="licenseNum" class ="addUserInput" required="required" placeholder="-제외한 사업자등록번호 10자 입력"><br>
	<button id="certifyLicense" class="certifyUserButton">사업자번호조회</button>
	<div id="licenseNumCheck"></div>
	<br>
<div id="adminInfo" align="center">
대표자명
	<div id="representative" class="addUserInput" align="center">홍윤영</div><br>
지점명
	<div id="branchName" class="addUserInput" align="center">가락시장점</div> <br>
매장 전화번호<div id="branchPhoneNum" class="addUserInput" align="center">02-123-1234</div><br>
영업시간<div id="openingTime" class="addUserInput" align="center">24시간</div><br>
<button id="certify" class="certifyUserButton" >인증요청</button>
</div>
<script type="text/javascript">
	 //사업자 등록번호 입력값 형식 검사
	 //정규식[1-9]{1}[0-9]{2}-[0-9]{2}-[0-9]{5}
	 //숫자만 입력되도록 유도.
	 $("#licenseNum").keyup(function(){
		var regExpLicense=new RegExp("[1-9]{1}[0-9]{2}[0-9]{2}[0-9]{5}");
		var licenseNumber = $("#licenseNum").val();
		licenseNumber = licenseNumber.replace(/[^0-9]/g,'');
		licenseNumber = licenseNumber.trim();
		 if(licenseNumber.length>=12) {
			 $("#licenseNumCheck").html("사업자등록번호를 정확히 입력해주세요.");
		 } else if(!regExpLicense.test(licenseNumber)) {
			 $("#licenseNumCheck").html("바르지 않은 형식입니다.");
		 } else {
			 $("#licenseNum").val(licenseNumber);
			 $("#licenseNumCheck").html("");
			 
		 } 
	 });
	 
/*  //사업자 등록번호 유무 검사 + 사업자 등록번호에 해당하는 대표자명, 지점명, 주소, 매장전화번호, 영업시간 보기
	 var adminId=localStorage.getItem("loginId")
	 $("#certifyLicense").click(function(){
		 $.ajax({
			 url: "",
			 data: {
				 id: adminId,
				 licenseNum: $("#licenseNum").val()
		 	 },
		 	 success: function(result) {
		 		 if(result == $("#licenseNum").val()) {
		 			//사업자등록번호와 매치되는 대표자명 등등등을 div에 넣어서 처리
		 			
		 		 } else {
		 			$("#licenseNumCheck").html("등록되지 않은 가맹점");
		 		 }
		 	 }
		 })		 
	 }); */
	 
	 //인증요청
	 $("#certify").click(function(){
		 if($("#licenseNum").val()==""){
			 alert("사업자등록번호 인증을 진행하세요");
		 } else if($("#licenseNumCheck").html()==""){
			 alert("인증요청이 전송되었습니다");
			 location.href="관리자 인증 처리 서블릿 링크."
		 }
	 })
</script>
</body>
</html>