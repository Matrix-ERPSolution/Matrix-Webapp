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
</head>

<body>
<header>
	<img class="inline" src="images/menu.png" width="30pt" />
	<p class="inline" align="center">앱이름</p>
</header>
	<div id="tabs">
		<ul>
			<li><a href="#tabs1">일일업무</a></li>
			<li><a href="#tabs2">매뉴얼</a></li>
			<li><a href="#tabs3">직원관리</a></li>
		</ul>
		<div id="tabs1">
			<div id="dateMenu">
				<div class="inline"><img src="images/calendar.png" width="30pt" /></div>
				<div class="inline"><img src="images/leftTriangle.png" width="30pt" /></div>
				<h2 class="inline">5월 2일(수)</h2>
				<div class="inline"><img src="images/rightTriangle.png" width="30pt" /></div>
				<div class="inline"><img src="images/taskassign.png" width="50pt" /></div>
				<h3>오늘의 업무</h3>
			</div>
			<div class="accordion">
				<div>
					<p class="inline" align="left">개인업무</p><p class="inline"></p>
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
			<h3>2층 확장</h3>
			저장 날짜: 2016.02.17.
			<div class="accordion">
				<h3>시재관리</h3>
					<div>시재관리 디테일 여기에</div>
					
				<h3>재고관리</h3>
					<div>재고관리 디테일 여기에</div>
					
				<h3>청소</h3>
				<div class="subAccordion">
					<div>주방</div>
					<table>
						<tr>
							<td>음식물 쓰레기 버리기</td>
							<td>마감 시</td>
						</tr>
						<tr>
							<td>싱크대 닦기</td>
							<td>마감 시</td>
						</tr>
						<tr>
							<td>행주 소독</td>
							<td>마감 시</td>
						</tr>
						<tr>
							<td>냉장고 성에 제거</td>
							<td>1개월</td>
						</tr>
					</table>
					<div>홀</div>
						<table>
						<tr>
							<td>바닥 대걸레 청소</td>
							<td>오픈 시</td>
						</tr>
						<tr>
							<td>쓰레기통 비우기</td>
							<td>마감 시</td>
						</tr>
						</table>
					<div>화장실</div>
						<table>
						<tr>
							<td>남자화장실 핸드타월 갈기</td>
							<td>일주일</td>
						</tr>
						</table>
				</div> <!-- end subAccordion -->
			</div> <!-- end accordion -->
		</div>  <!-- end tabs2 -->
		
		<div id="tabs3">
			<div align="center">
				<h3>직원 목록</h3>
			</div>
			<div class="accordion" style="width: 235pt; margin-left: -15pt;">
				<h3>승인 요청 내역</h3>
				<div id="staffAcceptRequestList">
					<table style="width: 220pt; margin-left: -20pt;">
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">윤제발</td>
							<td style="min-width: 20pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">891024</td>
							<td><input type="button" class="staffAcceptButton"
								value="승인" style="float: right"></td>
							<td><input type="button" class="staffRejectButton"
								value="거부" style="float: right"></td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">하승인</td>
							<td style="min-width: 20pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">971205</td>
							<td><input type="button" class="staffAcceptButton"
								value="승인" style="float: right"></td>
							<td><input type="button" class="staffRejectButton"
								value="거부" style="float: right"></td>
						</tr>
					</table>
				</div>

				<h3>재직 중인 직원들</h3>

				<div id="workingStaffList">
					<table style="width: 230pt; margin-left: -20pt;">
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">김연진</td>
							<td style="min-width: 50pt" align="right">여</td>
							<td style="min-width: 20pt" align="right">880101</td>
							<td><input type="button" class="retireButton" value="퇴사"
								style="float: right"></td>
							<td><img
								src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
								width="30" height="30"></td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">정알바</td>
							<td style="min-width: 50pt" align="right">여</td>
							<td style="min-width: 20pt" align="right">960903</td>
							<td><input type="button" class="retireButton" value="퇴사"
								style="float: right"></td>
							<td><img
								src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
								width="30" height="30"></td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">김태훈</td>
							<td style="min-width: 50pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">921108</td>
							<td><input type="button" class="retireButton" value="퇴사"
								style="float: right"></td>
							<td><img
								src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
								width="30" height="30"></td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">장윤석</td>
							<td style="min-width: 50pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">930826</td>
							<td><input type="button" class="retireButton" value="퇴사"
								style="float: right"></td>
							<td><img
								src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
								width="30" height="30"></td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">박파트</td>
							<td style="min-width: 50pt" align="right">여</td>
							<td style="min-width: 20pt" align="right">940530</td>
							<td><input type="button" class="retireButton" value="퇴사"
								style="float: right"></td>
							<td><img
								src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
								width="30" height="30"></td>
						</tr>
					</table>
				</div>

				<h3>퇴사한 직원들</h3>
				<div id="retiredStaffList">

					<table style="width: 200pt; margin-left: -20pt;">
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">강퇴사</td>
							<td style="min-width: 20pt" align="right">여</td>
							<td style="min-width: 20pt" align="right">850228</td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">박그만</td>
							<td style="min-width: 20pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">830311</td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">고만해</td>
							<td style="min-width: 20pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">921208</td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">안해영</td>
							<td style="min-width: 20pt" align="right">여</td>
							<td style="min-width: 20pt" align="right">930915</td>
						</tr>
						<tr>
							<td><img
								src="https://www.puriindahmall.co.id/assets/img/default.png"
								width="30" height="30"></td>
							<td align="left">김이직</td>
							<td style="min-width: 20pt" align="right">남</td>
							<td style="min-width: 20pt" align="right">900330</td>
						</tr>
					</table>
				</div>
			</div>
		</div>  <!-- end tabs3 -->
	</div>
<script>
$(".accordion").css({
});
$(".inline").css({
	"display":"inline"
});
$("#dateMenu").attr({
	"align":"center",
	"style":"align"
});
$("td").css({
	"min-width":"50pt"
});
</script>
</body>
</html>