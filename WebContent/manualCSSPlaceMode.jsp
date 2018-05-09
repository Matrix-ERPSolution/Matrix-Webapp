<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manual</title>
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


li:hover, .selected {
	background-color: #99ccff;
}
</style>
</head>
<body>
      


	<div class="accordion" id="counterControl">카운터</div>
	<div class="panel">
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감 시</span></li>
				<li>싱크대 닦기 <span class="interval" style="float: right;">마감 시</span></li>
				<li>행주 소독 <span class="interval" style="float: right;">마감 시</span></li>
				<li>냉장고 성에 제거 <span class="interval" style="float: right;">1개월</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>시재관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>영업 준비금 환전 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
	</div>
	
	<div class="accordion" id="stockControl">주방</div>
	<div class="panel">
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감 시</span></li>
				<li>싱크대 닦기 <span class="interval" style="float: right;">마감 시</span></li>
				<li>행주 소독 <span class="interval" style="float: right;">마감 시</span></li>
				<li>냉장고 성에 제거 <span class="interval" style="float: right;">1개월</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>재고관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>딸기 재고 확인 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
	</div>
	
	<div class="accordion" id="moneyControl">홀</div>
	<div class="panel">
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>대걸레 청소 <span class="interval" style="float: right;">마감 시</span></li>
				<li>테이블 위 닦기 <span class="interval" style="float: right;">마감 시</span></li>
				<li>쓰레기통 비우기 <span class="interval" style="float: right;">마감 시</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>재고관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>냅킨 재고 채우기 <span class="interval" style="float: right;">3일</span></li>
				<li>빨대 채우기 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
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
    
    var motherPanel = this.parentNode;
    motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";

  });
}


</script>

</body>
</html>
