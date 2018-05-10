<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
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

.active, .accordion:hover {
    background-color: #99ccff;
}

.accordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

ul {
	margin-left: -20pt;
	list-style: none;
}

li:hover, .selected {
	background-color: #99ccff;
}
</style>
</head>

<body>
<div id="commonMenu">
	<%@include file="updateUserNext.jsp" %>
</div>
	<div class="accordion">관리자 정보 변경</div>
	<div class="panel" id="changeInformationAdmin">
		사업자등록번호 <input type="text" id="bizNumber" name="bizNumber" required="required" pattern = "(\d{3})(\d{2})(\d{4})" placeHolder="사업자등록번호 10자리를 입력하세요"><br>
		대표자명 <input type="text" id="adminName" required="required"><br>
		지점 전화번호 <input type="text" id="branchTel" required="required" placeHolder="매장 전화번호를 -제외하고 입력하세요"><br>
		지점 주소주소 <select name="city1" id="city1" required="required">
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
		<input type="text" placeHolder="지점 상세주소" required="required"><br>
		영업시간 <input type="text" id="time" required="required"><br>
		
		<button id="certification" class="ui-button ui-widget ui-corner-all">수정완료</button>
	</div>	<!-- panel changeInformationAdmin end -->
<button id="test">사업자등록번호 체크</button>
<script type="text/javascript">
	var acc = document.querySelectorAll(".accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}

	/* 
	//테스트용코드
	$("#test").on("click", function(){
    	alert($("#bizNumber").val());	
    }) */
    
</script>
</body>
</html>