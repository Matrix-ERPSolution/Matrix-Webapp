<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>

<h2>오늘의 업무</h2>
<div class="accordion">개인업무</div>
<div class="panel" id="personalTask">
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

<div class="accordion">오픈조</div>
<div class="panel" id="openTeam">
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
			<table>
				<tr>
					<td>딸기 씻기</td>
					<td>장윤석</td>
				</tr>
			</table>
	</div>
</div>

<div class="accordion">미들조</div>
<div class="panel">
</div>

<div class="accordion">마감조</div>
<div class="panel">
</div>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>

</body>
</html>
