<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div>
	<img class="inline" src="images/back.png" width="30pt" align="left"/>
	<h1>관리자 회원 인증</h1>
</div>
사업자 등록번호
	<input type="text" id="licenseNum" required="required" placeholder="-제외한 사업자등록번호 10자 입력"><button id="certifyLicense">사업자번호조회</button>
	<div id="licenseNumCheck"></div>
	<br>
대표자명
	<div id="representative">홍윤영</div><br>
지점명
	<div id="branchName">가락시장점</div> <br>
매장 전화번호<div id="branchPhoneNum">02-123-1234</div><br>
영업시간<div id="openingTime">24시간</div><br>
<button id="certify" class="ui-button ui-widget ui-corner-all" >인증요청</button>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});
		 
	 //사업자 등록번호 입력값 형식 검사
	 //정규식[1-9]{1}[0-9]{2}-[0-9]{2}-[0-9]{5}
	 var regExpLicense=new RegExp("[1-9]{1}[0-9]{2}[0-9]{2}[0-9]{5}");
		 
	 $("#licenseNum").keyup(function(){
		 if($("#licenseNum").val().length>10 || !regExpLicense.test($("#licenseNum").val())) {
			 $("#licenseNumCheck").html("사업자등록번호를 정확히 입력해주세요.");
		 } else {
			 $("#licenseNumCheck").html("");
		 } 
	 });
	 
/*  //사업자 등록번호 유무 검사 + 사업자 등록번호에 해당하는 대표자명, 지점명, 주소, 매장전화번호, 영업시간 보기
	 var adminId=localStorage.getItem("loginId")
	 $("#certifyLicense").click(function(){
		 $.ajax(function(){
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