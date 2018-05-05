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
<div id="dateMenu">
	<div class="inline">
		<img src="images/calendar.png" width="30pt" />
	</div>
	<div class="inline">
		<img id="scrollPast" src="images/leftTriangle.png" width="30pt" />
	</div>
	<h2 id="date" class="inline">오늘 날짜</h2>
	<div class="inline">
		<img id="scrollFuture" src="images/rightTriangle.png" width="30pt" />
	</div>
	<div class="inline">
		<img src="images/taskassign.png" width="50pt" />
	</div>
</div>

<div id="contents">
	<%@include file="todayTaskAdmin.jsp" %>
</div>
<script>
	$("#scrollPast").click(function(){
		$("#contents").html("<%@include file='pastTaskAdmin.jsp' %>");
	});
</script>
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>
</html>