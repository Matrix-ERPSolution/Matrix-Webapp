<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<style>
.accordion, .subAccordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover, .subAccordion:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel, .subPanel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
<script>
$(function() {
	$("#tabs").tabs();
});

$(function() {
	$(".accordion").accordion({  
		'collapsible':true,'active':false
	});
});

$(function() {
	$(".subAccordion").accordion({
		'collapsible':true,'active':false,
		icons : {
			"header" : "ui-icon-plus",
			"activeHeader" : "ui-icon-minus"
		}
	});
});
</script>
</head>

<body>
updateUserAdmin와 updateUserStaff의 공통틀
<%-- <header>
	<%@include file="slideMenu.jsp" %>
	<p class="inline" align="right">앱이름</p>
</header>
	<div id="tabs">
		<ul>
			<li><a href="#dailyTaskTab">일일업무</a></li>
			<li><a href="#manualTab">매뉴얼</a></li>
			<li><a href="#staffManagementTab">직원관리</a></li>
		</ul>
		<div id="dailyTaskTab">
			<%@include file="dailyTaskAdmin.jsp" %>
		</div> <!-- end dailyTaskTab -->
		
		<div id="manualTab">
			<%@include file="manual.jsp" %>
		</div> <!-- end manualTab -->
		
		<div id="staffManagementTab">
			<%@include file="staffManagement.jsp" %>
		</div> <!-- end staffManagementTab -->
	</div> <!-- end tabs -->
	
	<div id="reCertifyMember">
	<input type="text" id="id" name="id" placeholder="아이디"><br>
	<input type="password" id="pw" name="pw" placeholder="비밀번호"><br>
	</div><!-- end reCertifyMember -->

	<div class="accordion">
		<p class="inline" align="left">회원정보 변경</p>
	<div id="privacy">
			이름 <input name="name" id="name" required="required"> <br>
			생년월일 <select name="birthyear" id="birthyear" required="required">
				<option value="">년</option>
			</select> <select name="birthmonth" id="birthmonth" required="required">
				<option value="">월</option>
			</select> <select name="birthday" id="birthday" required="required">
				<option value="">일</option>
			</select> <br> 성별 <input type="radio" name="gender" checked="checked"
				value="M" id="genderM">남자 <input type="radio" name="gender"
				value="F" id="genderF">여자 <br> 이메일 <input
				name="emailId" id="emailId" required="required"> @<input
				name="emailDomain" id="emailDomain" required="required"> <br>
			<select>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
			</select> <br> 주소 <select name="city1" id="city1" required="required">
				<option value="">시/도</option>
				<option value="서울특별시">서울특별시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="경기도">경기도</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select> <select name="city2" id="city2" required="required">
				<option value="">시/군/구</option>
				<option value="광명시">광명시</option>
				<option value="가평군">가평군</option>
				<option value="송파구">송파구</option>
			</select> <select name="city3" id="city3" required="required">
				<option value="">면/읍/동</option>
				<option value="유천면">유천면</option>
				<option value="점촌읍">점촌읍</option>
				<option value="가락동">가락동</option>
			</select> <br>
			<button id="certification" class="ui-button ui-widget ui-corner-all">수정완료</button>
		</div>
		<!-- privacy end -->
	</div>
	<!-- accordion end -->

	<div class="accordion">
		<p class="inline" align="left">비밀번호 변경</p>
		<div id="changePassword">
			아이디 <input type="text" id="id" name="id" placeholder="아이디" readonly="readonly"><br> 
			현재 비밀번호<input type="password" id="pw1" name="pw1" placeholder="현재 비밀번호"><br> 
			새 비밀번호<input type="password" id="pw2" name="pw2" placeholder="새 비밀번호"><br> 
			새 비밀번호 확인<input type="password" id="pw3" name="pw3" placeholder="새 비밀번호 확인">
			<button id="certification" class="ui-button ui-widget ui-corner-all">수정완료</button>
		</div>
		<!-- end changePassword -->
	</div> <!-- accordion end -->

	<div class="accordion">
		<p class="inline" align="left">관리자 정보 변경</p>
		<div id="changeInformationAdmin">
			사업자 등록번호 <input type="text" id="registrationNumber1" required="required">
			- <input type="text" id="registrationNumber2" required="required">
			- <input type="text" id="registrationNumber3" required="required">
			<i class="fa fa-check" aria-hidden="true" style="color: black"></i><br>
			대표자명 <input type="text" id="adminName" required="required"><br>
			매장 전화번호<input type="tel" id="branchTel" required="required"><br>
			영업시간<input type="text" id="time" required="required"><br>
			<button id="certification" class="ui-button ui-widget ui-corner-all">수정완료</button>
		</div>
		<!-- end changeInformationAdmin -->
	</div>
	<!-- accordion end -->
 --%>

</body>
</html>