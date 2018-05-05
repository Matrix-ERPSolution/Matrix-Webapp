<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>오늘의 업무</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function () {
	$(".accordion").accordion();
	//heightStyle: "content"
});
$(function() {
	$("#tabs").tabs();
});

</script>

<header>
	메뉴	<h2>앱이름</h2>
</header>
</head>

<body>
<div id="tabs">
	<ul>
		<li><a href="#tabs2">일일업무</a></li>
		<li><a href="#tabs1">매뉴얼</a></li>
		<li><a href="#tabs3">직원관리</a></li>
	</ul>
	<div id="tabs1">
		매뉴얼 탭 상세화면
	</div>
	<div id="tabs2">
	<div align="center">
		5월 2일(수) 
	</div>
	<h4 align="center">오늘의 업무</h4>
		<div class="accordion" style="width: 245pt; margin-left: -15pt;">
			<h3>오픈조</h3>
				<div id="open">
					<div class="accordion" style="width: 220pt; margin-left:-18pt;">
					<div>오픈 업무</div>
						<table style="min-width: 240pt; margin-left: -20pt" border="1">
							<thead>
								<tr><td></td><td style="min-width: 50pt"></td></tr>
							</thead>
							<tr>
								<td align="left">쇼케이스 점등</td><td></td>
							</tr>
							<tr>
								<td align="left">POS기 켜기</td><td align="right">장윤석</td>
							</tr>
							<tr>
								<td align="left">일이삼사오육칠팔구십1112131415</td><td align="right">가나다라</td>
							</tr>
						</table>
					<div>재료 준비</div>
					</div>
				</div>
			<h3>미들조</h3>
				<div id="middle">미들업무</div>
			<h3>마감조</h3>
				<div id="close">마감업무</div>
			<h3>개인업무</h3>
				<div id="personal">
					<table style="min-width: 150pt">
						<tr>
							<td align="left">보건증 갱신</td><td align="right">김태훈</td>
						</tr>
						<tr>
							<td align="left">통장사본 제출</td><td align="right">홍윤영</td>
						</tr>
					</table>
				</div>
		</div>
	</div>
	<div id="tabs3">
		직원관리 탭 상세화면
	</div>
</div>
	
</body>
</html>