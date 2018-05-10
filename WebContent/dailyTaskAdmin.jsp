<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- todayTaskAdmin+ pastTaskAdmin+futureTaskAdmin 공통틀 -->
<h2>5월n일 업무</h2>
<div class="accordion" id="personal">개인업무</div>
<div class="panel">
	<ul>
		<li class="selected">task1 <span class="finisher" style="float: right;">staffInCharge1</span></li>
		<li class="selected">task2 <span class="finisher" style="float: right;">staffInCharge2</span></li>
		<li>task3 <div class="finisher" style="float: right;">staffInCharge3</div></li>
	</ul>
</div>

<div class="accordion" id="personal">오픈조</div>
<div class="panel">
	<ul>
		<li class="selected">task1 <span class="finisher" style="float: right;">staffInCharge1</span></li>
		<li class="selected">task2 <span class="finisher" style="float: right;">staffInCharge2</span></li>
		<li>task3 <div class="finisher" style="float: right;">staffInCharge3</div></li>
	</ul>
</div>

<div class="accordion" id="personal">미들조</div>
<div class="panel">
	<ul>
		<li class="selected">task1 <span class="finisher" style="float: right;">staffInCharge1</span></li>
		<li class="selected">task2 <span class="finisher" style="float: right;">staffInCharge2</span></li>
		<li>task3 <div class="finisher" style="float: right;">staffInCharge3</div></li>
	</ul>
</div>

<div class="accordion" id="personal">마감조</div>
<div class="panel">
	<ul>
		<li class="selected">task1 <span class="finisher" style="float: right;">staffInCharge1</span></li>
		<li class="selected">task2 <span class="finisher" style="float: right;">staffInCharge2</span></li>
		<li>task3 <div class="finisher" style="float: right;">staffInCharge3</div></li>
	</ul>
</div>

</body>
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
</html>