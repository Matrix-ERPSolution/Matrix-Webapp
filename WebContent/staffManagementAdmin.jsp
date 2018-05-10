<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script>
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
<div align="center" class="w3-center">
	<h3>직원 관리</h3>
</div>
<div class="accordion" style="width: 235pt; margin-left: 20pt;">
	<h3>승인 요청 내역</h3>
		<div><%@include file="staffConfirmAdmin.jsp" %></div>
	
	<h3>재직 중인 직원들</h3>
		<div><%@include file="staffCurrentAdmin.jsp" %></div>
			
	<h3>퇴사한 직원들</h3>
		<div><%@include file="staffRetiredAdmin.jsp" %></div>
</div>
<script>
$(".inline").css({
	"display":"inline"
});

$(function(){
	$(".profilePicture").click(function(){
		location.href ='staffDetailAdmin.jsp';
	})
});
		
</script>
</body>
</html>