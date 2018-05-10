<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<style>
.accordion {
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
    max-height: 50px;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
<script>
$(function() {
	$(".accordion").accordion({  
		'collapsible':true,'active':false
	});
});
</script>
</head>

<body>
<div id="commonMenu">
	<%@include file="updateUserNext.jsp" %>
</div>
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


</body>
</html>