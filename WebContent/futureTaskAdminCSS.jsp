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

.editButton{
    font-weight: bold;
    float: right;
    margin-right: 5px;
}

li:hover, .selected {
	background-color: #99ccff;
}
</style>
</head>
<body>
<h2>내일 업무</h2>

	<div class="accordion" id="stockControl">개인업무 </div>
	<div class="panel">
		<ul>
			<li>연진이 생일케이크 사오기<span class="interval" style="float: right;">김연진</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="cleanControl">오픈조</div>
	<div class="panel">
		<div class="subAccordion">
			<div>오픈업무</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>쇼케이스 점등 <span class="interval" style="float: right;">마감 시</span></li>
				<li>POS기 켜기 <span class="interval" style="float: right;">마감 시</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>재료준비 </div>
		</div>
	</div>
	
	<div class="accordion" id="stockControl">미들조</div>
	<div class="panel">
		<ul>
			<li>미들업무 <span class="interval" style="float: right;">4일</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="moneyControl">마감조 </div>
	<div class="panel">
		<ul>
			<li>마감업무 <span class="interval" style="float: right;">3일</span></li>
		</ul>
	</div>


<div id="selectedTasks">
	<ul id="selectedTasksList">	
	</ul>
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
/* 
var li = document.querySelectorAll("li");
var i;

for (i = 0; i < li.length; i++) {
	li[i].addEventListener("click", function() {
   		this.className += " selected";
   		var addLi = document.createElement("li");
   		var nodes = this.childNodes;
   		for(var j = 0; j < nodes.length; j++){
   			addLi.appendChild(nodes[j].cloneNode(true));
   		}
		document.querySelector("#selectedTasksList").appendChild(addLi);
	})
}

var addTask = document.querySelector("#addTaskFromTyping");
addTask.onclick = function(){
	var task = document.querySelector("#addTaskFromTypingInput");
	if(task.value != ""){
		var addLi = document.createElement("li");
		addLi.appendChild(document.createTextNode(task.value));
		document.querySelector("#selectedTasksList").appendChild(addLi);
		task.value = "";
	}
} */
</script>

</body>
</html>
