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
    max-height: 0;
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
	<div class="accordion">직원 정보 변경</div>
	<div class="panel" id="changeInformationAdmin">
		직원 정보 수정 내용
		<button id="certification" class="ui-button ui-widget ui-corner-all">수정완료</button>
	</div>	<!-- panel changeInformationAdmin end -->

</body>
<script>
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
</script>
</html>