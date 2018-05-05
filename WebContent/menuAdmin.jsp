<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<script>
$(function() {
	$("#tabs").tabs();
});
</script>
</head>

<body>
<header>
	<img class="inline" src="images/menu.png" width="30pt" />
	<p class="inline" align="center">앱이름</p>
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
	</div>
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>
</html>