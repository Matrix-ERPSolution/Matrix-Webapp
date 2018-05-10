<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업무 배정</title>
<style>
.accordion, .subAccordion, .subAccordion2 {
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

.active, .accordion:hover, .subAccordion:hover, subAccordion2:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before, .subAccordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel, .subPanel, .subPanel2 {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
li:hover, .selected {
	background-color: #99ccff;
}
hr{
	size: 2px;
	width: 300px;
	float: left;
	color: black;
}
</style>
</head>
<body>
<h2>5월 3일(목)</h2>
<h2>업무 배정</h2>

<div id="taskFromRecommend">
	<h4>오늘의 추천업무</h4>
	<div class="accordion" id="cleanControl">청결관리</div>
	<div class="panel">
		<ul>
			<li>쇼케이스 얼룩 제거 <span class="deadline" style="float: right;">D-1</span></li>
			<li>아이스크림 기계 청소 <span class="deadline" style="float: right;">D-7</span></li>
			<li>냉장고 성에 제거 <span class="deadline" style="float: right;">D-9</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="stockControl">재고관리</div>
	<div class="panel">
		<ul>
			<li>원두 재고 점검 <span class="deadline" style="float: right;">D-2</span></li>
			<li>컵 재고 점검 <span class="deadline" style="float: right;">D-3</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="moneyControl">시재관리</div>
	<div class="panel">
		<ul>
			<li>영업 준비금 환전 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
</div>

<hr> <br>

	<div id="test">아코디언 테스트</div>
	<div class="accordion" id="메뉴1">메뉴1</div>
	<div class="panel">
		<div class="subAccordion" id="메뉴1.1">메뉴1.1</div>
		<div class="subPanel">
			<div class="subAccordion2" id="메뉴1.1.1">메뉴1.1.1</div>
			<div class="subPanel2">
			<ul>
				<li>메뉴1.1.1.1</li>
				<li>메뉴1.1.1.1</li>
			</ul>
			</div>
			<div class="subAccordion2" id="메뉴1.1.2">메뉴1.1.2</div>
			<div class="subPanel2">
			<ul>
				<li>메뉴1.1.2.1</li>
				<li>메뉴1.1.2.2</li>
			</ul>
			</div>
		</div>
	</div>

	<!-- <div id="taskFromManual"><h4>매뉴얼에서 선택하기</h4></div>
		<div class="accordion" id="manualList">매뉴얼 목록</div>
		<div class="panel">
			<div class="subAccordion" id="counterControl">카운터</div>
		<div class="subPanel">
			<div class="subAccordion">
				<div>청결관리</div>
			</div>
			<div class="subPanel" id="kitchenTask">
				<ul>
					<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감시</span></li>
					<li>싱크대 닦기 <span class="interval" style="float: right;">마감시</span></li>
					<li>행주 소독 <span class="interval" style="float: right;">마감시</span></li>
					<li>냉장고 성에 제거 <span class="interval" style="float: right;">1개월</span></li>
				</ul>
			</div>
			<div class="subAccordion">
				<div>시재관리 </div>
			</div>
			<div class="subPanel" id="hallTask">
				<ul>
					<li>영업 준비금 환전 <span class="interval" style="float: right;">3일</span></li>
				</ul>
			</div>
		</div>

		<div class="subAccordion" id="stockControl">주방</div>
		<div class="subPanel">
			<div class="subAccordion">
				<div>청결관리</div>
			</div>
			<div class="subPanel" id="kitchenTask">
				<ul>
					<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감시</span></li>
					<li>싱크대 닦기 <span class="interval" style="float: right;">마감시</span></li>
					<li>행주 소독 <span class="interval" style="float: right;">마감시</span></li>
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
		</div> -->

		<!-- <div class="subAccordion" id="moneyControl">홀 </div>
		<div class="subPanel">
			<div class="subAccordion"><div>청결관리</div></div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>대걸레 청소 <span class="interval" style="float: right;">마감시</span></li>
				<li>테이블 위 닦기 <span class="interval" style="float: right;">마감시</span></li>
				<li>쓰레기통 비우기 <span class="interval" style="float: right;">마감시</span></li>
			</ul>
		</div>
	</div> -->
	
<hr> <br>
<div id="taskFromTyping">
	<h4>직접 입력하기</h4>
	<div id="taskTyping">
		<input type="text" id="addTaskFromTypingInput" placeholder="일시적 업무 입력">
		<button id="addTaskFromTyping">추가</button>
	</div>
</div>

<hr> <br>
<h4>배정할 업무 목록</h4>
<div id="selectedTasks">
	<ul id="selectedTasksList">
	
	</ul>
</div>

<hr> <br>
<h3>총 3가지 업무를 배정합니다.<i class="fa fa-chevron-right" aria-hidden="true" style="margin-left:25px"></i></h3>
</body>
<script>
//acordion 길이만큼 출력 길이 컨트롤
//var anc = document.querySelectorAll(".ancestorAccordion");

var acc = document.querySelectorAll(".accordion");
var subAcc = document.querySelectorAll(".subAccordion");
var subAcc2 = document.querySelectorAll(".subAccordion2");
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

for (i = 0; i < subAcc2.length; i++) {
	subAcc2[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
    
    var motherPanel = this.parentNode;
    var siblingPanel=this.siblingNode;
    motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + siblingPanel.scrollHeight + "px";

  });
}

//업무 리스트 중 1개를 클릭 -> 
var li = document.querySelectorAll("li");
var i;

for (i = 0; i < li.length; i++) {
	li[i].addEventListener("click", function() {
		 this.classList.toggle("selected");
		 if(this.classList.contains("selected")){
			var addLi = document.createElement("li");
	   		var nodes = this.childNodes;
	   		for(var j = 0; j < nodes.length; j++){
	   			addLi.appendChild(nodes[j].cloneNode(true));
	   		}
			document.querySelector("#selectedTasksList").appendChild(addLi);
		 } else {
			 var list = document.querySelector("#selectedTasksList");
			 var li = list.firstChild;
			 for(var j = 0; j < list.childNodes.length-1; j++){
				 li = li.nextElementSibling;
				 if(li.innerHTML == this.innerHTML) {
					 list.removeChild(li);
					 break;
				 }
			 }
		 }
	})
}

//직접 입력하여 업무 추가
var addTask = document.querySelector("#addTaskFromTyping");
addTask.onclick = function(){
	var task = document.querySelector("#addTaskFromTypingInput");
	if(task.value != ""){
		var addLi = document.createElement("li");
		addLi.appendChild(document.createTextNode(task.value));
		document.querySelector("#selectedTasksList").appendChild(addLi);
		task.value = "";
	}
}

//직접 입력한 업무를 리스트에서 지우기

//추가된 업무 갯수 세서 업데이트하기
</script>

</html>
