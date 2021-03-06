<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%-- <%@ include file="headSetting.jsp" %> --%>
<script>
$(function() {
	$(".accordion").accordion({  

	});
});
$(function() {
	$(".subAccordion").accordion({
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
		<img src="images/leftTriangle.png" width="30pt" />
	</div>
	<h2 class="inline">5월 2일(수)</h2>
	<div class="inline">
		<img src="images/rightTriangle.png" width="30pt" />
	</div>
	<div class="inline">
		<img src="images/taskassign.png" width="50pt" />
	</div>
	<h3>오늘의 업무</h3>
</div>
<div class="accordion">
	<div>
		<p class="inline" align="left">개인업무</p>
		<p class="inline"></p>
	</div>
	<div id="personalTask">
		<table>
			<tr>
				<td>보건증 갱신</td>
				<td>김태훈</td>
			</tr>
			<tr>
				<td>통장사본 제출</td>
				<td>홍윤영</td>
			</tr>
			<tr>
				<td>연진이 생일 케이크 사오기 (2호)</td>
				<td>김수한무</td>
			</tr>
		</table>
	</div>
	<!-- end personal -->

	<h3>오픈조</h3>
	<div id="openUnit">
		<div class="subAccordion">
			<div>오픈 업무</div>
			<table>
				<tr>
					<td>쇼케이스 점등</td>
					<td></td>
				</tr>
				<tr>
					<td>POS기 켜기</td>
					<td>장윤석</td>
				</tr>
			</table>
			<div>재료 준비</div>
		</div>
		<!-- end subAccordion -->
	</div>
	<!-- end openUnit -->

	<h3>미들조</h3>
	<div id="middle">미들업무</div>

	<h3>마감조</h3>
	<div id="close">마감업무</div>

</div> <!-- end accordion -->
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>
</html>