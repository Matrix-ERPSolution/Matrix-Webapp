<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.accordion, .subAccordion {
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

.active, .accordion:hover, .subAccordion:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel, .subPanel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
</head>
<body>

<h2>어제 업무</h2>
<div class="accordion">개인업무</div>
<div class="panel" id="personalTask">
	<table>
		<tr>
			<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
			<td>포스트잇 사오기</td>
			<td>김태훈</td>
		</tr>
		<tr>
			<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
			<td>열쇠 카운터에 놔두기</td>
			<td>홍윤영</td>
		</tr>
	</table>
</div>

<div class="accordion">오픈조</div>
<div class="panel" id="openTeam">
	<div class="subAccordion">
		<div>오픈 업무<p class="finisher">홍윤영</p></div>
	</div>
	<div class="subPanel" id="openTask">
		<table>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>쇼케이스 점등</td>
				<td></td>
			</tr>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>POS기 켜기</td>
				<td>장윤석</td>
			</tr>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>커피머신 켜기</td>
				<td>김태훈</td>
			</tr>
		</table>
	</div>
	<div class="SubAccordion">
		<div>재료 준비</div>
	</div>
	<div class="subPanel" id="ingredientReady">
			<table>
				<tr>
					<td>딸기 씻기</td>
					<td>장윤석</td>
				</tr>
			</table>
	</div>
</div>

<div class="accordion" id="middleTeam">미들조</div>
<div class="panel">
</div>

<div class="accordion" id="closeTeam">마감조</div>
<div class="panel">
</div>

<script>
var acc = document.querySelectorAll(".accordion");
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

var subAcc = document.querySelectorAll(".subAccordion");

for (i = 0; i < subAcc.length; i++) {
	subAcc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
 	
    //내가속한 상위패널 불러와서 maxHeight조정하기
    var motherPanel = document.querySelector(".accordion .active").nextElementSibling;
    console.log(motherPanel);
    motherPanel = motherPanel[motherPanel.length-1];

    if (motherPanel.style.maxHeight){
    	motherPanel.style.maxHeight = null;
    } else {
    	motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";
    } 
  });
}
</script>

</body>
</html>
