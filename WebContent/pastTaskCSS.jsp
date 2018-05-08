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

<h2>과거 업무</h2>
<div class="accordion" id="personal">개인업무</div>
<div class="panel">
	<ul>
		<li>포스트잇 사오기 <span class="finisher" style="float: right;">김태훈</span></li>
		<li>열쇠 카운터에 놔두기 <span class="finisher" style="float: right;">홍윤영</span></li>
	</ul>
</div>

<div class="accordion" id="openTeam">오픈조</div>
<div class="panel">
	<ul>
		<li>쇼케이스 점등 <span class="finisher" style="float: right;">장윤석</span></li>
		<li>POS기 켜기 <span class="finisher" style="float: right;">장윤석</span></li>
		<li>커피머신 켜기 <span class="finisher" style="float: right;">김태훈</span></li>
		<li>딸기 씻기 <span class="finisher" style="float: right;">장윤석</span></li>
	</ul>
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
</script>

</body>
</html>
