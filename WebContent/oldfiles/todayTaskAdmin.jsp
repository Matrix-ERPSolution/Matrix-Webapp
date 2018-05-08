<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>오늘의 업무</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	$(function() {
		$("#tabs").tabs();
	});
</script>

<header>
	<div><i class="">메뉴아이콘</i></div>
	<p>앱이름</p>
</header>
</head>

<body>
	<div id="tabs">
		<ul>
			<li><a href="#tabs1">일일업무</a></li>
			<li><a href="#tabs2">매뉴얼</a></li>
			<li><a href="#tabs3">직원관리</a></li>
		</ul>
		<div id="tabs1">
			<div>
				<div style="display: inline;"><i class="">달력 아이콘</i></div>
				<div style="display: inline;"><i class="">왼쪽스크롤 아이콘</i></div>
				<div style="display: inline;">5월 2일(수)</div>
				<div style="display: inline;"><i class="">오른쪽스크롤 아이콘</i></div>
				업무배정 아이콘
			</div>
			<h4>오늘의 업무</h4>
			<div class="accordion">
				<h3>개인업무</h3>
				<div id="personal">
					<table class="table1">
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
				</div> <!-- end personal -->
				
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
					</div> <!-- end subAccordion -->
				</div> <!-- end openUnit -->
				
				<h3>미들조</h3>
				<div id="middle">미들업무</div>
				
				<h3>마감조</h3>
				<div id="close">마감업무</div>

			</div><!-- end accordion -->
		</div> <!-- end tabs1 -->
		
	<div id="tabs2">
		직원관리 탭 상세화면
	</div>
	
	<div id="tabs3">
		직원관리 탭 상세화면
	</div>
</div>
	
</body>
</html>