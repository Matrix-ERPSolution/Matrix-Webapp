<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.accordion{
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

.active, .accordion:hover{
    background-color: #99ccff;
}

.accordion:before{
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel{
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.finisher {
	display: inline;
}
ul {
	margin-left: -20pt;
	list-style: none;
}
li::before {
	font-size: 12pt;
	content: "•";
	color: gray;
	display: inline-block;
	width: 1em;
  	margin-left: -1em
}
li.selected::before {
	color: red;
}
</style>
</head>
<body>
<h2>오늘의 업무</h2>
<div class="accordion" id="personal">개인업무</div>
<div class="panel">
	<ul>
		<li class="selected">보건증 갱신<div class="finisher" style="float: right;">김태훈</div></li>
		<li class="selected">통장사본 제출 <div class="finisher" style="float: right;">홍윤영</div></li>
		<li>연진이 생일 케이크 사오기 (2호) <div class="finisher" style="float: right;">김수한무</div></li>
		<li>일이삼사오육칠팔구십일이삼사오육칠팔구십<div class="finisher" style="float: right;">가나다라</div></li>
	</ul>
</div>

<div class="accordion" id="openTeam">오픈조</div>
<div class="panel" >
	<ul>
		<li>쇼케이스 점등 <div class="finisher" style="float: right;">장윤석</div></li>
		<li>POS기 켜기 <div class="finisher" style="float: right;">장윤석</div></li>
		<li>커피머신 켜기 <div class="finisher" style="float: right;">김태훈</div></li>
		<li>딸기 씻기 <div class="finisher" style="float: right;">장윤석</div></li>
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
